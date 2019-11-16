/* a very simple test program */

//#include <stdio.h>
//#include <stdlib.h>
#include "enclave.h"

#include "CFICheck.h"

void enclave_main()
{
	CFICheck(0);
	puts("test1");
	//Weijie: the magic must be initialized
	unsigned long magic = 0;
	char* buf = (char*)malloc(0x80);
	free(buf);
	puts("test2");
	puts("finished");
	enclave_exit();
}
