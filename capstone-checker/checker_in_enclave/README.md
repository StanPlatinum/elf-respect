### Before doing make, remember to build a soft link:

sudo ln -s /usr/include/x86_64-linux-gnu/gnu /usr/include/gnu

### As to INC Path, inside enclave:

I don't add -I~/capstone/include into the CHECKER_Static_INC_PATH, just using -IInclude...

### Remember to use my own capstone version:

https://github.com/lpjlwj/capstone
