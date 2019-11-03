/* a very simple test program */

//#include <stdio.h>
//#include <stdlib.h>
#include "enclave.h"

char *bufuck;

unsigned long* objs;
unsigned long* objs_end;

void init(){
	bufuck[0] = '\0';
}

void enclave_main()
{
	unsigned int i;
	objs = (unsigned long*)malloc(0x1000 * sizeof(unsigned long));
	objs_end = (unsigned long*)malloc(0x1000 * sizeof(unsigned long));
	/*
	for (i = 0;i < 0x1000; ++i) {
		size_t size = i % 5 + 5;
		objs[i] = (unsigned long)malloc(size);
		objs_end[i] = objs[i]+size;
	}
	*/

	bufuck = (char *)malloc(1 * sizeof(char));
	//init();
	//free(buf);
	puts("test");
	enclave_exit();
}
