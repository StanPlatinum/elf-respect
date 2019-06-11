#include <stdio.h>
#include <string.h>
#include <stdarg.h>

#include "Enclave.h"
#include "Enclave_t.h"

#include "my_stdio.h"
#include "my_stdio.c"

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

void Ecall_entry() {
}
