# This is a basic dyninst usege example for beginners.

### Thanks for Xiaozhu's helpful instructions, and the following two blogs. Here are links:
https://blog.csdn.net/touatou/article/details/79498006
https://blog.csdn.net/Touatou/article/details/79404562

## Install Dyninst

### Prerequisites
OS: Ubuntu 16.04/18.04

Necessary tools: g++, boost, libelf, libdwarf, libtbb (all can be installed via the 'apt install' command)

### Compile Dyninst
Download the source code from github:
https://github.com/dyninst/dyninst

Simplely follow the instructions on Dyninst's github README: cmake, make, and sudo make install

# Go with the example

### Compile the target program
gcc test_dynamic.c -o test_dynamic

### Compile the injection program
make

# Run the demo
./test_dynamic

check the [pid] it shows and keep the [pid]

./modify [pid]
