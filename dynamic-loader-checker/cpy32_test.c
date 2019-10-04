#include <linux/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef __u64 Elf64_Addr;

void cpy_imm2addr32(Elf64_Addr *dst, uint32_t src) {
 Elf64_Addr tmp = (*dst) & 0xffffffff00000000;
 tmp = tmp ^ src;
 *dst = tmp;
}

int main(void) {
 __u64 addr = 0xffffffffffffffff;
 printf("[1] addr is 0x%llx\n", addr);

 int imm = 0xf;
 cpy_imm2addr32(&addr, imm);
 printf("[2] addr is 0x%llx\n", addr);

 return 0;
}
