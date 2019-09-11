#include <stdio.h>
#include <stdlib.h>

#include "enclave.h"

void enclave_main(){
  int x;
  int *x_add = &x;

  x_add = x_add + 1000000000;
  *x_add = 5;
}
