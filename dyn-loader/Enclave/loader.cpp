typedef unsigned long addr_t;

//extern char __sgx_start;        /* defined in the linker script */
//extern char __sgx_end;          /* defined in the linker script */

extern char __sgx_code;         /* defined in the linker script */
extern char __elf_end;		/* defined in the linker script */
#define _SGX_SIZE 0x2000000
#define _SGXCODE_BASE ((void*)&__sgx_code)
#define _SGXDATA_BASE ((void*)((addr_t)&__sgx_code + __sgx_data_ofs))

/* shawn233: program start has been changed to __sgx_code,
 * program_size is set to 0 although it may be useless */
unsigned char *program = (unsigned char *)&__sgx_code;
size_t program_size = 0;

#include <endian.h>
#if BYTE_ORDER == BIG_ENDIAN
# define byteorder ELFDATA2MSB
#elif BYTE_ORDER == LITTLE_ENDIAN
# define byteorder ELFDATA2LSB
#else
# error "Unknown BYTE_ORDER " BYTE_ORDER
# define byteorder ELFDATANONE
#endif

#define GET_OBJ(type, offset) \
	reinterpret_cast<type*>( reinterpret_cast<size_t>(program) \
			+ static_cast<size_t>(offset) )
#define CHECK_SIZE(obj, size) \
	((addr_t)obj + size <= (addr_t)program + program_size)

static Elf64_Ehdr *pehdr;
static Elf64_Shdr *pshdr;
static size_t n_symtab, _n_symtab = 1;
static Elf64_Sym *symtab;
char *strtab;
static Elf64_Sym *main_sym;

//Weijie: add main_index
int main_index;

/*
 * After loading the metadata,
 * rel.r_offset = [ the index of the relocation source : the offset from the source ]
 */
size_t n_rel;               /* # of relocation tables */
size_t *n_reltab;           /* # of relocation entry */
static Elf64_Rela **reltab; /* array of pointers to relocation tables */
#define REL_DST_NDX(ofs) ((ofs) >> 32)
#define REL_DST_OFS(ofs) ((ofs) & 0xffffffff)
#define REL_OFFSET(ndx, ofs) ((((unsigned long)(ndx)) << 32) | ((unsigned long)(ofs)))

uint64_t rounddown(uint64_t align, uint64_t n)
{
	return (n / align) * align;
}

static uint32_t get_rand(void)
{
	uint32_t val;
	sgx_read_rand((unsigned char *)&val, sizeof(uint32_t));
	return val;
}

void *reserve_data(size_t size, size_t align)
{
	//dlog("%u: entering reserve_data else part...", __LINE__);
	static void *data_end = _SGXDATA_BASE;
	void *ret = (void *)rounddown(align, (addr_t)data_end+(align-1));
	data_end = (void *)((addr_t)ret+rounddown(align, size+(align-1)));
	return ret;
}

bool is_available(uint8_t *base, size_t index, size_t size)
{
	for (unsigned i = 0;i < size;++i)
		if (base[index+i]) return false;
	return true;
}

void *reserve_code(size_t size, size_t align)
{
	//dlog("%u: entering reserve_code else part...", __LINE__);
	static void *code_end = _SGXCODE_BASE;
	void *ret = (void *)rounddown(align, (addr_t)code_end+(align-1));
	code_end = (void *)((addr_t)ret+rounddown(align, size+(align-1)));
	return ret;
}

void *reserve(Elf64_Xword flags, size_t size, size_t align)
{
	if (flags & 0x4) return reserve_code(size, align);
	return reserve_data(size, align);
}

#define STR_EQUAL(s1, s2, n) \
	str_equal((const uint8_t *)(s1), (const uint8_t *)(s2), (n))
uint8_t str_equal(const uint8_t *s1, const uint8_t *s2, size_t n) {
	for (unsigned i = 0;i < n;++i)
		if (s1[i] != s2[i])
			return 0;
	return 1;
}
static void validate_ehdr(void)
{
	static const unsigned char expected[EI_NIDENT] =
	{
		[EI_MAG0] = ELFMAG0,
		[EI_MAG1] = ELFMAG1,
		[EI_MAG2] = ELFMAG2,
		[EI_MAG3] = ELFMAG3,
		[EI_CLASS] = ELFCLASS64,
		[EI_DATA] = byteorder,
		[EI_VERSION] = EV_CURRENT,
		[EI_OSABI] = ELFOSABI_SYSV,
		[EI_ABIVERSION] = 0
	};

	if ((pehdr = GET_OBJ(Elf64_Ehdr, 0)) == NULL)
		dlog("%u: Ehdr size", __LINE__);

	if (!str_equal(pehdr->e_ident, expected, EI_ABIVERSION)
			|| pehdr->e_ident[EI_ABIVERSION] != 0
			|| !str_equal(&pehdr->e_ident[EI_PAD], &expected[EI_PAD],
				EI_NIDENT - EI_PAD))
		dlog("%u: Ehdr ident", __LINE__);

	if (pehdr->e_version != EV_CURRENT)
		dlog("%u: Ehdr version", __LINE__);

	/* ELF format check - relocatable */
	if (pehdr->e_type != ET_REL)
		dlog("%u: Ehdr not relocatable", __LINE__);

	/* check the architecture - currently only support x86_64 */
	if (pehdr->e_machine != EM_X86_64)
		dlog("%u: Ehdr not x86_64", __LINE__);

	if (pehdr->e_shentsize != sizeof (Elf64_Shdr))
		dlog("%u: Shdr entry size", __LINE__);
}

void *get_buf(size_t size) {
	static addr_t heap_end = _HEAP_BASE;
	void *ret = (void *)heap_end;
	heap_end = heap_end + size;
	return ret;
}

/* search (section SE, OFS) from symtab - binary search can be applied */
static unsigned search(const Elf64_Half se, const Elf64_Addr ofs)
{
	//Weijie: debugging
	dlog("debugging line: %u, entering search()", __LINE__);
	dlog("se: %u, ofs: %u", se, ofs);
	// assuming that symbols are already sorted
	for (unsigned int i = 0; i < n_symtab; ++i) {
		//dlog("n_symtab: %u, i: %u", n_symtab, i);
		//dlog("symtab[i].st_shndx: %u, symtab[i].st_value: %u", symtab[i].st_shndx, symtab[i].st_value);
		//dlog("symtab[i+1].st_shndx: %u, symtab[i+1].st_value: %u", symtab[i+1].st_shndx, symtab[i+1].st_value);
		if (symtab[i].st_shndx == se && symtab[i].st_value <= ofs
				&& (i+1 >= n_symtab || symtab[i+1].st_value > ofs
					|| symtab[i+1].st_shndx != se)) return i;
	}
	return -1;
}

static void update_reltab(void)
{
	/* read shdr */
	/* shawn233: CHECK_SIZE is useless in our project*/
	if ((pshdr = GET_OBJ(Elf64_Shdr, pehdr->e_shoff)) == NULL)
			//|| !CHECK_SIZE(pshdr, pehdr->e_shnum*sizeof(Elf64_Shdr)))
		dlog("%u: Shdr size", __LINE__);

	/* pointers to symbol, string, relocation tables */
	n_rel = 0;
	//Weijie: test
	dlog("debugging line: %u, entering update_reltab()", __LINE__);
	dlog("pehdr->e_shnum: %u", pehdr->e_shnum);

	for (unsigned i = 0; i < pehdr->e_shnum; ++i) {
		if (pshdr[i].sh_type == SHT_RELA) ++n_rel;
		else if (pshdr[i].sh_type == SHT_SYMTAB) {
			symtab = GET_OBJ(Elf64_Sym, pshdr[i].sh_offset);
			n_symtab = pshdr[i].sh_size / sizeof(Elf64_Sym);
		} else if (pshdr[i].sh_type == SHT_STRTAB)
			strtab = GET_OBJ(char, pshdr[i].sh_offset);
	}

	n_reltab = (size_t *)get_buf(n_rel * sizeof(size_t));
	reltab = (Elf64_Rela **)get_buf(n_rel * sizeof(Elf64_Rela *));
	n_rel = 0;

	dlog("debugging line: %u, symtab n_symtab strtab got", __LINE__);

	for (unsigned i = 0; i < pehdr->e_shnum; ++i) {
		if (pshdr[i].sh_type == SHT_RELA && pshdr[i].sh_size) {
			reltab[n_rel] = GET_OBJ(Elf64_Rela, pshdr[i].sh_offset);
			n_reltab[n_rel] = pshdr[i].sh_size / sizeof(Elf64_Rela);

			dlog("reltab[%u] got, n_reltab[%u] got", n_rel, n_rel);

			/* update relocation table: r_offset --> dst + offset */
			// assert(GET_OBJ(pshdr[pshdr[i].sh_link].sh_offset) == symtab);
			for (size_t j = 0; j < n_reltab[n_rel]; ++j) {
				//Weijie: debugging
				dlog("j: %u", j);
				dlog("n_reltab[n_rel]: %u", n_reltab[n_rel]);
				unsigned dst = search(pshdr[i].sh_info, reltab[n_rel][j].r_offset);
				//Weijie: the following line may crash if the target program is compiled wrongly ...
				dlog("after searching, dst: %u", dst);
				reltab[n_rel][j].r_offset =
					REL_OFFSET(dst, reltab[n_rel][j].r_offset - symtab[dst].st_value);
			}
			++n_rel;

		}
	}
}

static void fill_zero(char *ptr, Elf64_Word size) {
	while (size--) ptr[size] = 0;
}
static void cpy(char *dst, char *src, size_t size) {
	while (size--) dst[size] = src[size];
}

#include "ocall_stub.cpp"
#include "ocall_stub_table.cpp"
static unsigned char find_special_symbol(const char* name, const size_t i)
{
	if (STR_EQUAL(name, "dep.bdr\0", 8)) {
		symtab[i].st_value = (Elf64_Addr)_SGXDATA_BASE;
		symtab[i].st_size = 0;
		dlog("%s", &strtab[symtab[i].st_name]);
		return 1;
	} else if (STR_EQUAL(name, "ocall.bdr\0", 10)) {
		symtab[i].st_value = (Elf64_Addr)_SGXCODE_BASE;
		symtab[i].st_size = 0;
		dlog("%s", &strtab[symtab[i].st_name]);
		return 1;
	} else if (STR_EQUAL(name, "sgx_ocall.loader\0", 14)) {
		symtab[i].st_value = (Elf64_Addr)do_sgx_ocall;
		dlog("%s: %lx", &strtab[symtab[i].st_name], symtab[i].st_value);
		return 1;
	} else if (STR_EQUAL(name, "rand_internal\0", 14)) {
		symtab[i].st_value = (Elf64_Addr)get_rand;
		dlog("%s: %lx", &strtab[symtab[i].st_name], symtab[i].st_value);
		return 1;
	} else if (STR_EQUAL(name, "_stack\0", 7)) {
		symtab[i].st_value = (Elf64_Addr)reserve_data(symtab[i].st_size, 64);
		dlog("%s: %lx", &strtab[symtab[i].st_name], symtab[i].st_value);
		return 1;
	}
	return 0;
}

static void load(void)
{
	Elf64_Addr last_off = (Elf64_Addr)-1;
	Elf64_Addr last_st_value = (Elf64_Addr)-1;
	Elf64_Xword last_size = 0;
	unsigned shndx = -1;

	//Weijie: ignore filename ABS
	//Weijie: test if i could start with 2
	for (unsigned i = 1; i < n_symtab; ++i, ++_n_symtab) {
	//for (unsigned i = 2; i < n_symtab; ++i, ++_n_symtab) {
		if (shndx != symtab[i].st_shndx) {
			last_off = (Elf64_Addr)-1;
			last_st_value = (Elf64_Addr)-1;
			last_size = 0;
			shndx = symtab[i].st_shndx;
		}

		unsigned char found = symtab[i].st_name ?
			find_special_symbol(&strtab[symtab[i].st_name], i) : 0;

		//Weijie: the following line would crash ...
		//dlog("%u: ---test---", __LINE__);
		//dlog("%u: i in symtab[i]", i);
		/* special shndx --> assumption: no abs, no undef */
		if (symtab[i].st_shndx == SHN_COMMON && !found) {

			symtab[i].st_value = (Elf64_Addr)reserve(0, symtab[i].st_size, symtab[i].st_value);
			fill_zero((char *)symtab[i].st_value, symtab[i].st_size);
		} else if (!found) {
			Elf64_Addr symoff = pshdr[symtab[i].st_shndx].sh_offset + symtab[i].st_value;
			/* potentially WEAK bind */
			if (last_off <= symoff && symoff < (last_off + last_size)) {
				symtab[i].st_value = last_st_value + symoff - last_off;
			} else {
				/* find main */

				//Weijie: checking if loader could find main()...
				//dlog("%u: finding main...", __LINE__);
				dlog("symoff: %u, pehdr e_entry: %u", symoff, pehdr->e_entry);
				if (symoff == pehdr->e_entry) {
					main_sym = &symtab[i];
					//Weijie: record i
					main_index = i;
				}

				symtab[i].st_value = (Elf64_Addr)reserve(pshdr[symtab[i].st_shndx].sh_flags,
						symtab[i].st_size, pshdr[symtab[i].st_shndx].sh_addralign);

				/* fill zeros for .bss section .. otherwise, copy from file */
				if (pshdr[symtab[i].st_shndx].sh_type == SHT_NOBITS) {
					fill_zero((char *)symtab[i].st_value, symtab[i].st_size);
				} else {
					cpy((char *)symtab[i].st_value, GET_OBJ(char, symoff), symtab[i].st_size);

					/* update last values */
					last_size = symtab[i].st_size;
					last_off = symoff;
					last_st_value = symtab[i].st_value;
				}

				/*
				//Weijie: store main data
				if (symoff == pehdr->e_entry) {
				dlog("copy data from symoff: %u, pehdr e_entry: %u", symoff, pehdr->e_entry);
				//Weijie: copy data, but without reserve, will crash
				cpy((char *)main_sym, (char *)symtab[i].st_value, symtab[i].st_size);
				}
				*/

			}
		}

		dlog("sym %04u/%d %08lx", i, n_symtab, (unsigned long)symtab[i].st_value);
	}
}

static void relocate(void)
{
	for (unsigned k = 0; k < n_rel; ++k)
		for (unsigned i = 0; i < n_reltab[k]; ++i) {
			//Weijie: test
			//dlog("%u ---checking---reltab[k][i]", __LINE__);
			unsigned int ofs = REL_DST_OFS(reltab[k][i].r_offset);
			unsigned int dst_sym = REL_DST_NDX(reltab[k][i].r_offset);
			unsigned int src_sym = ELF64_R_SYM(reltab[k][i].r_info);
			const unsigned int type = ELF64_R_TYPE(reltab[k][i].r_info);

			//The following line may crash
			//dlog("%u: dst_sym", dst_sym);
			addr_t dst = (addr_t)symtab[dst_sym].st_value + (addr_t)ofs;

			dlog("rel[%04u] %04u (%08lx) --> %04u", i, dst_sym, dst, src_sym);
			if (type == R_X86_64_64) {
				/* word 64 */
				*(addr_t *)dst = symtab[src_sym].st_value + reltab[k][i].r_addend;
				dlog("%lx", *(addr_t *)dst);
			} else if (type == R_X86_64_32) {
				/* word 32 */
				*(uint32_t*)dst = (uint32_t)(symtab[src_sym].st_value + reltab[k][i].r_addend);
				dlog("%x", *(uint32_t *)dst);
			} else if (type == R_X86_64_32S) {
				/* word 32 */
				*(int32_t*)dst = (int32_t)(symtab[src_sym].st_value + reltab[k][i].r_addend);
				dlog("%x", *(int32_t *)dst);
			} else if (type == R_X86_64_PC32 || type == R_X86_64_PLT32) {
				/* word 32 */
				*(uint32_t*)dst = (uint32_t)(symtab[src_sym].st_value
						- dst + reltab[k][i].r_addend);
				dlog("%x", *(uint32_t *)dst);
			} else if (type == R_X86_64_GOTPCREL) {
				/* word 32 */
				*(uint32_t*)dst = (uint32_t)((Elf64_Addr)&(symtab[src_sym].st_value)
						- dst + reltab[k][i].r_addend);
				dlog("%x", *(uint32_t *)dst);
			} else
				dlog("%u: Relocation -- not supported type %u", __LINE__, type);
		}
}

//#include "checker_part.cpp"
/*
 * Weijie: add checker/disassembler here if necessary
 * Usage: cs_disasm_entry(unsigned char* buf_test, ...);
 */

//Weijie: Enclave starts here
void ecall_receive_binary(unsigned char *binary, int sz)
{
	program = (unsigned char*) binary;
	void (*entry)();
	dlog("program at %p (%lx)", program, program_size);
	dlog(".sgxcode = %p", _SGXCODE_BASE);
	dlog(".sgxdata = %p", _SGXDATA_BASE);
	sgx_push_gadget((unsigned long)_SGXCODE_BASE);
	sgx_push_gadget((unsigned long)_SGXDATA_BASE);

	//dlog("__sgx_start = %p", &__sgx_start);
	//dlog("__sgx_end = %p", &__sgx_end);
	dlog("__sgx_code = %p", &__sgx_code);
	dlog("__elf_end = %p", &__elf_end);
	dlog("heap base = %lx", _HEAP_BASE);

	validate_ehdr();
	update_reltab();
	pr_progress("loading");
	load();

	//Weijie: cannot simply delete relocation in original sgx-shield demo
	//Weijie: cannot delete the following lines in current demo
	pr_progress("relocating");
	relocate();

	entry = (void (*)())(main_sym->st_value);
	dlog("main: %p", entry);

	pr_progress("entering");

	//Weijie: the asm inline commands could be commented
	__asm__ __volatile__( "push %%r13\n" "push %%r14\n" "push %%r15\n" ::);
	entry();
	__asm__ __volatile__( "pop %%r15\n" "pop %%r14\n" "pop %%r13\n" ::);
	pr_progress("returning");
	
}

#include <trts_internal.h>
#include <trts_util.h>

/* shawn233: enclave_main will not be invoked */
void enclave_main()
{	
	pr_progress("Hello from enclave_main!");
	void (*entry)();
	
	//To-do
	//Weijie: Here we alloc a heap buffer for target binary
	
	dlog("program at %p (%lx)", program, program_size);
	dlog(".sgxcode = %p", _SGXCODE_BASE);
	dlog(".sgxdata = %p", _SGXDATA_BASE);
	sgx_push_gadget((unsigned long)_SGXCODE_BASE);
	sgx_push_gadget((unsigned long)_SGXDATA_BASE);

	//dlog("__sgx_start = %p", &__sgx_start);
	//dlog("__sgx_end = %p", &__sgx_end);
	dlog("__sgx_code = %p", &__sgx_code);
	dlog("__elf_end = %p", &__elf_end);
	dlog("heap base = %lx", _HEAP_BASE);

	validate_ehdr();
	update_reltab();
	pr_progress("loading");
	load();

	//Weijie: cannot simply delete relocation in original sgx-shield demo
	//Weijie: cannot delete the following lines in current demo
	pr_progress("relocating");
	relocate();

#if 0
	//Weijie: checker starts here.
	/*
	   PrintDebugInfo("-----setting params-----\n");
	   Elf64_Xword textSize;
	   textSize = main_sym->st_size;
	   Elf64_Addr textAddr;
	   textAddr = main_sym->st_value;
	   unsigned char* buf = (unsigned char *)malloc(textSize);
	   cpy((char *)buf, (char *)symtab[main_index].st_value, symtab[main_index].st_size);
	   dlog("textAddr: %p, textSize: %u", textAddr, textSize);
	   int rv;
	   rv = cs_disasm_entry(buf, textSize, textAddr);
	   free(buf);
	 */

	pr_progress("disassembling all parts");

	int j;
	int rv;
	Elf64_Xword textSize;
	Elf64_Addr textAddr;
	unsigned char* buf;
	//Weijie: assume j >= 3
	for (j = 2; j < n_symtab - 1; j++){
		textSize = symtab[j].st_size;
		if (textSize > 0){
			PrintDebugInfo("-----setting params-----\n");
			textAddr = symtab[j].st_value;
			buf = (unsigned char *)malloc(textSize);
			//Weijie: fill in buf
			cpy((char *)buf, (char *)symtab[j].st_value, symtab[j].st_size);
			dlog("textAddr: %p, textSize: %u", textAddr, textSize);
			rv = cs_disasm_entry(buf, textSize, textAddr);
			free(buf);
		}
	}
	if (rv == 0){
		//Weijie: proceed
	}	
#endif
	pr_progress("getting enclave bounds");
	void *this_enclave_base = get_enclave_base();
	size_t this_enclave_size = get_enclave_size();
	dlog("base: 0x%x, size: 0x%x", this_enclave_base, this_enclave_size);

	//To-do
	//Weijie: Here we alloc a heap buffer for target binary

	entry = (void (*)())(main_sym->st_value);
	dlog("main: %p", entry);

	pr_progress("entering");

	//Weijie: the asm inline commands could be commented
	__asm__ __volatile__( "push %%r13\n" "push %%r14\n" "push %%r15\n" ::);
	entry();
	__asm__ __volatile__( "pop %%r15\n" "pop %%r14\n" "pop %%r13\n" ::);
	pr_progress("returning");
}
