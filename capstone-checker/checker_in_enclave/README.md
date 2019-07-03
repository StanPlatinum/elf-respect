### Before doing make, remember to build a soft link:

sudo ln -s /usr/include/x86_64-linux-gnu/gnu /usr/include/gnu

### As to INC Path, inside enclave:

I don't add -I~/capstone/include into the CHECKER_Static_INC_PATH, just using -IInclude ...

### Remember to use my own capstone and elfutils version:

https://github.com/lpjlwj/capstone

to build elfutils in dyninst, remember to add -DENABLE_STATIC_LIBS=YES to the tail of cmake command ...

