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
        void *this_enclave_base = get_enclave_base();
        size_t this_enclave_size = get_enclave_size();
}
