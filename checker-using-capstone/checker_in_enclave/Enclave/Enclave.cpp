#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <unistd.h>

#include "Enclave.h"
#include "Enclave_t.h"

/* My private Enclave function */
void PrintDebugInfo(const char *fmt, ...)
{
	char buf[BUFSIZ] = {'\0'};
	va_list ap;
	va_start(ap, fmt);
	vsnprintf(buf, BUFSIZ, fmt, ap);
	va_end(ap);
	Ocall_PrintString(buf);
}

/* My public Enclave functions */
void PrintDebugInfoOutside(void)
{
	Ocall_PrintString("PDIO test\n");
}

void PrintDebugInfoOutside2(void)
{
	Ocall_PrintString("PDIO test in ud->disasm ...\n");
}

void PrintDebugInfoOutside3(void)
{
	Ocall_PrintString("PDIO test in elf_begin ...\n");
}

/*******************************************************/
/* for debugging */
#include <capstone/platform.h>
#include <capstone/capstone.h>

static csh handle;

struct platform {
	cs_arch arch;
	cs_mode mode;
	unsigned char *code;
	size_t size;
	const char *comment;
	cs_opt_type opt_type;
	cs_opt_value opt_value;
};

static void print_string_hex(const char *comment, unsigned char *str, size_t len)
{
	unsigned char *c;

	PrintDebugInfo("%s", comment);
	for (c = str; c < str + len; c++) {
		PrintDebugInfo("0x%02x ", *c & 0xff);
	}

	PrintDebugInfo("\n");
}

static const char *get_eflag_name(uint64_t flag)
{
	switch(flag) {
		default:
			return NULL;
		case X86_EFLAGS_UNDEFINED_OF:
			return "UNDEF_OF";
		case X86_EFLAGS_UNDEFINED_SF:
			return "UNDEF_SF";
		case X86_EFLAGS_UNDEFINED_ZF:
			return "UNDEF_ZF";
		case X86_EFLAGS_MODIFY_AF:
			return "MOD_AF";
		case X86_EFLAGS_UNDEFINED_PF:
			return "UNDEF_PF";
		case X86_EFLAGS_MODIFY_CF:
			return "MOD_CF";
		case X86_EFLAGS_MODIFY_SF:
			return "MOD_SF";
		case X86_EFLAGS_MODIFY_ZF:
			return "MOD_ZF";
		case X86_EFLAGS_UNDEFINED_AF:
			return "UNDEF_AF";
		case X86_EFLAGS_MODIFY_PF:
			return "MOD_PF";
		case X86_EFLAGS_UNDEFINED_CF:
			return "UNDEF_CF";
		case X86_EFLAGS_MODIFY_OF:
			return "MOD_OF";
		case X86_EFLAGS_RESET_OF:
			return "RESET_OF";
		case X86_EFLAGS_RESET_CF:
			return "RESET_CF";
		case X86_EFLAGS_RESET_DF:
			return "RESET_DF";
		case X86_EFLAGS_RESET_IF:
			return "RESET_IF";
		case X86_EFLAGS_TEST_OF:
			return "TEST_OF";
		case X86_EFLAGS_TEST_SF:
			return "TEST_SF";
		case X86_EFLAGS_TEST_ZF:
			return "TEST_ZF";
		case X86_EFLAGS_TEST_PF:
			return "TEST_PF";
		case X86_EFLAGS_TEST_CF:
			return "TEST_CF";
		case X86_EFLAGS_RESET_SF:
			return "RESET_SF";
		case X86_EFLAGS_RESET_AF:
			return "RESET_AF";
		case X86_EFLAGS_RESET_TF:
			return "RESET_TF";
		case X86_EFLAGS_RESET_NT:
			return "RESET_NT";
		case X86_EFLAGS_PRIOR_OF:
			return "PRIOR_OF";
		case X86_EFLAGS_PRIOR_SF:
			return "PRIOR_SF";
		case X86_EFLAGS_PRIOR_ZF:
			return "PRIOR_ZF";
		case X86_EFLAGS_PRIOR_AF:
			return "PRIOR_AF";
		case X86_EFLAGS_PRIOR_PF:
			return "PRIOR_PF";
		case X86_EFLAGS_PRIOR_CF:
			return "PRIOR_CF";
		case X86_EFLAGS_PRIOR_TF:
			return "PRIOR_TF";
		case X86_EFLAGS_PRIOR_IF:
			return "PRIOR_IF";
		case X86_EFLAGS_PRIOR_DF:
			return "PRIOR_DF";
		case X86_EFLAGS_TEST_NT:
			return "TEST_NT";
		case X86_EFLAGS_TEST_DF:
			return "TEST_DF";
		case X86_EFLAGS_RESET_PF:
			return "RESET_PF";
		case X86_EFLAGS_PRIOR_NT:
			return "PRIOR_NT";
		case X86_EFLAGS_MODIFY_TF:
			return "MOD_TF";
		case X86_EFLAGS_MODIFY_IF:
			return "MOD_IF";
		case X86_EFLAGS_MODIFY_DF:
			return "MOD_DF";
		case X86_EFLAGS_MODIFY_NT:
			return "MOD_NT";
		case X86_EFLAGS_MODIFY_RF:
			return "MOD_RF";
		case X86_EFLAGS_SET_CF:
			return "SET_CF";
		case X86_EFLAGS_SET_DF:
			return "SET_DF";
		case X86_EFLAGS_SET_IF:
			return "SET_IF";
	}
}

static const char *get_fpu_flag_name(uint64_t flag)
{
	switch (flag) {
		default:
			return NULL;
		case X86_FPU_FLAGS_MODIFY_C0:
			return "MOD_C0";
		case X86_FPU_FLAGS_MODIFY_C1:
			return "MOD_C1";
		case X86_FPU_FLAGS_MODIFY_C2:
			return "MOD_C2";
		case X86_FPU_FLAGS_MODIFY_C3:
			return "MOD_C3";
		case X86_FPU_FLAGS_RESET_C0:
			return "RESET_C0";
		case X86_FPU_FLAGS_RESET_C1:
			return "RESET_C1";
		case X86_FPU_FLAGS_RESET_C2:
			return "RESET_C2";
		case X86_FPU_FLAGS_RESET_C3:
			return "RESET_C3";
		case X86_FPU_FLAGS_SET_C0:
			return "SET_C0";
		case X86_FPU_FLAGS_SET_C1:
			return "SET_C1";
		case X86_FPU_FLAGS_SET_C2:
			return "SET_C2";
		case X86_FPU_FLAGS_SET_C3:
			return "SET_C3";
		case X86_FPU_FLAGS_UNDEFINED_C0:
			return "UNDEF_C0";
		case X86_FPU_FLAGS_UNDEFINED_C1:
			return "UNDEF_C1";
		case X86_FPU_FLAGS_UNDEFINED_C2:
			return "UNDEF_C2";
		case X86_FPU_FLAGS_UNDEFINED_C3:
			return "UNDEF_C3";
		case X86_FPU_FLAGS_TEST_C0:
			return "TEST_C0";
		case X86_FPU_FLAGS_TEST_C1:
			return "TEST_C1";
		case X86_FPU_FLAGS_TEST_C2:
			return "TEST_C2";
		case X86_FPU_FLAGS_TEST_C3:
			return "TEST_C3";
	}
}

static void print_insn_detail(csh ud, cs_mode mode, cs_insn *ins)
{
	int count, i;
	cs_x86 *x86;
	cs_regs regs_read, regs_write;
	uint8_t regs_read_count, regs_write_count;

	// detail can be NULL on "data" instruction if SKIPDATA option is turned ON
	if (ins->detail == NULL)
		return;

	x86 = &(ins->detail->x86);

	print_string_hex("\tPrefix:", x86->prefix, 4);

	print_string_hex("\tOpcode:", x86->opcode, 4);

	PrintDebugInfo("\trex: 0x%x\n", x86->rex);

	PrintDebugInfo("\taddr_size: %u\n", x86->addr_size);
	PrintDebugInfo("\tmodrm: 0x%x\n", x86->modrm);
	if (x86->encoding.modrm_offset != 0) {
		PrintDebugInfo("\tmodrm_offset: 0x%x\n", x86->encoding.modrm_offset);
	}

	PrintDebugInfo("\tdisp: 0x%" PRIx64 "\n", x86->disp);
	if (x86->encoding.disp_offset != 0) {
		PrintDebugInfo("\tdisp_offset: 0x%x\n", x86->encoding.disp_offset);
	}

	if (x86->encoding.disp_size != 0) {
		PrintDebugInfo("\tdisp_size: 0x%x\n", x86->encoding.disp_size);
	}

	// SIB is not available in 16-bit mode
	if ((mode & CS_MODE_16) == 0) {
		PrintDebugInfo("\tsib: 0x%x\n", x86->sib);
		if (x86->sib_base != X86_REG_INVALID)
			PrintDebugInfo("\t\tsib_base: %s\n", cs_reg_name(handle, x86->sib_base));
		if (x86->sib_index != X86_REG_INVALID)
			PrintDebugInfo("\t\tsib_index: %s\n", cs_reg_name(handle, x86->sib_index));
		if (x86->sib_scale != 0)
			PrintDebugInfo("\t\tsib_scale: %d\n", x86->sib_scale);
	}

	// XOP code condition
	if (x86->xop_cc != X86_XOP_CC_INVALID) {
		PrintDebugInfo("\txop_cc: %u\n", x86->xop_cc);
	}

	// SSE code condition
	if (x86->sse_cc != X86_SSE_CC_INVALID) {
		PrintDebugInfo("\tsse_cc: %u\n", x86->sse_cc);
	}

	// AVX code condition
	if (x86->avx_cc != X86_AVX_CC_INVALID) {
		PrintDebugInfo("\tavx_cc: %u\n", x86->avx_cc);
	}

	// AVX Suppress All Exception
	if (x86->avx_sae) {
		PrintDebugInfo("\tavx_sae: %u\n", x86->avx_sae);
	}

	// AVX Rounding Mode
	if (x86->avx_rm != X86_AVX_RM_INVALID) {
		PrintDebugInfo("\tavx_rm: %u\n", x86->avx_rm);
	}

	// Print out all immediate operands
	count = cs_op_count(ud, ins, X86_OP_IMM);
	if (count) {
		PrintDebugInfo("\timm_count: %u\n", count);
		for (i = 1; i < count + 1; i++) {
			int index = cs_op_index(ud, ins, X86_OP_IMM, i);
			PrintDebugInfo("\t\timms[%u]: 0x%" PRIx64 "\n", i, x86->operands[index].imm);
			if (x86->encoding.imm_offset != 0) {
				PrintDebugInfo("\timm_offset: 0x%x\n", x86->encoding.imm_offset);
			}

			if (x86->encoding.imm_size != 0) {
				PrintDebugInfo("\timm_size: 0x%x\n", x86->encoding.imm_size);
			}
		}
	}

	if (x86->op_count)
		PrintDebugInfo("\top_count: %u\n", x86->op_count);

	// Print out all operands
	for (i = 0; i < x86->op_count; i++) {
		cs_x86_op *op = &(x86->operands[i]);

		switch((int)op->type) {
			case X86_OP_REG:
				PrintDebugInfo("\t\toperands[%u].type: REG = %s\n", i, cs_reg_name(handle, op->reg));
				break;
			case X86_OP_IMM:
				PrintDebugInfo("\t\toperands[%u].type: IMM = 0x%" PRIx64 "\n", i, op->imm);
				break;
			case X86_OP_MEM:
				PrintDebugInfo("\t\toperands[%u].type: MEM\n", i);
				if (op->mem.segment != X86_REG_INVALID)
					PrintDebugInfo("\t\t\toperands[%u].mem.segment: REG = %s\n", i, cs_reg_name(handle, op->mem.segment));
				if (op->mem.base != X86_REG_INVALID)
					PrintDebugInfo("\t\t\toperands[%u].mem.base: REG = %s\n", i, cs_reg_name(handle, op->mem.base));
				if (op->mem.index != X86_REG_INVALID)
					PrintDebugInfo("\t\t\toperands[%u].mem.index: REG = %s\n", i, cs_reg_name(handle, op->mem.index));
				if (op->mem.scale != 1)
					PrintDebugInfo("\t\t\toperands[%u].mem.scale: %u\n", i, op->mem.scale);
				if (op->mem.disp != 0)
					PrintDebugInfo("\t\t\toperands[%u].mem.disp: 0x%" PRIx64 "\n", i, op->mem.disp);
				break;
			default:
				break;
		}

		// AVX broadcast type
		if (op->avx_bcast != X86_AVX_BCAST_INVALID)
			PrintDebugInfo("\t\toperands[%u].avx_bcast: %u\n", i, op->avx_bcast);

		// AVX zero opmask {z}
		if (op->avx_zero_opmask != false)
			PrintDebugInfo("\t\toperands[%u].avx_zero_opmask: TRUE\n", i);

		PrintDebugInfo("\t\toperands[%u].size: %u\n", i, op->size);

		switch(op->access) {
			default:
				break;
			case CS_AC_READ:
				PrintDebugInfo("\t\toperands[%u].access: READ\n", i);
				break;
			case CS_AC_WRITE:
				PrintDebugInfo("\t\toperands[%u].access: WRITE\n", i);
				break;
			case CS_AC_READ | CS_AC_WRITE:
				PrintDebugInfo("\t\toperands[%u].access: READ | WRITE\n", i);
				break;
		}
	}

	// Print out all registers accessed by this instruction (either implicit or explicit)
	if (!cs_regs_access(ud, ins,
				regs_read, &regs_read_count,
				regs_write, &regs_write_count)) {
		if (regs_read_count) {
			PrintDebugInfo("\tRegisters read:");
			for(i = 0; i < regs_read_count; i++) {
				PrintDebugInfo(" %s", cs_reg_name(handle, regs_read[i]));
			}
			PrintDebugInfo("\n");
		}

		if (regs_write_count) {
			PrintDebugInfo("\tRegisters modified:");
			for(i = 0; i < regs_write_count; i++) {
				PrintDebugInfo(" %s", cs_reg_name(handle, regs_write[i]));
			}
			PrintDebugInfo("\n");
		}
	}

	if (x86->eflags || x86->fpu_flags) {
		for(i = 0; i < ins->detail->groups_count; i++) {
			if (ins->detail->groups[i] == X86_GRP_FPU) {
				PrintDebugInfo("\tFPU_FLAGS:");
				for(i = 0; i <= 63; i++)
					if (x86->fpu_flags & ((uint64_t)1 << i)) {
						PrintDebugInfo(" %s", get_fpu_flag_name((uint64_t)1 << i));
					}
				PrintDebugInfo("\n");
				break;
			}
		}

		if (i == ins->detail->groups_count) {
			PrintDebugInfo("\tEFLAGS:");
			for(i = 0; i <= 63; i++)
				if (x86->eflags & ((uint64_t)1 << i)) {
					PrintDebugInfo(" %s", get_eflag_name((uint64_t)1 << i));
				}
			PrintDebugInfo("\n");
		}
	}

	PrintDebugInfo("\n");
}

#define CODE_TEST "\x8d\x4c\x32\x08\x01\xd8"
#define CODE "\x55\x48\x8b\x05\xb8\x13\x00\x00\xe9\xea\xbe\xad\xde\xff\x25\x23\x01\x00\x00\xe8\xdf\xbe\xad\xde\x74\xff"

static int find_cmp_imm(csh ud, cs_mode, cs_insn *ins)
{
	cs_x86 *x86;
	int i, exist = 0;

	if (ins->detail == NULL)	return -2;
	//Weijie: returning -2 means this insn[j] is kind of "data" instruction

	x86 = &(ins->detail->x86);
	if (x86->op_count == 0)		return -1;
	//Weijie: returning -1 means this insn[j] has no oprand
	
	// traverse all operands
	for (i = 0; i < x86->op_count; i++) {
		cs_x86_op *op = &(x86->operands[i]);
		//Weijie: returning 1 means this insn[j] has accessing imm
		if ((int)op->type == X86_OP_IMM){
			exist++;
			return 1;
		}
	}
	return exist;
}
/* Weijie: if the return value is 1, then it means that this insn[j] is writting memory */
static int find_memory_write(csh ud, cs_mode, cs_insn *ins)
{
	cs_x86 *x86;
	int i, exist = 0;

	if (ins->detail == NULL)	return -2;
	//Weijie: returning -2 means this insn[j] is kind of "data" instruction

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
/* Weijie: if the return value is 1, then it means that this insn[j] is reading memory */
static int find_memory_read(csh ud, cs_mode, cs_insn *ins)
{
	cs_x86 *x86;
	int i, exist = 0;

	if (ins->detail == NULL)	return -2;
	//Weijie: returning -2 means this insn[j] is kind of "data" instruction

	x86 = &(ins->detail->x86);
	if (x86->op_count == 0)		return -1;
	//Weijie: returning -1 means this insn[j] has no oprand
	
	// traverse all operands
	for (i = 0; i < x86->op_count; i++) {
		cs_x86_op *op = &(x86->operands[i]);
		//Weijie: returning 0 means this insn[j] has no memory writting
		//Weijie: returning 1 means this insn[j] has memory writting
		if ((int)op->type == X86_OP_MEM && (op->access & CS_AC_READ)){
			exist++;
			return 1;
		}
	}
	return exist;
}

int Ecall_x86access_entry()
{
	//Weijie: comment the following line
	//csh handle;

	cs_insn *insn;
	size_t count, j;
	cs_regs regs_read, regs_write;
	uint8_t read_count, write_count, i;

	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK)
	//if (cs_open(CS_ARCH_X86, CS_MODE_32, &handle) != CS_ERR_OK)
		return -1;

	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);

	count = cs_disasm(handle, (unsigned char *)CODE, sizeof(CODE)-1, 0x1000, 0, &insn);

	/* test 1 */
	PrintDebugInfo("Test 1:\n");
	if (count > 0) {
		for (j = 0; j < count; j++) {
			// Print assembly
			PrintDebugInfo("%s\t%s\n", insn[j].mnemonic, insn[j].op_str);

			// Print all registers accessed by this instruction.
			if (cs_regs_access(handle, &insn[j],
						regs_read, &read_count,
						regs_write, &write_count) == 0) {
				if (read_count > 0) {
					PrintDebugInfo("\n\tRegisters read:");
					for (i = 0; i < read_count; i++) {
						PrintDebugInfo(" %s", cs_reg_name(handle, regs_read[i]));
					}
					PrintDebugInfo("\n");
				}

				if (write_count > 0) {
					PrintDebugInfo("\n\tRegisters modified:");
					for (i = 0; i < write_count; i++) {
						PrintDebugInfo(" %s", cs_reg_name(handle, regs_write[i]));
					}
					PrintDebugInfo("\n");
				}
			}
		}

		cs_free(insn, count);
	} else
		PrintDebugInfo("ERROR: Failed to disassemble given code!\n");

	/* test 2 */	
	PrintDebugInfo("Test 2:\n");
	count = cs_disasm(handle, (unsigned char *)CODE, sizeof(CODE)-1, 0x1000, 0, &insn);
	
	if (count) {
		//size_t j;
		int if_memwt = 0;
		int if_cmp_imm = 0;
		int if_memrd = 0;


		PrintDebugInfo("****************\n");
		//PrintDebugInfo("Platform: %s\n", platforms[i].comment);
		print_string_hex("Code:", (unsigned char *)CODE, sizeof(CODE)-1);
		PrintDebugInfo("Disasm:\n");

		for (j = 0; j < count; j++) {
			PrintDebugInfo("0x%" PRIx64 ":\t%s\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);
			//print_insn_detail(handle, platforms[i].mode, &insn[j]);
			print_insn_detail(handle, CS_MODE_64, &insn[j]);
			//Weijie:
			if_cmp_imm = find_cmp_imm(handle, CS_MODE_64, &insn[j]);
			if_memwt = find_memory_write(handle, CS_MODE_64, &insn[j]);
			if_memrd = find_memory_read(handle, CS_MODE_64, &insn[j]);

			if (if_memwt > 0)	PrintDebugInfo("\tThe above insn is writting memory!\n");
			if (if_cmp_imm > 0)	PrintDebugInfo("\tThe above insn is accessing imm!\n");
			if (if_memrd > 0)	PrintDebugInfo("\tThe above insn is writting memory!\n");

		}
		PrintDebugInfo("0x%" PRIx64 ":\n", insn[j-1].address + insn[j-1].size);

		// free memory allocated by cs_disasm()
		cs_free(insn, count);
	} else {
		PrintDebugInfo("****************\n");
		//PrintDebugInfo("Platform: %s\n", platforms[i].comment);
		print_string_hex("Code:", (unsigned char *)CODE, sizeof(CODE)-1);
		PrintDebugInfo("ERROR: Failed to disasm given code!\n");
		abort();
	}

	PrintDebugInfo("\n");



	cs_close(&handle);

	return 0;
}

/* Weijie: ecall of whole cs_open/disasm/close */
int Ecall_cs_entry(void) {
	/* Weijie: new enclave starts here. */

	//Weijie:
	//csh handle;

	cs_insn *insn;
	size_t count;
	unsigned char buf_test[] =
	{
		0x74, 0x1d,
		0xc4, 0xe3, 0xe9, 0x6a, 0x09, 0x00,
		0xc4, 0xa3, 0x71, 0x6d, 0x04, 0x0e, 0x00,
		0xc4, 0xc3, 0xc1, 0x7b, 0x44, 0xc7, 0xf8, 0x10,
		0xc4, 0xe3, 0xe9, 0x6f, 0xc9, 0x00,
		0xc4, 0xe3, 0x51, 0x6b, 0x08, 0x10,
		0xc4, 0xe3, 0x49, 0x79, 0x05, 0x20, 0x7e, 0x33, 0x00, 0x10,
		0x8f, 0xe8, 0x58, 0x9e, 0xd0, 0x30,
		0x8f, 0xe8, 0x48, 0xce, 0xca, 0x03,
		0x8f, 0xe8, 0x68, 0xa2, 0xc5, 0x40,
		0x8f, 0xe9, 0x70, 0x9a, 0xcc,
		0x8f, 0xe8, 0xd0, 0xa3, 0x05, 0x18, 0x33, 0x2e, 0x00, 0x60,
		0xc4, 0xe3, 0x79, 0x0b, 0xc0, 0x0a,

		0x62, 0xf1, 0xed, 0x48, 0xfb, 0xd6,
		0x62, 0xb1, 0x3d, 0x48, 0x72, 0x34, 0x8e, 0x03,
		0x62, 0xe2, 0x7e, 0x48, 0x3a, 0xcb,
		0x62, 0xf2, 0x6d, 0x4a, 0x64, 0xc1,
		0xc4, 0xe3, 0x79, 0x0b, 0xc8, 0x02,
		0x62, 0xb1, 0xfd, 0x08, 0x2e, 0xc5,
		0x66, 0x0f, 0x3a, 0x0a, 0xc0, 0x02,
		0x62, 0xd2, 0xf5, 0x78, 0xb8, 0xd1,
		0xf2, 0x44, 0x0f, 0x10, 0xb4, 0x24, 0x98, 0x00, 0x00, 0x00,
		0x00
	};

	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
		PrintDebugInfo("ERROR: Failed to initialize engine!\n");
		return -1;
	}

	PrintDebugInfo("-----checking disasm-----\n");
	count = cs_disasm(handle, buf_test, sizeof(buf_test)-1, 0x1000, 0, &insn);
	PrintDebugInfo("-----checking printf-----\n");
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

/*******************************************************/
/* for debugging */
#include "my_stdio.c"

#include "libelf.h"

/* Weijie: ecall of whole elf operations */
//Weijie: would cause illegal instruction signal, cause the libelf is not modified ...
int Ecall_elf_entry(char *filename) {

	int fd;
	Elf *e;
	size_t shstrndx;

	fd = open(filename, O_RDONLY);

	if (fd < 0) {
		PrintDebugInfo("Cannot open file %s\n", filename);
		return -1;
	}

	if (elf_version(EV_CURRENT) == EV_NONE) {
		PrintDebugInfo("ELF library initialization failed\n");
		return -1;
	}

	PrintDebugInfo("-----checking elf_begin-----\n");
	//e = elf_begin(fd, ELF_C_READ_MMAP, NULL);
	//Weijie: test
	e = elf_begin_dbg(fd, ELF_C_READ_MMAP, NULL, PrintDebugInfoOutside3);

	if (e == NULL) {
		PrintDebugInfo("elf_begin failed\n");
		return -1;
	}
	PrintDebugInfo("-----checking elf_getshdrstrndx-----\n");
	if (elf_getshdrstrndx(e, &shstrndx) != 0){
		PrintDebugInfo("Cannot get string section\n");
		return -1;
	}
	return 0;
}

/* for debugging */
#include "sgx_trts_exception.h"

/* Weijie: add signal handler */
int exception_handler(sgx_exception_info_t *info)
{
	switch(info->exception_type)
	{
		case SGX_EXCEPTION_HARDWARE :
			break;
		case SGX_EXCEPTION_SOFTWARE :
			break;
	}
	switch (info->exception_vector)
	{
		case SGX_EXCEPTION_VECTOR_AC:
			break;
		case SGX_EXCEPTION_VECTOR_BP:
			break;
		case SGX_EXCEPTION_VECTOR_BR:
			break;
		case SGX_EXCEPTION_VECTOR_DB:
			break;
		case SGX_EXCEPTION_VECTOR_DE:
			break;
		case SGX_EXCEPTION_VECTOR_MF:
			break;
		case SGX_EXCEPTION_VECTOR_UD:
			break;
		case SGX_EXCEPTION_VECTOR_XM:
			break;
	}
	return EXCEPTION_CONTINUE_SEARCH;
}

int add_hooks_for_exception()
{
	void *ret = sgx_register_exception_handler(0, exception_handler);
	if(ret !=  NULL)
	{
		PrintDebugInfo("handler registered\n");
	}
	else{
		PrintDebugInfo("handler not registered\n");
	}
}

/* for debugging */
size_t Ecall_cs_disasm(csh handle, cs_insn *insn){
	//cs_insn *insn;
	size_t count;
	unsigned char buf_test[] =
	{
		0x74, 0x1d,
		0xc4, 0xe3, 0xe9, 0x6a, 0x09, 0x00,
		0xc4, 0xa3, 0x71, 0x6d, 0x04, 0x0e, 0x00,
		0xc4, 0xc3, 0xc1, 0x7b, 0x44, 0xc7, 0xf8, 0x10,
		0xc4, 0xe3, 0xe9, 0x6f, 0xc9, 0x00,
		0xc4, 0xe3, 0x51, 0x6b, 0x08, 0x10,
		0xc4, 0xe3, 0x49, 0x79, 0x05, 0x20, 0x7e, 0x33, 0x00, 0x10,
		0x8f, 0xe8, 0x58, 0x9e, 0xd0, 0x30,
		0x8f, 0xe8, 0x48, 0xce, 0xca, 0x03,
		0x8f, 0xe8, 0x68, 0xa2, 0xc5, 0x40,
		0x8f, 0xe9, 0x70, 0x9a, 0xcc,
		0x8f, 0xe8, 0xd0, 0xa3, 0x05, 0x18, 0x33, 0x2e, 0x00, 0x60,
		0xc4, 0xe3, 0x79, 0x0b, 0xc0, 0x0a,
		0x62, 0xf1, 0xed, 0x48, 0xfb, 0xd6,
		0x62, 0xb1, 0x3d, 0x48, 0x72, 0x34, 0x8e, 0x03,
		0x62, 0xe2, 0x7e, 0x48, 0x3a, 0xcb,
		0x62, 0xf2, 0x6d, 0x4a, 0x64, 0xc1,
		0xc4, 0xe3, 0x79, 0x0b, 0xc8, 0x02,
		0x62, 0xb1, 0xfd, 0x08, 0x2e, 0xc5,
		0x66, 0x0f, 0x3a, 0x0a, 0xc0, 0x02,
		0x62, 0xd2, 0xf5, 0x78, 0xb8, 0xd1,
		0xf2, 0x44, 0x0f, 0x10, 0xb4, 0x24, 0x98, 0x00, 0x00, 0x00,
		0x00
	};

	PrintDebugInfo("-----registering hooks for exception-----\n");
	add_hooks_for_exception();
	//PrintDebugInfo("-----test arithmetic exception-----\n");
	//int x = 5/0;
	//PrintDebugInfo("-----test other exceptions-----\n");

	PrintDebugInfo("-----checking disasm-----\n");
	count = cs_disasm_dbg(handle, buf_test, sizeof(buf_test)-1, 0x1000, 0, &insn, PrintDebugInfoOutside, PrintDebugInfoOutside2);
	//count = cs_disasm(handle, buf_test, sizeof(buf_test)-1, 0x1000, 0, &insn);

	/*
	//Weijie: test
	count = 1;
	insn[0].id = 1;
	insn[0].address = 0;
	insn[0].size = 1;
	// 24 zeros
	for (int l = 0; l < 24; l++)
	(insn[0].bytes)[l] = 0;
	char a[32] = "mnemonic";
	strncpy(insn[0].mnemonic, a, sizeof(insn[0].mnemonic));
	char b[160] = "op_srt";
	strncpy(insn[0].op_str, b, sizeof(insn[0].op_str));
	insn[0].detail = NULL;
	*/
	return count;
}

/*******************************************************/
