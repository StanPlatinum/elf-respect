#include <stdio.h>
#include "enclave.h"

int fun()
{
    return 1;
}

void enclave_main()
{
    int (*fp)(void);
    fp = fun;
    int b = fp();
    
    puts("success!");
    enclave_exit();
}
