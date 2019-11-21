/* a very simple test program */

//#include <stdio.h>
//#include <stdlib.h>
#include "enclave.h"

//#include "CFICheck.h"
#include "CFICheck.c"

void enclave_main()
{
	puts("test0");
	//CFICheck(0);
	char *test = "simple";
	puts(test);
	//Weijie: the magic must be initialized
	unsigned long magic = 0;
	char* buf = (char*)malloc(0x80);
	puts("test1");
	free(buf);
	//puts("test2");
	puts("finished");
	enclave_exit();
}
