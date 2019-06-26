#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <unistd.h>

#include "Enclave.h"
#include "Enclave_t.h"

/* My private Enclave functions */
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
	//Ocall_PrintString("PDIO test\n");
	Ocall_PrintString("PDIO test in ud->disasm...\n");
}

#include "libelf.h"
#include "my_stdio.c"

/* Weijie: old version */
int Ecall_entry(void) {
	/* Weijie: new enclave starts here. */
	csh handle;
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

#if 0
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
#endif

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
	PrintDebugInfo("-----checking disasm-----\n");
	count = cs_disasm_dbg(handle, buf_test, sizeof(buf_test)-1, 0x1000, 0, &insn, PrintDebugInfoOutside);
	//count = cs_disasm(handle, buf_test, sizeof(buf_test)-1, 0x1000, 0, &insn);

#if 0
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
#endif
	return count;
}
