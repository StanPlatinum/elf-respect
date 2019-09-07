## Privacy-preserving TEE protoype on a service-oriented environment

***

# Usage:

## build llvm/clang

cd llvm-project

mkdir build && cd build

cmake -G 'Unix Makefiles' ../llvm -DLLVM_ENABLE_PROJECTS=clang -DLLVM_TARGETS_TO_BUILD="X86"

make

## generate target binary

cd ..

cd dynamic-loader

cd target-program

make

## build loader

cd ..

make
