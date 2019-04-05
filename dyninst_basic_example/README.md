# This is a basic usage example for beginners.

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
before make, you may want to change the $DYNINST_ROOT in the Makefile

and set your LD_LIBRARY_PATH in ~/.bashrc file, e.g., adding 

\# User specific aliases and functions
export DYNINST_ROOT=/home/xmeng/dyninstapi/install
export BOOST_ROOT=/home/xmeng/dyninstapi/build/boost/boost-install
export TBB_RELEASE_LIB=/home/xmeng/dyninstapi/build/tbb/src/TBB/build/linux_intel64_gcc_cc7_libc2.25_kernel4.15.17_release
export ELF_UTIL_LIB=/home/xmeng/dyninstapi/build/elfutils/lib
export DYNINSTAPI_RT_LIB=$DYNINST_ROOT/lib/libdyninstAPI_RT.so
export LD_LIBRARY_PATH=.:$ELF_UTIL_LIB:$DYNINST_ROOT/lib:$BOOST_ROOT/lib:$TBB_RELEASE_LIB:$LD_LIBRARY_PATH
export TBB_INC=/home/xmeng/dyninstapi/build/tbb/src/TBB/include
export PATH=/home/xmeng/hpctoolkit/INSTALL/bin:$PATH

to the tail of your ~/.bashrc file

make

# Run the demo
./test_dynamic

check the [pid] it shows and keep the [pid]

./modify [pid]
