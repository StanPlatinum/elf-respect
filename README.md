## Privacy-preserving TEE protoype on a service-oriented environment

***

# Usage:

## build libelf

git clone https://github.com/StanPlatinum/elfutils4sgx.git

cd elfutils4sgx/elfutils-0.176

autoheader

aclocal -I m4

autoconf

automake -a -c

./configure

make

## build capstone

git clone https://github.com/StanPlatinum/capstone.git

## build llvm/clang

git clone https://github.com/StanPlatinum/llvm-project.git

cd llvm-project

mkdir build && cd build

cmake -G 'Unix Makefiles' ../llvm -DLLVM_ENABLE_PROJECTS=clang -DLLVM_TARGETS_TO_BUILD="X86"

make

## generate target binary

cd ..

cd dynamic-loader/target-program

make

## build loader

cd ..

### copy dependencies to Enclave/TrustedLib

cp elfutils4sgx/elfutils-0.176/libelf/libelf.a Enclave/TrustedLib

### set variables in Makefile

make
