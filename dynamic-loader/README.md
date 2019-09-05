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

2. making a soft link like this (on my thinkpad):

/lib/ld64.so.1 -> /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2

------------------------------------
Memory Layouts:
------------------------------------

__elf_start	(Here begins the .sgx.code: 64M)

32M memory space for ?

_SGXCODE_BASE

32M memory space for received binary

__elf_end, __HEAP_BASE
(HEAP BASE would be a slightly larger than elf end.)

0x27000 Bytes space for loader's own heap

_SGXDATA_BASE

some space for .data section from received binary

...
