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
