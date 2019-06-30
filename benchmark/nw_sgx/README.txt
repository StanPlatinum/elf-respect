Being tested again, the demo could be run carefully.
Please note that the size of input1 cannot be 10...

----------------------
Introduction of nw_sgx
----------------------
add stdbool.h into Include dir
add nw.h into Enclave dir
ECALL: 
- void Ecall_nw([in, string] char *seq_1, [in, string] char *seq_2, [in, out, string] char *seq_1_al, [in, out, string] char *seq_2_al, bool prm);
OCALL: 
- void Ocall_PrintString([in, string] const char *str);

------------------------------------
How to Build/Execute nw_sgx
------------------------------------
1. Install Intel(R) SGX SDK for Linux* OS
2. Build the project with the prepared Makefile:
    a. Hardware Mode, Debug build:
        $ make
    b. Hardware Mode, Pre-release build:
        $ make SGX_PRERELEASE=1 SGX_DEBUG=0
    c. Hardware Mode, Release build:
        $ make SGX_DEBUG=0
    d. Simulation Mode, Debug build:
        $ make SGX_MODE=SIM
    e. Simulation Mode, Pre-release build:
        $ make SGX_MODE=SIM SGX_PRERELEASE=1 SGX_DEBUG=0
    f. Simulation Mode, Release build:
        $ make SGX_MODE=SIM SGX_DEBUG=0
3. Execute the binary directly:
    $ ./app sequence1 sequence2
4. Remember to "make clean" before switching build mode

