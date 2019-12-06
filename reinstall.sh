#!/bin/bash
# Only can be used when musl-libc already being built!

echo "Configuring loader..."
cd loader
make clean
cd target-program
echo "Generating new Makefile header..."
rm -f Makefile
CC4AS=$LLVM_MC_Path"/build/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-addrsig"
echo "CC = "$CC4AS > Makefile_header4target
cat Makefile_header4target Makefile_template4target > Makefile
rm Makefile_header4target
make clean
cd ../..


echo "Configuring dynamic-loader-checker..."
cd dynamic-loader-checker
echo "Generating new Makefile header..."
rm -f Makefile
echo "SGX_SRC_PATH = "$SGXSDK_Source_Path > Makefile_header4checker
echo "ELFUTILS_PATH = "$Libelf_Path >> Makefile_header4checker
echo "CAPSTONE_PATH = "$Capstone_Path >> Makefile_header4checker
cat Makefile_header4checker Makefile_template4checker > Makefile
make clean
rm Makefile_header4checker
cd target-program
echo "Generating new Makefile header..."
rm -f Makefile
echo "LLVM_PATH = "$ProofGen_Path > Makefile_header4target
echo "Our_AS_Path = "$LLVM_MC_Path >> Makefile_header4target
cat Makefile_header4target Makefile_template4target > Makefile
rm Makefile_header4target
make clean
cd ../..


echo "Re-installed!"
