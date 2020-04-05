#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <time.h>
#include "Enclave_u.h"

unsigned long rdtsc()
{
	unsigned long hi,lo;
	__asm
		(
		 "rdtsc\n\t"
		 :"=a"(lo), "=d"(hi)
		);
	return (lo | (hi << 32));
}

extern sgx_enclave_id_t global_eid;

void *secure_timer_thread_function(void *param)
{
	secure_timer(global_eid);
	//while(1)printf(".");
}

//will be instrumented before main ecall
void instrument_function_init(int i)
{
	//printf("instrument_function_init!\n");
	main_ssa_init(global_eid);
}
