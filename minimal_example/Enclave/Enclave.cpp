#include <stdarg.h>
#include <stdio.h>

#include "Enclave.h"
#include "Enclave_t.h"

#include "string.h"

/* re-define printf inside enclave */
void printf(const char *fmt, ...){
	char buf[BUFSIZ] = {'\0'};
	va_list ap;
	va_start(ap, fmt);
	vsnprintf(buf, BUFSIZ, fmt, ap);
	va_end(ap);
	Ocall_PrintString(buf);
}

void Ecall_SomeDataProcessing(char *buf, size_t len){
	const char *secret = "I am secret inside enclave!";
	if(len > strlen(secret))
	{
		memcpy(buf, secret, strlen(secret)+1);
	}
}

void Ecall_MaliciousDataProcessing(uint64_t address){
	int *p_inside = (int *)address;
	*p_inside = 100;
}
