This version of checker has been tested on my Thinkpad.

# Usage:

~~./app ../checker~~

./app

### Before doing make, remember to build a soft link:

sudo ln -s /usr/include/x86_64-linux-gnu/gnu /usr/include/gnu

### As to INC Path, inside enclave:

I don't add -I~/capstone/include into the CHECKER_Static_INC_PATH, just using -IInclude ...

### Remember to use my own capstone and elfutils version:

https://github.com/lpjlwj/capstone

https://github.com/lpjlwj/elfutils4sgx

As for libelf, I have modified ~/elfutils4sgx/elfutils-0.176/libelf/elf_begin.c

And after building libelf.a, copy ~/elfutils4sgx/elfutils-0.176/libelf/libelf.a to path: ~/dyninst_in_enclave/capstone-checker/checker_in_enclave/Enclave/TrustedLib

***

To build the libelf.a:

autoheader

aclocal -I m4

autoconf

automake -a -c

./configure

make

***

---

### Still debugging the libelf for using it inside enclave ...

~~to build elfutils in dyninst, remember to add -DENABLE_STATIC_LIBS=YES to the tail of cmake command ...~~

