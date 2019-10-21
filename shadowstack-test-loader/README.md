This version of loader/target-program has been tested on bio-sgx06.
This version of loader/target-program-original has been tested on my thinkpad.

## Usage

***

### Basic usage

1. build target relocatable elf

cd target-program && make

2. build sgx application 

cd .. && make

### Optional commands:

1. generate symtab debugging tool

make symtab_test

2. run the tool

./symtab_test $(TARGET_NAME)

------------------------------------
Notes:
------------------------------------

1. modifying the Makefile: (already push to my branch)

------------------------------------
Memory Layouts:
------------------------------------

__ss_start (Here begins the .sgx.ssblob: 4M)

4M memory space for shadow stack

__cfi_start (Here begins the .sgx.calltg: 4M)

4M memory space for storing indirect jump targets

__elf_start	(Here begins the .sgx.code: 56M)

24M memory space for ?

_SGXCODE_BASE

32M memory space for received binary

__elf_end, __HEAP_BASE
(HEAP BASE would be a slightly larger than elf end.)

0x27000 Bytes space for loader's own heap

_SGXDATA_BASE

some space for .data section from received binary

...
