# This is a basic usage example for beginners.

### Thanks for Xiaozhu's helpful instructions, and the following two blogs. Here are links:
https://blog.csdn.net/touatou/article/details/79498006

https://blog.csdn.net/Touatou/article/details/79404562

## Install Dyninst

### Prerequisites
OS: Ubuntu 16.04/18.04

Necessary tools: g++, boost, libelf, libdwarf, libtbb (all can be installed via the 'apt install' command)

Actually you can avoid this since boost, libelf, libdwarf, and libtbb will be downloaded and installed from source code during installing dyninst. 

### Compile Dyninst
Download the source code from github:
https://github.com/dyninst/dyninst

Simplely follow the instructions on Dyninst's github README: cmake, and sudo make install

For better use, you can

mkdir dyninst-build

mkdir dyninst-install

cd dyninst-build

cmake ../$(DYNINST_ROOT) -DCMAKE_INSTALL_PREFIX=./dyninst-install

# Go with the example

### Compile the target program
gcc test_dynamic.c -o test_dynamic

### Compile the injection program
before make, you may want to change the $DYNINST_ROOT in the Makefile

and set your LD_LIBRARY_PATH in ~/.bashrc file, e.g., adding: 


\# User specific aliases and functions

export DYNINST_ROOT= WHERE YOUR DYNINST DOWNLOAD DIR IS

export DYNINST_BUILD_DIR=WHERE YOUR DYNINST BUILD DIR IS

export ELF_UTIL_LIB=$DYNINST_BUILD_DIR/elfutils/lib

export DYNINSTAPI_RT_LIB=$DYNINST_ROOT/lib/libdyninstAPI_RT.so

export LD_LIBRARY_PATH=.:$ELF_UTIL_LIB:$DYNINST_ROOT/lib:$BOOST_ROOT/lib:$TBB_RELEASE_LIB:$LD_LIBRARY_PATH


to the tail of your ~/.bashrc file

make

after all setting done, you can use ldd commmand to check if the libs are linked as you expect.

# Run the demo
./test_dynamic

check the [pid] it shows and keep the [pid]

./modify [pid]
