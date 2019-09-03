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
        __sgx_code = .;
        *(.sgx.code)
    }
    . = . + 0x200000;
}
__elf_end = .;
