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


//Weijie: for computing base
#include <trts_internal.h>
#include <trts_util.h>


void try2write_stackbase(){

	PrintDebugInfo("starting...\n");
        void *this_enclave_base = get_enclave_base();
        size_t this_enclave_size = get_enclave_size();
	
	PrintDebugInfo
	("base: 0x%x, size: 0x%x\n", this_enclave_base, this_enclave_size);

	size_t this_enclave_end = get_enclave_end();
	PrintDebugInfo("end: 0x%x\n", this_enclave_end);

	size_t maxAddr = (size_t)this_enclave_base + (size_t)this_enclave_size;
	PrintDebugInfo("maxAddr: 0x%x\n", this_enclave_end);
	
	unsigned char *al;
	PrintDebugInfo("allocating...\n");
	size_t al_num = (size_t)this_enclave_size / 4000;
	PrintDebugInfo("al_num: 0x%lx\n", al_num);
	al = (unsigned char *)malloc(al_num * (sizeof(unsigned char)));
	PrintDebugInfo("initializing...\n");
	for (int i = 0; i < al_num; i++){
		al[i] = '1';
	}
	PrintDebugInfo("al[end - 1]: %c\n", al[this_enclave_size - 1]);
	
	size_t* test;
	test = (size_t *)(this_enclave_end);
	PrintDebugInfo("trying to write end...\n");
	//*test = 10;

	PrintDebugInfo("finishing...\n");
}
