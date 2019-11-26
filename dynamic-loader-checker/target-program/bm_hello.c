/* a very simple test program */

#include <stdio.h>
#include <stdlib.h>
#include "enclave.h"

#include "CFICheck.c"

void enclave_main()
{
    puts("hello");
    enclave_exit();
}
