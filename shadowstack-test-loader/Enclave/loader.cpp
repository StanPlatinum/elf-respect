typedef unsigned long addr_t;

extern char __ss_start;         /* defined in the linker script */
extern char __cfi_start;         /* defined in the linker script */

extern char __elf_start;         /* defined in the linker script */
extern char __elf_end;		/* defined in the linker script */

#define _SGXCODE_BASE ((void*)((addr_t)&__elf_start + __sgx_code_ofs))
#define _SGXDATA_BASE ((void*)(_SGXCODE_BASE + __sgx_data_ofs))

/* 
 * Weijie & shawn233: program start has been changed to __elf_start,
 * program_size is set to 0 although it may be useless 
 */
char *program = (char *)&__elf_start;
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
	//Weijie:
	//dlog("xxx heap end after get_buf: 0x%lx", heap_end);
	return ret;
}

/* search (section SE, OFS) from symtab - binary search can be applied */
static unsigned search(const Elf64_Half se, const Elf64_Addr ofs)
{
	//Weijie: debugging
	//dlog("debugging line: %u, entering search()", __LINE__);
	//dlog("se: %u, ofs: %u", se, ofs);
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
	/* shawn233: CHECK_SIZE is useless in our project */
	if ((pshdr = GET_OBJ(Elf64_Shdr, pehdr->e_shoff)) == NULL)
			//|| !CHECK_SIZE(pshdr, pehdr->e_shnum*sizeof(Elf64_Shdr)))
		dlog("%u: Shdr size", __LINE__);

	/* pointers to symbol, string, relocation tables */
	n_rel = 0;

	for (unsigned i = 0; i < pehdr->e_shnum; ++i) {
		if (pshdr[i].sh_type == SHT_RELA) ++n_rel;
		else if (pshdr[i].sh_type == SHT_SYMTAB) {
			symtab = GET_OBJ(Elf64_Sym, pshdr[i].sh_offset);
			n_symtab = pshdr[i].sh_size / sizeof(Elf64_Sym);
		} else if (pshdr[i].sh_type == SHT_STRTAB)
			strtab = GET_OBJ(char, pshdr[i].sh_offset);
	}

	n_reltab = (size_t *)get_buf(n_rel * sizeof(size_t));
	//Weijie: allocate reltab
	reltab = (Elf64_Rela **)get_buf(n_rel * sizeof(Elf64_Rela *));
	
	//Weijie:
	//dlog("xxx in update_reltab 1 pehdr e_entry: %lx", pehdr->e_entry);
	for(int k = 0; k < n_rel; k++)
	{
		reltab[k] = (Elf64_Rela *)get_buf(n_reltab[k] * sizeof(Elf64_Rela));
	}

	n_rel = 0;
	
	//Weijie:
	//dlog("xxx in update_reltab 2 pehdr e_entry: %lx", pehdr->e_entry);
	//dlog("xxx in update_reltab symtab is 0x%lx, reltab is 0x%lx, pehdr is 0x%lx", (void *)symtab, (void *)reltab, (void *)pehdr);

	for (unsigned i = 0; i < pehdr->e_shnum; ++i) {
		if (pshdr[i].sh_type == SHT_RELA && pshdr[i].sh_size) {
			
			//Weijie:
			//dlog("xxx n_rel: %u", n_rel);
			//dlog("xxx before GET_OBJ, i:%u pehdr: 0x%lx, e_entry: %lx, reltab[n_rel]: 0x%lx", i, (void *)pehdr, pehdr->e_entry, reltab[n_rel]);

			reltab[n_rel] = GET_OBJ(Elf64_Rela, pshdr[i].sh_offset);
			
			//Weijie:
			//dlog("xxx after  GET_OBJ, i:%u pehdr: 0x%lx, e_entry: %lx, reltab[n_rel]: 0x%lx", i, (void *)pehdr, pehdr->e_entry, reltab[n_rel]);

			n_reltab[n_rel] = pshdr[i].sh_size / sizeof(Elf64_Rela);

			/* update relocation table: r_offset --> dst + offset */
			// assert(GET_OBJ(pshdr[pshdr[i].sh_link].sh_offset) == symtab);
			for (size_t j = 0; j < n_reltab[n_rel]; ++j) {
				unsigned dst = search(pshdr[i].sh_info, reltab[n_rel][j].r_offset);
				
				//Weijie:
				//dlog("xxx after  search, j:%u pehdr: 0x%lx, e_entry: %lx, reltab[n_rel]: 0x%lx", j, (void *)pehdr, pehdr->e_entry, reltab[n_rel]);
				
				reltab[n_rel][j].r_offset =
					REL_OFFSET(dst, reltab[n_rel][j].r_offset - symtab[dst].st_value);
				
				//Weijie:
				//dlog("xxx after REL_OFF, j:%u pehdr: 0x%lx, e_entry: %lx, reltab[n_rel]: 0x%lx", j, (void *)pehdr, pehdr->e_entry, reltab[n_rel]);
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
	//for (unsigned i = 2; i < n_symtab; ++i, ++_n_symtab) {
	for (unsigned i = 1; i < n_symtab; ++i, ++_n_symtab) {
		if (shndx != symtab[i].st_shndx) {
			last_off = (Elf64_Addr)-1;
			last_st_value = (Elf64_Addr)-1;
			last_size = 0;
			shndx = symtab[i].st_shndx;
		}

		unsigned char found = symtab[i].st_name ?
			find_special_symbol(&strtab[symtab[i].st_name], i) : 0;

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
				dlog("i: %u, symoff: %lx, pehdr e_entry: %lx", i, symoff, pehdr->e_entry);
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


			}
		}
		dlog("sym %04u/%d %08lx", i, n_symtab, (unsigned long)symtab[i].st_value);
	}
}

static void relocate(void)
{
	for (unsigned k = 0; k < n_rel; ++k)
		for (unsigned i = 0; i < n_reltab[k]; ++i) {
			unsigned int ofs = REL_DST_OFS(reltab[k][i].r_offset);
			unsigned int dst_sym = REL_DST_NDX(reltab[k][i].r_offset);
			unsigned int src_sym = ELF64_R_SYM(reltab[k][i].r_info);
			const unsigned int type = ELF64_R_TYPE(reltab[k][i].r_info);

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

/* Weijie: add shadow stack pointer */
char *shadow_stack = (char *)&__ss_start;

/* Weijie: add target table pointer */
char *target_table = (char *)&__cfi_start;
size_t target_table_size = 0;

/* shawn233: my simple implementation of strncmp(), maybe insecure, please replace it with a trusted version */
int my_strncmp(char *str1, char *str2, size_t n) {
	bool flag = true;
	for (unsigned i = 0; i < n; ++ i) {
		if (str1[i] != str2[i]) {
			flag = false;
			break;
		}
	}
	if (flag) return 0; // return 0 if strings are equal
	else return -1; // return -1 otherwise 
}

/* shawn233: my implementation of strlen(), maybe insecure, please replace it with a secure version */
size_t my_strlen(char *str) {
	size_t sz = 0;
	for (; str[sz] != '\0'; ++ sz);
	return sz;
}

/* shawn233: given symbol name, search symbol table and return symtab.st_value */
Elf64_Addr search_symtab_by_name(char *name, size_t l) {
	for (unsigned i = 1; i < n_symtab; ++ i) {
		if (my_strncmp(name, &strtab[symtab[i].st_name], l) == 0)
			return symtab[i].st_value;
	}
	return 0;
}

void ecall_receive_entrylabel(char *entrylabel, int sz)
{
	cpy(target_table, entrylabel, (size_t)sz);
	target_table_size = sz;

	// shawn233: in function load, symtab[i].st_value has been updated to the address of symbols
	// so we can directly replace symbols to these addresses

	Elf64_Addr *call_target = (Elf64_Addr *)reserve_data(sz*sizeof(Elf64_Addr), 64);
	unsigned call_target_idx = 0;
	
	for (unsigned i = 0; i < sz; ++ i) {
                if (entrylabel[i] == '\n') entrylabel[i] = '\0';
        }

        unsigned buffer_idx = 0;
        for (unsigned i = 0; i < sz; ++ i) {
                if (entrylabel[i] == '\0') {
                        dlog("entry label: %s", entrylabel+buffer_idx);
                        call_target[call_target_idx ++] = search_symtab_by_name(entrylabel+buffer_idx, my_strlen(entrylabel+buffer_idx));
			dlog("call target address: 0x%lx", call_target[call_target_idx-1]);
			buffer_idx = i+1;
                }
        }	
}

//Weijie: Enclave starts here
void ecall_receive_binary(char *binary, int sz)
{
	//Weijie: v1: do not use the following line
	//program = (char*) binary;
	cpy(program, binary, (size_t)sz);
	program_size = sz;

	void (*entry)();
	dlog("program at %p (%lu)", program, program_size);
	dlog(".sgxcode = %p", _SGXCODE_BASE);
	dlog(".sgxdata = %p", _SGXDATA_BASE);
	sgx_push_gadget((unsigned long)_SGXCODE_BASE);
	sgx_push_gadget((unsigned long)_SGXDATA_BASE);

	validate_ehdr();
	
	update_reltab();
	
	pr_progress("loading");
	load();

	//Weijie: cannot simply delete relocation in original sgx-shield demo
	//Weijie: cannot delete the following lines in current demo
	pr_progress("relocating");
	relocate();

	entry = (void (*)())(main_sym->st_value);
	
	//Weijie:
	dlog("main: %p", entry);

	pr_progress("entering");

	//Weijie: the asm inline commands could be commented
	__asm__ __volatile__( "push %%r13\n" "push %%r14\n" "push %%r15\n" ::);
	entry();
	__asm__ __volatile__( "pop %%r15\n" "pop %%r14\n" "pop %%r13\n" ::);
	pr_progress("returning");
	
}

