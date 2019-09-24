#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <unistd.h>

#include "Enclave.h"
#include "Enclave_t.h"

//Weijie: debug
/* My private Enclave function */
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

/* Weijie: if the return value is 1, then it means that this insn[j] is writting memory */
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

/* Weijie: used be an ecall of whole cs_open/disasm/close */
int cs_disasm_entry(unsigned char* buf_test, Elf64_Xword textSize, Elf64_Addr textAddr) {
	//PrintDebugInfo("Weijie: new enclave starts here.\n");
	csh handle;
	cs_insn *insn;
	size_t count;
	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
		PrintDebugInfo("ERROR: Failed to initialize engine!\n");
		return -1;
	}

	count = cs_disasm(handle, buf_test, textSize, textAddr, 0, &insn);
	PrintDebugInfo("-----printing-----\n");
	if (count) {
		size_t j;
		//Weijie: test
		int if_memwt = 0;
		int if_cmp_imm = 0;
		for (j = 0; j < count; j++) {
			PrintDebugInfo("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);
			//Weijie: test
			if_cmp_imm = find_cmp_imm(handle, CS_MODE_64, &insn[j]);
			if_memwt = find_memory_write(handle, CS_MODE_64, &insn[j]);
			if (if_memwt > 0)	PrintDebugInfo("\tThe above insn is writting memory!\n");
			if (if_cmp_imm > 0)	PrintDebugInfo("\tThe above insn is accessing imm!\n");

		}
		cs_free(insn, count);
	} else
		PrintDebugInfo("ERROR: Failed to disassemble given code!\n");
	cs_close(&handle);

	return 0;
}

