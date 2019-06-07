Idea 1: Anyone could choose to modify p_flags in the code seg of the static executable file, from PF_R|PF_X to PF_R|PF_W|PF_X, making the ELF's code seg writable after loading.

Idea 2: Dynamically load the program on RWX pages, then run it.


Idea from SGX-Shield:

------------------------------------
Weijie: Some Notes
------------------------------------
1. should modify the Makefile:
already push to my branch

2. on my thinkpad, should make a soft link like this:
/lib/ld64.so.1 -> /lib/x86_64-linux-gnu/ld-linux-x86-64.so.2*

3. remember to build it with "make DEBUG=ON"

Clearly, it uses objcopy to attach two sections with section flag assigned...
In the Makefile, Enclave/%.o have been built using the following command:
```
Enclave/%.o: Enclave/%.cpp $(IN_ENCLAVE_PROGRAM)
	$(CXX) $(Enclave_Cpp_Flags) $(DEFINE_IN_ATTACK_H) -c $< -o $@
	@objcopy --add-section .sgx.bin=$(IN_ENCLAVE_PROGRAM) --set-section-flags .sgx.bin=alloc,data $@
	@fallocate -l 32M blob
	@objcopy --add-section .sgx.code=blob --set-section-flags .sgx.code=alloc,data,code $@
```
