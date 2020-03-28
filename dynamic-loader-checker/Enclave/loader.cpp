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


/* Weijie: add shadow stack pointer */
char *shadow_stack = (char *)&__ss_start;

/* Weijie: add target table pointer */
char *target_table = (char *)&__cfi_start;
size_t target_table_size = 0;
Elf64_Addr *call_target;

#include <endian.h>
#if BYTE_ORDER == BIG_ENDIAN
#define byteorder ELFDATA2MSB
#elif BYTE_ORDER == LITTLE_ENDIAN
#define byteorder ELFDATA2LSB
#else
#error "Unknown BYTE_ORDER " BYTE_ORDER
#define byteorder ELFDATANONE
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
	//dlog("heap end after get_buf: 0x%lx", heap_end);
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
	reltab = (Elf64_Rela **)get_buf(n_rel * sizeof(Elf64_Rela *));
	//Weijie: allocate reltab
	/*
	   for(int k = 0; k < n_rel; k++)
	   {
	   reltab[k] = (Elf64_Rela *)get_buf(n_reltab[k] * sizeof(Elf64_Rela));
	   }
	   */
	n_rel = 0;

	//Weijie:
	//dlog("in update_reltab 2 pehdr e_entry: %lx", pehdr->e_entry);
	//dlog("in update_reltab symtab is 0x%lx, reltab is 0x%lx, pehdr is 0x%lx", (void *)symtab, (void *)reltab, (void *)pehdr);

	for (unsigned i = 0; i < pehdr->e_shnum; ++i) {
		if (pshdr[i].sh_type == SHT_RELA && pshdr[i].sh_size) {

			//Weijie:
			//dlog("xxx n_rel: %u", n_rel);
			//dlog("xxx before GET_OBJ, i:%u pehdr: 0x%lx, e_entry: %lx, reltab[n_rel]: 0x%lx", i, (void *)pehdr, pehdr->e_entry, reltab[n_rel]);

			reltab[n_rel] = GET_OBJ(Elf64_Rela, pshdr[i].sh_offset);

			//Weijie:
			//dlog("xxx after GET_OBJ, i:%u pehdr: 0x%lx, e_entry: %lx, reltab[n_rel]: 0x%lx", i, (void *)pehdr, pehdr->e_entry, reltab[n_rel]);

			n_reltab[n_rel] = pshdr[i].sh_size / sizeof(Elf64_Rela);

			/* update relocation table: r_offset --> dst + offset */
			// assert(GET_OBJ(pshdr[pshdr[i].sh_link].sh_offset) == symtab);
			for (size_t j = 0; j < n_reltab[n_rel]; ++j) {
				//dlog("xxx before search, i:%u, pshdr[i].sh_info: 0x%lx, j: %u, reltab[n_rel][j].r_offset: 0x%lx", i, pshdr[i].sh_info, j, reltab[n_rel][j].r_offset);

				unsigned dst = search(pshdr[i].sh_info, reltab[n_rel][j].r_offset);

				//Weijie:
				//dlog("xxx after search, j:%u pehdr: 0x%lx, e_entry: %lx, reltab[n_rel]: 0x%lx", j, (void *)pehdr, pehdr->e_entry, reltab[n_rel]);
				//dlog("xxx before rel_offset, dst: %u", dst);
				//dlog("xxx before rel_offset, reltab[n_rel][j].r_offset: 0x%lx", reltab[n_rel][j].r_offset);
				//dlog("xxx before rel_offset, symtab[dst].st_value: 0x%lx", symtab[dst].st_value);

				reltab[n_rel][j].r_offset =
					REL_OFFSET(dst, reltab[n_rel][j].r_offset - symtab[dst].st_value);

				//Weijie & Xinyu:
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


	for (unsigned h = 1; h < n_symtab; ++h) {		
		//Weijie: record original st_value in .text
		Elf64_Addr last_original_st_value;
		Elf64_Addr this_original_st_value;
		//Weijie: process .text section
		if ( pshdr[symtab[h].st_shndx].sh_type == SHT_PROGBITS && (pshdr[symtab[h].st_shndx].sh_flags & SHF_EXECINSTR) ) {

			this_original_st_value = symtab[h].st_value;
			if ( (symtab[h-1].st_info & 0xf) == STT_NOTYPE && symtab[h-1].st_size == 0 && pshdr[symtab[h-1].st_shndx].sh_type == SHT_PROGBITS && (pshdr[symtab[h-1].st_shndx].sh_flags & SHF_EXECINSTR) ) {
				//Weijie: process NOTYPE symbol
				//dlog("processing NOTYPE symbol[%d] in .text...", h-1);
				symtab[h-1].st_size = this_original_st_value - last_original_st_value;
				//dlog("symbol[%d] real st size: 0x%lx", h-1, symtab[h-1].st_size);

			}
			last_original_st_value = this_original_st_value;
		}
	}

	//Weijie: ignore filename ABS
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
			//Weijie:
			//dlog("processing symbol[%d]...", i);

			Elf64_Addr symoff = pshdr[symtab[i].st_shndx].sh_offset + symtab[i].st_value;
			/* potentially WEAK bind */
			if (last_off <= symoff && symoff < (last_off + last_size)) {
				symtab[i].st_value = last_st_value + symoff - last_off;
			} else {
				//Weijie: checking if loader could find main()...
				//dlog("%u: finding main...", __LINE__);
				//dlog("i: %u, symoff: %lx, pehdr e_entry: %lx", i, symoff, pehdr->e_entry);
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
		//Weijie:
		//dlog("sym %04u/%d %08lx, final st_size: %ld", i, n_symtab, (unsigned long)symtab[i].st_value, (unsigned long)symtab[i].st_size);
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

			//dlog("rel[%04u] %04u (%08lx) --> %04u", i, dst_sym, dst, src_sym);
			if (type == R_X86_64_64) {
				/* word 64 */
				*(addr_t *)dst = symtab[src_sym].st_value + reltab[k][i].r_addend;
				//dlog("%lx", *(addr_t *)dst);
			} else if (type == R_X86_64_32) {
				/* word 32 */
				*(uint32_t*)dst = (uint32_t)(symtab[src_sym].st_value + reltab[k][i].r_addend);
				//dlog("%x", *(uint32_t *)dst);
			} else if (type == R_X86_64_32S) {
				/* word 32 */
				*(int32_t*)dst = (int32_t)(symtab[src_sym].st_value + reltab[k][i].r_addend);
				//dlog("%x", *(int32_t *)dst);
			} else if (type == R_X86_64_PC32 || type == R_X86_64_PLT32) {
				/* word 32 */
				*(uint32_t*)dst = (uint32_t)(symtab[src_sym].st_value
						- dst + reltab[k][i].r_addend);
				//dlog("%x", *(uint32_t *)dst);
			} else if (type == R_X86_64_GOTPCREL) {
				/* word 32 */
				*(uint32_t*)dst = (uint32_t)((Elf64_Addr)&(symtab[src_sym].st_value)
						- dst + reltab[k][i].r_addend);
				//dlog("%x", *(uint32_t *)dst);
			} else
				dlog("%u: Relocation -- not supported type %u", __LINE__, type);
		}
}

/****************************** checker & rewriter part ******************************/
#include <string.h>

//Weijie: for debuging
void PrintDebugInfo(const char *fmt, ...)
{
	char buf[BUFSIZ] = {'\0'};
	va_list ap;
	va_start(ap, fmt);
	vsnprintf(buf, BUFSIZ, fmt, ap);
	va_end(ap);
	ocall_print_string(buf);
}

#include "libelf.h"
#include "libelf_extra_types.h"
#include "capstone_x86.h"

#include <trts_internal.h>
#include <trts_util.h>

#include <capstone/platform.h>
#include <capstone/capstone.h>

/****************************** 1. rewriter part ******************************/

void cpy_imm2addr32(Elf64_Addr *dst, uint32_t src)
{
	//Weijie: write 32 bits
	uint32_t *dst32 = (uint32_t *)dst;
	dst32[0] = src;
	dlog("writting: %llx to %llx", src, (unsigned long long)dst32);
}

//Xinyu & Weijie: assume imm_Addr is a 64 bit bound, and imm_after is a 64 bit int
//Weijie: Can 2nd oprand of cmp be 64 bit? Or should we instrument cmpq?
void cpy_imm2addr64(Elf64_Addr *dst, Elf64_Addr src) {
	//dlog("writting: %llx", src);
	dst[0] = src;
}

void rewrite_imm32(Elf64_Addr imm_Addr, Elf64_Addr imm_after)
{
	//Weijie: convert imm_after to 32 bit format (trunk down to lower 32 bits if needed)
	//Weijie: must take the sign bit into consideration...
	uint32_t imm_after32 = imm_after & 0xffffffff;
	//Weijie: using cpy_imm2addr32
	cpy_imm2addr32((Elf64_Addr *)imm_Addr, imm_after32);
}

/* Given the imm_Addr and the value should be filled in, do the rewritting */
void rewrite_imm(Elf64_Addr imm_Addr, Elf64_Addr imm_after)
{
	//Weijie: imm_Addr should be in program's address space
	//Weijie: using cpy to cover the imm_Addr space with imm_after
	cpy_imm2addr64((Elf64_Addr *)imm_Addr, imm_after);
}

//Weijie: we assume that the instrumented cmp is like 'cmp rax, 0x2f59'.
//Weijie: the offset is the imm oprand offset: (the address of imm subtracts the address of the instruction)
Elf64_Addr get_immAddr(cs_insn single_insn, Elf64_Addr imm_offset)
{
	return single_insn.address + imm_offset;
}
//Weijie: not sure with the upper bound
//Elf64_Addr data_upper_bound = (Elf64_Addr)&__elf_end;
Elf64_Addr data_upper_bound = 0xffffffffffffffff;
//Elf64_Addr data_lower_bound = (Elf64_Addr)_SGXDATA_BASE;
Elf64_Addr data_lower_bound = 0x0000000000000001;
Elf64_Addr stack_upper_bound = 0xffffffffffffffff;
Elf64_Addr stack_lower_bound = 0x0000000000000001;

unsigned call_target_idx_global = 0;

void get_bounds()
{
	//Weijie: get_enclave_base currently not suits for ss-test-enclave
	//void *this_enclave_base = get_enclave_base();
	//size_t this_enclave_size = get_enclave_size();
	//dlog("base: %p, size: 0x%x", this_enclave_base, this_enclave_size);
	//Weijie: TO-DO
	//Weijie: deciding data section bounds
	//Weijie: data_upper/lower_bound should be two global variables.
	dlog("upper bound: %p, lower bound: %p", data_upper_bound, data_lower_bound);
}

/****************************** 2. checker part ******************************/

/*
 *
 * P1: Mem Write
 * P2: RSP Write
 * P3: Shadow Stack
 * P4: Call Graph
 * P5: Mem Read
 * P6
 * P7: T-SGX
 * P8: Hyperrace
 * P9: Multi-user Data Cleansing
 *
 */

Elf64_Addr CFICheck_sym_addr;

Elf64_Addr transBegin_sym_addr;

/****************** P1 & P2 checker ******************/

/* Weijie: if the return value is 1, it means that one of the oprands of insn[j] is rsp */
int find_rsp(cs_insn *ins)
{
	cs_x86 *x86;
	int i, exist = 0;

	if (ins->detail == NULL)	return -2;
	//Weijie: returning -2 means this insn[j] is "data" instruction
	x86 = &(ins->detail->x86);
	if (x86->op_count == 0)		return -1;
	//Weijie: returning -1 means this insn[j] has no oprand
	// traverse all operands
	for (i = 0; i < x86->op_count; i++) {
		cs_x86_op *op = &(x86->operands[i]);
		//Weijie: returning 0 means this insn[j] has no operations on rsp
		//Weijie: returning 1 means this insn[j] does have operations on rsp
		if ((int)op->type == X86_OP_REG && (int)op->reg == X86_REG_RSP && (op->access & CS_AC_WRITE)){
			exist++;
			return 1;
		}
	}
	return exist;

}

/* Weijie: if the return value is 1, then it means that this insn[j] is writting memory */
int find_memory_write(cs_insn *ins)
{
	cs_x86 *x86;
	int i, exist = 0;

	if (ins->detail == NULL)	return -2;
	//Weijie: returning -2 means this insn[j] is "data" instruction
	x86 = &(ins->detail->x86);
	if (x86->op_count == 0)		return -1;
	//Weijie: returning -1 means this insn[j] has no oprand
	// traverse all operands
	for (i = 0; i < x86->op_count; i++) {
		cs_x86_op *op = &(x86->operands[i]);
		//Weijie: returning 0 means this insn[j] has no memory writting
		//Weijie: returning 1 means this insn[j] has memory writting
		if ((int)op->type == X86_OP_MEM && (op->access & CS_AC_WRITE)){
			exist++;
			return 1;
		}
	}
	return exist;
}

/* Weijie: if the return value is 1, then it means that this insn[j] is writting memory and it's safe */
int check_rewrite_memwt(csh ud, cs_mode, cs_insn *ins, cs_insn *forward_ins)
{
	//int memwt_intact = 0;
	int if_memwt = find_memory_write(ins);
	if (if_memwt > 0){
		//Weijie: checking if they are 'movabs rbx, 0ximm', 'cmp rax, rbx' and so on
		if (
			(strncmp("push", forward_ins[0].mnemonic, 4) == 0)	&&
			(strncmp("push", forward_ins[1].mnemonic, 4) == 0)	&&
			(strncmp("pushfq", forward_ins[2].mnemonic, 6) == 0)	&&
			(strncmp("lea", forward_ins[3].mnemonic, 3) == 0)	&&
			(strncmp("movabs", forward_ins[4].mnemonic, 6) == 0)	&&
			(strncmp("cmp", forward_ins[5].mnemonic, 3) == 0)	&&
			(strncmp("ja", forward_ins[6].mnemonic, 2) == 0)	&&
			(strncmp("movabs", forward_ins[7].mnemonic, 6) == 0)	&&
			(strncmp("cmp", forward_ins[8].mnemonic, 3) == 0)	&&
			(strncmp("jb", forward_ins[9].mnemonic, 2) == 0)	&&
			(strncmp("popfq", forward_ins[10].mnemonic, 5) == 0)	&&
			(strncmp("pop", forward_ins[11].mnemonic, 3) == 0)	&&
			(strncmp("pop", forward_ins[12].mnemonic, 3) == 0)
		   ){
			//Weijie: replace 2 imms
			//Weijie: getting the address
			//Elf64_Addr cmp_imm_offset = 2; //cmp 1 byte, rax 1 byte
			Elf64_Addr movabs_imm_offset = 2; //movabs 1 byte, rbx 1 byte?
			Elf64_Addr imm1_addr =  get_immAddr(forward_ins[4], movabs_imm_offset);
			Elf64_Addr imm2_addr =  get_immAddr(forward_ins[7], movabs_imm_offset);
			//Weijie:
			//dlog("imm1 address: %p, imm2 address: %p", imm1_addr, imm2_addr);
			//Weijie: rewritting
			//0x3fffffffffffffff <---> upper bound
			//0x4fffffffffffffff <---> lower bound
			rewrite_imm(imm1_addr, data_upper_bound);
			rewrite_imm(imm2_addr, data_lower_bound);
			//PrintDebugInfo("memory write rewritting done.\n");
			//PrintDebugInfo("memory write check done.\n");
			return 1;
		}
		/*
		else if (
			(strncmp("movabs", forward_ins[5].mnemonic, 6) == 0)	&&
			(strncmp("mov", forward_ins[6].mnemonic, 3) == 0)	&&
			(strncmp("add", forward_ins[7].mnemonic, 3) == 0)
			) {
			//PrintDebugInfo("memory write by shadow stack.\n");
			//PrintDebugInfo("memory write check done.\n");
		}
		*/
		else
		{
			//PrintDebugInfo("memory write check failed.\n");
			return -1;
		}
	}
	else
		return 0;
}

int check_rsp(csh ud, cs_mode, cs_insn *ins, cs_insn *backward_ins, cs_insn *forward_ins)
{
	int if_rsp = find_rsp(ins);
	if ( (if_rsp > 0) && (backward_ins) ){
		//PrintDebugInfo("found rsp writes and back_ins.\n");
		//Weijie: checking if they are 'cmp rax, 0ximm' and so on
		if (
			(strncmp("push", backward_ins[0].mnemonic, 4) == 0)	&&
			(strncmp("movabs", backward_ins[1].mnemonic, 6) == 0)	&&
			(strncmp("cmp", backward_ins[2].mnemonic, 3) == 0)	&&
			(strncmp("ja", backward_ins[3].mnemonic, 2) == 0)	&&
			(strncmp("movabs", backward_ins[4].mnemonic, 6) == 0)	&&
			(strncmp("cmp", backward_ins[5].mnemonic, 3) == 0)	&&
			(strncmp("jb", backward_ins[6].mnemonic, 2) == 0)	&&
			(strncmp("pop", backward_ins[7].mnemonic, 3) == 0)
		   ){
			//Weijie: replace 2 imms
			//PrintDebugInfo("setting bounds...\n");
			//Weijie: getting the address
			//Elf64_Addr cmp_rsp_imm_offset = 3; //cmp 1 byte, rsp 2 byte
			Elf64_Addr movabs_imm_offset = 2; //movabs 1 byte, rbx 1 byte?
			Elf64_Addr imm1_addr =  get_immAddr(backward_ins[1], movabs_imm_offset);
			Elf64_Addr imm2_addr =  get_immAddr(backward_ins[4], movabs_imm_offset);
			//Weijie:
			//dlog("imm1 address: %p, imm2 address: %p", imm1_addr, imm2_addr);
			//Weijie: rewritting
			rewrite_imm(imm1_addr, stack_upper_bound);
			//rewrite_imm(imm1_addr, stack_lower_bound);
			rewrite_imm(imm2_addr, stack_lower_bound);
			//rewrite_imm(imm2_addr, stack_upper_bound);
			//PrintDebugInfo("register rewritting done.\n");
			//PrintDebugInfo("register check done.\n");
			return 1;
		}
		else
			return -1;
	}
	else if ( (if_rsp > 0) && (forward_ins) )
	{
		//PrintDebugInfo("found rsp writes and for_ins.\n");
		if (
			(strncmp("push", forward_ins[0].mnemonic, 4) == 0)	&&
			(strncmp("movabs", forward_ins[1].mnemonic, 6) == 0)	&&
			(strncmp("cmp", forward_ins[2].mnemonic, 3) == 0)	&&
			(strncmp("ja", forward_ins[3].mnemonic, 2) == 0)	&&
			(strncmp("movabs", forward_ins[4].mnemonic, 6) == 0)	&&
			(strncmp("cmp", forward_ins[5].mnemonic, 3) == 0)	&&
			(strncmp("jb", forward_ins[6].mnemonic, 2) == 0)	&&
			(strncmp("pop", forward_ins[7].mnemonic, 3) == 0)
		){
			//Weijie: check: mov rbp, rsp
			//Weijie: replace 2 imms
			//PrintDebugInfo("setting bounds...\n");
			//Weijie: getting the address
			//Elf64_Addr cmp_rsp_imm_offset = 3; //cmp 1 byte, rsp 2 byte
			Elf64_Addr movabs_imm_offset = 2; //movabs 1 byte, rbx 1 byte?
			Elf64_Addr imm1_addr =  get_immAddr(forward_ins[1], movabs_imm_offset);
			Elf64_Addr imm2_addr =  get_immAddr(forward_ins[4], movabs_imm_offset);
			//Weijie:
			//dlog("imm1 address: %p, imm2 address: %p", imm1_addr, imm2_addr);
			//Weijie: rewritting
			rewrite_imm(imm1_addr, stack_upper_bound);
			rewrite_imm(imm2_addr, stack_lower_bound);
			//PrintDebugInfo("register rewritting done.\n");
			//PrintDebugInfo("register check done.\n");
			return 1;
		}
		else {
			//PrintDebugInfo("register check failed.\n");
			return -1;
		}
	}
	else
		return 0;
}

/****************** P3 & P4 checker ******************/

/* Weijie: if the return value is 1, then it means that this insn[j] is calling and it's safe */
int check_rewrite_longfunc_call(csh ud, cs_mode, cs_insn *ins, cs_insn *forward_ins)
{
	int exist = 0;
	//Weijie: to-do: check if this insn is a long func's indirect call...
	if (
		(strncmp("mov", ins->mnemonic, 3) == 0)	&&
		(strncmp("rbp, rsp", ins->op_str, 7) == 0)	&&
		(strncmp("push", forward_ins[6].mnemonic, 4) == 0)
	   )
	{
		exist = 1;		
		//Weijie: start checking...
		if (strncmp("movabs", forward_ins[0].mnemonic, 6) == 0) {
			cs_x86_op op2 = (forward_ins[0]).detail->x86.operands[1];
			if ((int)op2.type == X86_OP_IMM) {
				//Weijie: getting the second oprand and see if it is 0x1/2fffffffffffffff
				//PrintDebugInfo("The last insn is accessing imm, the second op is: %llx\n", op2.imm);
				if (op2.imm == 0x2fffffffffffffff) {
					//Weijie: do the rewritting of shadow stack base pointer
					Elf64_Addr movabs_imm_offset = 2; //10-8=2;
					Elf64_Addr imm_addr = get_immAddr(forward_ins[0], movabs_imm_offset);
					rewrite_imm(imm_addr, (Elf64_Addr)&__ss_start);
					//dlog("imm address: %p", imm_addr);
					//PrintDebugInfo("long call rewritting done.\n");
				}
				else return -1;
			}
			else	return -1;

			if (
				(strncmp("add", forward_ins[1].mnemonic, 3) == 0)	&&
				(strncmp("mov", forward_ins[2].mnemonic, 3) == 0)	&&
				(strncmp("add", forward_ins[3].mnemonic, 3) == 0)	&&
				(strncmp("mov", forward_ins[4].mnemonic, 3) == 0)	&&
				(strncmp("mov", forward_ins[5].mnemonic, 3) == 0)	
			   ){
				//PrintDebugInfo("long call check done.\n");
			}
			else	return -1;
		}
		else {
			//PrintDebugInfo("Check on the movabs failed.\n");
			return -1;
		}
	}
	return 0;
}

/* Weijie: if the return value is 1, then it means that this insn[j] is a return and it's safe */
int check_rewrite_longfunc_ret(csh ud, cs_mode, cs_insn *ins, cs_insn *forward_ins)
{
	int exist = 0;
	//Weijie: to-do: check if this insn is a long func's indirect ret...
	if (strncmp("ret", ins->mnemonic, 3) == 0)
	{
		exist = 1;		
		//Weijie: start checking...
		if (strncmp("movabs", forward_ins[0].mnemonic, 6) == 0) {
			cs_x86_op op2 = (forward_ins[0]).detail->x86.operands[1];
			if ((int)op2.type == X86_OP_IMM) {
				//Weijie: getting the second oprand and see if it is 0x1/2fffffffffffffff
				//PrintDebugInfo("The last insn is accessing imm, the second op is: %llx\n", op2.imm);
				if (op2.imm == 0x2fffffffffffffff) {
					//Weijie: do the rewritting of shadow stack base pointer
					Elf64_Addr movabs_imm_offset = 2; //10-8=2;
					Elf64_Addr imm_addr = get_immAddr(forward_ins[0], movabs_imm_offset);
					rewrite_imm(imm_addr, (Elf64_Addr)&__ss_start);
					//dlog("imm address: %p", imm_addr);
					//PrintDebugInfo("long call rewritting done.\n");
				}
				else return -1;
			}
			else	return -1;

			if (
					//Weijie: to-do: check other 5 insns...
				(strncmp("mov", forward_ins[1].mnemonic, 3) == 0) &&
				(strncmp("add", forward_ins[2].mnemonic, 3) == 0) &&
				(strncmp("sub", forward_ins[3].mnemonic, 3) == 0) &&
				(strncmp("mov", forward_ins[4].mnemonic, 3) == 0) &&
				(strncmp("cmp", forward_ins[4].mnemonic, 3) == 0) &&
				(strncmp("jne", forward_ins[5].mnemonic, 3) == 0)
			   ){
				//PrintDebugInfo("long ret check done.\n");
			}
			else	return -1;
		}
		else {
			//PrintDebugInfo("Check on the movabs failed.\n");
			return -1;
		}
	}
	return 0;
}

int is_op_reg(cs_insn *ins)
{
	cs_x86 *x86;
	int i, exist = 0;

	if (ins->detail == NULL)	return -2;
	x86 = &(ins->detail->x86);
	if (x86->op_count == 0)		return -1;
	for (i = 0; i < x86->op_count; i++) {
		cs_x86_op *op = &(x86->operands[i]);
		if ((int)op->type == X86_OP_REG){
			exist++;
			return 1;
		}
	}
	return exist;
}

/****************** P7 & P8 checker ******************/

/* Weijie: if the return value is 1, it means its a transactionBegin call, aka there exist xbegin instruction */
int find_transBegin(cs_insn *ins)
{
	cs_x86 *x86;
	int i, exist = 0;

	if (ins->detail == NULL)	return -2;
	//Weijie: returning -2 means this insn[j] is "data" instruction
	x86 = &(ins->detail->x86);
	if (x86->op_count == 0)		return -1;
	//Weijie: returning -1 means this insn[j] has no oprand
	//check mnemonic and the operand

	//Weijie: returning 0 means this is not call transBegin, returning 1 means it is.
	if (strncmp("call", ins->mnemonic, 4) == 0) {
		//Weijie: check if the oprand is the address of CFICheck
		cs_x86 x86 = ins->detail->x86;
		cs_x86_op op = x86.operands[0];
		if ((int)op.type == X86_OP_IMM && op.imm == transBegin_sym_addr){
			return 1;
		}
		else {
			return 0;
		};
	}
	else {
		return 0;
	}
}

//Weijie: check the whole basic block
int check_bb_head(cs_insn* whole_ins)
{
	//Weijie: at the beginning of a bb
	//xend
	//movq	%r15, %rax
	if (
		(strncmp("xend", whole_ins[0].mnemonic, 4) == 0)	&&
		(strncmp("movq", whole_ins[1].mnemonic, 4))
	   ) {	
		PrintDebugInfo("found a bb/func/branch\n");
		return 1;
	}
	else {
		PrintDebugInfo("not a bb/func/branch\n");
		return 0;
	}
}

int check_bb_tail(csh ud, cs_mode, cs_insn *ins, cs_insn *forward_ins, cs_insn *backward_ins)
{
	//Weijie: at the end of a bb
	//movq	%r15, %rax
	//call transactionBegin
	//Weijie: or a ret
	//all these should exist before ss instrumentation
	if (find_transBegin(ins) == 1)
	{
		PrintDebugInfo("checking instruments...\n");
		if (
			(strncmp("movq", forward_ins[0].mnemonic, 4) == 0)	&&
			(strncmp("movabs", backward_ins[0].mnemonic, 6) == 0)
		) {
			return 1;
		}
		else {
			PrintDebugInfo("Violate P7\n");
			return -1;
		}
	};
	return 0;
}

/****************** Multiple checkers ******************/

int check_indirect_call(csh ud, cs_mode, cs_insn *ins, cs_insn *forward_ins)
{
	if (strncmp("call", forward_ins[0].mnemonic, 4) == 0) {
		//Weijie: check if the oprand is the address of CFICheck
		cs_x86 x86 = (&forward_ins[0])->detail->x86;
		cs_x86_op op = x86.operands[0];
		if ((int)op.type == X86_OP_IMM && op.imm == CFICheck_sym_addr){
			//PrintDebugInfo("indirect call check done.\n");
			return 1;
		}
		else {
			//PrintDebugInfo("don't know what it is if it's not an imm...\n");
		};
	}
	else {
		//PrintDebugInfo("no instrumentations on this indirect call\n");
		return -1;
	}
}

//Weijie: given the symbol 'transactionBegin'
int cs_check_transBegin(unsigned char* buf_test, Elf64_Xword textSize, Elf64_Addr textAddr)
{
	csh handle;
	cs_insn *insn;
	size_t count;

	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
		PrintDebugInfo("ERROR: Failed to initialize engine!\n");
		return -1;
	}
	//Weijie: must add option
	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);
	count = cs_disasm(handle, buf_test, textSize, textAddr, 0, &insn);

	transBegin_sym_addr = textAddr;
	//PrintDebugInfo("-----printing-----\n");
	if (count) {
		size_t j;
		//Weijie: disasming and checking...
		for (j = 0; j < count; j++) {
			PrintDebugInfo("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);
		}
		cs_free(insn, count);
	} else
		PrintDebugInfo("ERROR: Failed to disassemble given code!\n");
	cs_close(&handle);

	return 0;
}

//Weijie: given the symbol 'CFICheck', get/set CFI info, and rewrite the movabs insn
int cs_rewrite_CFICheck(unsigned char* buf_test, Elf64_Xword textSize, Elf64_Addr textAddr)
{
	csh handle;
	cs_insn *insn;
	size_t count;

	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
		PrintDebugInfo("ERROR: Failed to initialize engine!\n");
		return -1;
	}
	//Weijie: must add option
	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);

	//Weijie: rewrite CFICheckAddressNum, replace with value of 'call_target_idx'
	//Weijie: rewrite CFICheckAddressPtr, replace with value of 'call_target'
	//Weijie: rewrite shadow stack base pointer, replace with value of '(char *)&__ss_start'
	count = cs_disasm(handle, buf_test, textSize, textAddr, 0, &insn);

	CFICheck_sym_addr = textAddr;
	//PrintDebugInfo("-----printing-----\n");
	if (count) {
		size_t j;
		int if_ssbase = 0;
		int if_calltg = 0;
		int if_setnum = 0;
		for (j = 0; j < count; j++) {
			//PrintDebugInfo("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);

			//Weijie: start checking...
			if (strncmp("movabs", insn[j].mnemonic, 6) == 0) {
				cs_x86_op op2 = (insn[j]).detail->x86.operands[1];
				if ((int)op2.type == X86_OP_IMM) {
					//Weijie: getting the second oprand and see if it is 0x1/2fffffffffffffff
					//PrintDebugInfo("The last insn is accessing imm, the second op is: %llx\n", op2.imm);
					if (op2.imm == 0x2fffffffffffffff) {
						//Weijie: do the rewritting of shadow stack base pointer
						if_ssbase = 1;
						Elf64_Addr movabs_imm_offset = 2; //10-8=2;
						Elf64_Addr imm_addr = get_immAddr(insn[j], movabs_imm_offset);
						rewrite_imm(imm_addr, (Elf64_Addr)&__ss_start);
					}
					//Weijie: getting the second oprand and see if it is 0x1/2fffffffffffffff
					if (op2.imm == 0x1fffffffffffffff) {
						//Weijie: do the rewritting of call target section base pointer
						if_calltg = 1;
						Elf64_Addr movabs_imm_offset = 2; //10-8=2;
						Elf64_Addr imm_addr = get_immAddr(insn[j], movabs_imm_offset);
						rewrite_imm(imm_addr, (Elf64_Addr)call_target);
					}
				}
			}

			if (strncmp("mov", insn[j].mnemonic, 3) == 0) {
				cs_x86_op op2 = (insn[j]).detail->x86.operands[1];
				if ((int)op2.type == X86_OP_IMM) {
					//Weijie: getting the second oprand and see if it is 0x1fffffff
					//PrintDebugInfo("\tsecond op:%llx\n", op2.imm);
					if (op2.imm == 0x1fffffff) {
						//Weijie: do the rewritting of CFICheckAddressNum
						if_setnum = 1;
						//Elf64_Addr mov_imm_offset = 3; //7-4=3;
						Elf64_Addr mov_imm32_offset = 4; //8-4=4;
						Elf64_Addr imm_addr = get_immAddr(insn[j], mov_imm32_offset);
						rewrite_imm32(imm_addr, call_target_idx_global);
						//PrintDebugInfo("rewrite 0x1fffffff to %d\n", call_target_idx_global);
					}
				}
			}
		}
	}
	return 0;
}

int cs_rewrite_entry(unsigned char* buf_test, Elf64_Xword textSize, Elf64_Addr textAddr) {
	csh handle;
	cs_insn *insn;
	size_t count;
	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
		PrintDebugInfo("ERROR: Failed to initialize engine!\n");
		return -1;
	}
	//Weijie: must add option
	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);

	count = cs_disasm(handle, buf_test, textSize, textAddr, 0, &insn);
	//PrintDebugInfo("Symbol insn count: %d\n", count);
	if (count) {
		size_t j;
		int memwt_intact = 0;
		int register_intact = 0;
		int longfunc_call_safe = 0;
		int longfunc_ret_safe = 0;
		int indirect_call_safe = 0;
		int forward_farthest = 13;
		int backward_farthest = 8;
		for (j = 0; j < count; j++) {
			//Weijie: comment for benchmarking
			//PrintDebugInfo("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);
			//Weijie: maintain a insn set including more than 8? insns right before the current disasmed insn
			if (j >= 13){
				cs_insn forward_insn[13];
				forward_insn[0] = insn[j-13];
				forward_insn[1] = insn[j-12];
				forward_insn[2] = insn[j-11];
				forward_insn[3] = insn[j-10];
				forward_insn[4] = insn[j-9];
				forward_insn[5] = insn[j-8];
				forward_insn[6] = insn[j-7];
				forward_insn[7] = insn[j-6];
				forward_insn[8] = insn[j-5];
				forward_insn[9] = insn[j-4];
				forward_insn[10] = insn[j-3];
				forward_insn[11] = insn[j-2];
				forward_insn[12] = insn[j-1];
				//Weijie: checking mem write
				memwt_intact = check_rewrite_memwt(handle, CS_MODE_64, &insn[j], forward_insn);
			}
			else{
				//Weijie: to-do
				//Weijie: try to use cs_disasm_iter
			}
			//if (memwt_intact < 0)	PrintDebugInfo("Abort! Illegal memory writes instrumentation!\n");

			//Weijie: comment for now
			//Weijie: checking register 'rsp'
			if (count - j - 1 >= 8){
				cs_insn backward_insn[8];
				backward_insn[0] = insn[j+1];
				backward_insn[1] = insn[j+2];
				backward_insn[2] = insn[j+3];
				backward_insn[3] = insn[j+4];
				backward_insn[4] = insn[j+5];
				backward_insn[5] = insn[j+6];
				backward_insn[6] = insn[j+7];
				backward_insn[7] = insn[j+8];
				register_intact = check_rsp(handle, CS_MODE_64, &insn[j], backward_insn, NULL);
			}
			else{
			//Weijie: to-do
			}
			//if (register_intact < 0)	PrintDebugInfo("Abort! Illegal rsp writes instrumentation!\n");
			if (j >= 8){
				cs_insn forward_insn[8];
				forward_insn[0] = insn[j-8];
				forward_insn[1] = insn[j-7];
				forward_insn[2] = insn[j-6];
				forward_insn[3] = insn[j-5];
				forward_insn[4] = insn[j-4];
				forward_insn[5] = insn[j-3];
				forward_insn[6] = insn[j-2];
				forward_insn[7] = insn[j-1];
				register_intact = check_rsp(handle, CS_MODE_64, &insn[j], NULL, forward_insn);
			}
			else{
				//Weijie: to-do
			}
			//if (register_intact < 0)	PrintDebugInfo("Abort! Illegal rsp writes instrumentation!\n");


			if (j >= 7){
				cs_insn forward_insn[7];
				forward_insn[0] = insn[j-7];
				forward_insn[1] = insn[j-6];
				forward_insn[2] = insn[j-5];
				forward_insn[3] = insn[j-4];
				forward_insn[4] = insn[j-3];
				forward_insn[5] = insn[j-2];
				forward_insn[6] = insn[j-1];
				longfunc_call_safe = check_rewrite_longfunc_call(handle, CS_MODE_64, &insn[j], forward_insn);
			}
			else{
				//Weijie: to-do
			}
			//if (longfunc_call_safe < 0)	PrintDebugInfo("Check failed! Illegal long func instrumentation!\n");


			if (j >= 6){
				cs_insn forward_insn[7];
				forward_insn[0] = insn[j-7];
				forward_insn[1] = insn[j-6];
				forward_insn[2] = insn[j-5];
				forward_insn[3] = insn[j-4];
				forward_insn[4] = insn[j-3];
				forward_insn[5] = insn[j-2];
				forward_insn[6] = insn[j-1];
				longfunc_ret_safe = check_rewrite_longfunc_ret(handle, CS_MODE_64, &insn[j], forward_insn);
			}
			else{
				//Weijie: to-do
			}
			//if (longfunc_ret_safe < 0)	PrintDebugInfo("Check failed! Illegal long ret instrumentation!\n");

			//Weijie: the logic of checking indirect call is a little bit different.
			if (j >= 1){
				cs_insn forward_insn[1];
				forward_insn[0] = insn[j-1];
				//Weijie: checking indirect call
				if (
						(strncmp("call", insn[j].mnemonic, 4) == 0) &&
						(is_op_reg(&insn[j]))
				   ){
					//PrintDebugInfo("checking indirect call\n");
					indirect_call_safe = check_indirect_call(handle, CS_MODE_64, &insn[j], forward_insn);
				}
				else {
					//PrintDebugInfo("not an indirect call\n");
				}
			}
			//if (indirect_call_safe < 0)	PrintDebugInfo("Check failed! Illegal indirect call instrumentation!\n");
		}
		cs_free(insn, count);
	} else
		PrintDebugInfo("ERROR: Failed to disassemble given code!\n");
	cs_close(&handle);

	return 0;
}

/***************************** disasm part ******************************/

/* Weijie: 
 * Obsoleted.
 * Used be an ecall of whole cs_open/disasm/close */
int cs_disasm_entry(unsigned char* buf_test, Elf64_Xword textSize, Elf64_Addr textAddr) {
	csh handle;
	cs_insn *insn;
	size_t count;
	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
		PrintDebugInfo("ERROR: Failed to initialize engine!\n");
		return -1;
	}
	//Weijie: must add option
	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);

	count = cs_disasm(handle, buf_test, textSize, textAddr, 0, &insn);
	//PrintDebugInfo("-----printing-----\n");
	if (count) {
		size_t j;
		for (j = 0; j < count; j++) {
			PrintDebugInfo("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);
		}
		cs_free(insn, count);
	} else
		PrintDebugInfo("ERROR: Failed to disassemble given code!\n");
	cs_close(&handle);

	return 0;
}

int cs_disasm_iter_entry(unsigned char* buf, Elf64_Xword textSize, Elf64_Addr textAddr) {
	csh handle;
	cs_insn *insn;
	const uint8_t *code;
	
	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
		PrintDebugInfo("ERROR: Failed to initialize engine!\n");
		return -1;
	}
	//Weijie: must add option
	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);

	insn = cs_malloc(handle);
	code = buf;
	while(cs_disasm_iter(handle, &code, &textSize, &textAddr, insn)) {
		PrintDebugInfo("0x%"PRIx64":\t%s\t\t%s\n", insn->address, insn->mnemonic, insn->op_str);
	}

	cs_free(insn, 1);
	cs_close(&handle);
	return 0;
}

void rewrite_whole()
{
	int j;
	int rv;
	Elf64_Xword textSize;
	Elf64_Addr textAddr;
	unsigned char* buf;
	//Weijie: the first symbol is UND  ...
	for (j = 0; j < n_symtab; j++){
		//Weijie: only disassemble .text section
		if (pshdr[symtab[j].st_shndx].sh_type == SHT_PROGBITS && (pshdr[symtab[j].st_shndx].sh_flags & SHF_EXECINSTR)) {
			//Weijie: print symbol name
			textSize = symtab[j].st_size;
			//Weijie: it is very strange the size of those LBB symbols is 0
			if (textSize > 0){
				//PrintDebugInfo("-----setting params-----\n");
				//Weijie: get CFI info
				int ifcfi_rv = strncmp("CFICheck", &strtab[symtab[j].st_name], 8);
				if (ifcfi_rv == 0) {
					textAddr = symtab[j].st_value;
					buf = (unsigned char *)malloc(textSize);
					//Weijie: fill in buf
					cpy((char *)buf, (char *)symtab[j].st_value, symtab[j].st_size);
					//dlog("disassembling CFICheck: textAddr: %p, textSize: %u", textAddr, textSize);
					rv = cs_rewrite_CFICheck(buf, textSize, textAddr);
					free(buf);
				}

				//Weijie: rewrite Memory write and long call/ret, not including CFICheck
				textAddr = symtab[j].st_value;
				buf = (unsigned char *)malloc(textSize);
				//Weijie: fill in buf
				cpy((char *)buf, (char *)symtab[j].st_value, symtab[j].st_size);
				//dlog("disassembling symbol '%s': textAddr: %p, textSize: %u", &strtab[symtab[j].st_name], textAddr, textSize);
				rv = cs_rewrite_entry(buf, textSize, textAddr);
				free(buf);
			}
		}
	}
}

void disasm_whole()
{
	int j;
	int rv;
	Elf64_Xword textSize;
	Elf64_Addr textAddr;
	unsigned char* buf;
	//Weijie:
	//Elf64_Xword textSizemax = 160;

	//Weijie: the first symbol is UND  ...
	for (j = 0; j < n_symtab; j++){
		//Weijie: only disassemble .text section
		if (pshdr[symtab[j].st_shndx].sh_type == SHT_PROGBITS && (pshdr[symtab[j].st_shndx].sh_flags & SHF_EXECINSTR)) {
			
			//Weijie: print symbol name
			textSize = symtab[j].st_size;
			
			//Weeijie: disasm all symbols
			if (textSize > 0){
				dlog("disassembling symbol '%s':", &strtab[symtab[j].st_name]);
				//PrintDebugInfo("-----setting params-----\n");
				textAddr = symtab[j].st_value;
				buf = (unsigned char *)malloc(textSize);
				//Weijie: fill in buf
				cpy((char *)buf, (char *)symtab[j].st_value, symtab[j].st_size);
				dlog("textAddr: %p, textSize: %u", textAddr, textSize);
				rv = cs_disasm_entry(buf, textSize, textAddr);
				//Weijie: multiple choices
				//rv = cs_disasm_iter_entry(buf, textSize, textAddr);
				free(buf);
			}
			
		}
	}
}

/****************************** checker & rewriter part ******************************/

/* shawn233: given symbol name, search symbol table and return symtab.st_value */
Elf64_Addr search_symtab_by_name(char *name, size_t l) {
	for (unsigned i = 1; i < n_symtab; ++ i) {
		if (strncmp((const char *)name, &strtab[symtab[i].st_name], l) == 0)
			return symtab[i].st_value;
	}
	return 0;
}


//Weijie: remember to do ecall_receive_entrylabel first. And do relocate_entrylabel until relocate() is done.
void ecall_receive_entrylabel(char *entrylabel, int sz)
{
	pr_progress("loading entrylabels");
	dlog("target_table at %p", target_table);
	cpy(target_table, entrylabel, (size_t)sz);
	target_table_size = sz;
}

void relocate_entrylabel()
{
	// shawn233: in function load, symtab[i].st_value has been updated to the address of symbols
	// so we can directly replace symbols to these addresses

	//Weijie: redirect call target to the new section: calltg
	//Weijie & Xinyu: target_table starts those label strings, while call_target starts those target addresses;
	call_target = (Elf64_Addr *)target_table + target_table_size + 10;

	unsigned call_target_idx = 0;

	for (unsigned i = 0; i < target_table_size; ++ i) {
		if (target_table[i] == '\n') {
			target_table[i] = '\0';
			call_target_idx ++;
		}
	}

	call_target_idx_global = call_target_idx;

	// shawn233: target_entries is an array that stores the pointers to each target entry
	char **target_entries = (char **)get_buf(sizeof(char *) * call_target_idx_global);
	target_entries[0] = target_table; // the pointer to the first entry is exactly target_table
	call_target_idx = 1;
	for (unsigned i = 0; i < (target_table_size - 1); ++ i) {
		if (target_table[i] == '\0') {
			target_entries[call_target_idx++] = (target_table + (i + 1));
		}
	}
	if (call_target_idx != call_target_idx_global) {
		dlog("[error] target_entries creation error, call_target_idx: %u mismatches call_target_idx_global: %u",\
				call_target_idx, call_target_idx_global);
	}

	call_target_idx = 0;
	for (unsigned i = 0; i < n_symtab; ++ i) {
		for (unsigned j = 0; j < call_target_idx_global; ++ j) {
			if (strncmp((const char *)target_entries[j], &strtab[symtab[i].st_name], strlen(target_entries[j])) == 0) {
				call_target[call_target_idx++] = symtab[i].st_value;
			}
		}
	}

}

/* Hongbo: need to do the sanitation */
/* Weijie: copy data from outside to a .sgx.data section*/
char *userdata = (char *)_SGXDATA_BASE;
size_t userdata_size = 0;
void ecall_receive_data(char *data, int sz)
{
        cpy(userdata, data, (size_t)sz);
        userdata_size = sz;
}

void cleanup_code(size_t sz)
{
        fill_zero(program, sz);
}

int cleanup_data(size_t sz)
{
        fill_zero(userdata, sz);
	return 0;
}

//Weijie: Enclave starts here
void ecall_receive_binary(char *binary, int sz)
{
	//Weijie: v1: do not use the following line
	//program = (char*) binary;
	dlog("line %d start ecall_receive_binary", __LINE__);
	cpy(program, binary, (size_t)sz);
	program_size = sz;

	void (*entry)();
	dlog("program at %p (%lu)", program, program_size);
	dlog(".sgx.ssblob = %p", (void*)(&__ss_start));
	dlog(".sgx.calltg = %p", (void*)(&__cfi_start));
	dlog("target string table at %p (%lu)", target_table, target_table_size);
	dlog(".sgxcode = %p", _SGXCODE_BASE);
	dlog(".sgxdata = %p", _SGXDATA_BASE);
	dlog("elf start = %p", (void*)(&__elf_start));
	dlog("elf end = %p", (void*)(&__elf_end));
	dlog("HEAP BASE = %lx", _HEAP_BASE);
	sgx_push_gadget((unsigned long)_SGXCODE_BASE);
	sgx_push_gadget((unsigned long)_SGXDATA_BASE);

	dlog("line %d call validate_ehdr", __LINE__);
	validate_ehdr();

	dlog("line %d call update_reltab", __LINE__);	
	update_reltab();

	pr_progress("loading");
	load();

	//Weijie: cannot simply delete relocation in original sgx-shield demo
	//Weijie: cannot delete the following lines in current demo
	pr_progress("relocating");
	relocate();

	pr_progress("relocating entrylabels");
	dlog("target string table at %p (%lu)", target_table, target_table_size);
	relocate_entrylabel();
	dlog("target address table at %p, total #:(%lu)", call_target, call_target_idx_global);

	pr_progress("disassembling, checking and rewritting");
	rewrite_whole();

	pr_progress("debugging: validate if rewrites fine");
	disasm_whole();

	pr_progress("executing input binary");
	entry = (void (*)())(main_sym->st_value);

	//Weijie:
	dlog("main: %p", entry);

	pr_progress("entering");
	//Weijie: the asm inline commands could be commented
	__asm__ __volatile__( "push %%r13\n" "push %%r14\n" "push %%r15\n" ::);
	entry();
	__asm__ __volatile__( "pop %%r15\n" "pop %%r14\n" "pop %%r13\n" ::);
	pr_progress("returning");

        cleanup_code(program_size);
        if (0 != cleanup_data(userdata_size))
		PrintDebugInfo("Violate P9\n");
        pr_progress("cleansing");

}

#include "iterdis_checker.cpp"
