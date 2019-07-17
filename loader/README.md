## Usage:

1. build target relocatable elf

cd target-program && make

2. build sgx application 

cd .. && make

optional command:

1. generate symtab debugging tool

make symtab_test

2. run the tool

./symtab_test $(TARGET_NAME)

------------------------------------

Approach 1: Anyone could choose to modify p_flags in the code seg of the static executable file, from PF_R|PF_X to PF_R|PF_W|PF_X, making the ELF's code seg writable after making (objdump-ing) and loading.

Approach 2: Dynamically load the program on RWX pages _as input data_, then run it.

SGX-Shield uses the 2nd way.

------------------------------------
Weijie: Some Notes
------------------------------------
1. modifying the Makefile:
(already push to my branch)

2. making a soft link like this (on my thinkpad):

/lib/ld64.so.1 -> /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2*

3. remember to build it with just "make" (already DEBUG ?= ON and use HW/SGX_DEBUG mode)

***

## Analyzing sgx-shield

Clearly, it uses objcopy to attach two sections with section flag assigned...
In the Makefile, Enclave/%.o have been built using the following command:
```
Enclave/%.o: Enclave/%.cpp $(IN_ENCLAVE_PROGRAM)
	$(CXX) $(Enclave_Cpp_Flags) $(DEFINE_IN_ATTACK_H) -c $< -o $@
	@objcopy --add-section .sgx.bin=$(IN_ENCLAVE_PROGRAM) --set-section-flags .sgx.bin=alloc,data $@
	@fallocate -l 32M blob
	@objcopy --add-section .sgx.code=blob --set-section-flags .sgx.code=alloc,data,code $@
```

It also uses define_symbols.lds (a partial linker scripts for the above-mentioned sections) to do the alignment:
```
    .sgx.code ALIGN(0x1000): {
        __sgx_code = .;
        *(.sgx.code)
    }
```
