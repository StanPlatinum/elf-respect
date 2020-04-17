/* a very simple test program */

#include <stdio.h>
#include <stdlib.h>

#include "CFICheck.h"
//#include "CFICheck.c"
#include "enclave.h"
//#include "foo1.h"

#if 0
void useless()
{
	int a = 0, b = 1;
	if (a < b)
	{
		CFICheck(0);
	}
	else
	{
		exit(0);
	}
	return;
}
#endif

void enclave_main()
{
	//unsigned long long magic = 1;
    puts("hello");
    enclave_exit();
}
