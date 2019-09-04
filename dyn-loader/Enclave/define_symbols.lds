/* 
 * Weijie: 
 * operations for .sgx.bin and .sgx.code which are inserted using objcopy
 */

/*
 * Weijie: the following is redundant
    .sgx.bin : {
        __sgx_start = .;
        *(.sgx.bin)
        __sgx_end = .;
    }
    . = . + 0x2000000;
*/

SECTIONS
{
    .sgx.code : {
        __elf_start = .;
        *(.sgx.code)
    }
    /* Weijie: reserve room for binary received from Ecall */
    /* . = . + 0x200000; */
}
__elf_end = .;
