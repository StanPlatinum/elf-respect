#include <stdio.h>
#include <stdlib.h>
#include "enclave.h"

int getNumber(int x){
  return x * 2;
}

void enclave_main(){
  int x;
  int *x_add = &x;

  puts("Fine\n");

  x_add = x_add + getNumber(500000);
 
  *x_add = 5;

   enclave_exit();
}
