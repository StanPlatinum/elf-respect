#!/bin/bash

echo "Welcome to S(gx)elf-Respect!"

Curr_Path=`pwd`
echo "Current Path: "$Curr_Path

Bash_Dir=$(cd "$(dirname "$0")";pwd)
echo "Bash file Path: "$Bash_Dir

if [ "$Curr_Path" != "$Bash_Dir" ]
then
	echo "Wrong install path! Please make sure you are in a right elf-respect repo!"
	exit 1
fi

cd ..
Install_Path=`pwd`
echo "Install Path: "$Install_Path


if [ ! -d "./linux-sgx" ]
then
	echo "Building SGXSDK..."
	git clone https://github.com/StanPlatinum/linux-sgx.git
	cd linux-sgx
	SGXSDK_Source_Path=`pwd`
	cd ..
else
	echo "SGXSDK already exists!"
fi

if [ ! -d "./elfutils4sgx" ]
then
	echo "Building Libelf..."
	git clone https://github.com/StanPlatinum/elfutils4sgx.git
	cd elfutils4sgx
	Libelf_Path=`pwd`
	cd elfutils-0.176
	autoheader
	aclocal -I m4
	autoconf
	automake -a -c
	./configure
	make
	if [ $? -ne 0 ]
	then
		echo "Libelf install failed!"
	else
		echo "Libelf install succeed!"
	fi
	cd ../..
else
	echo "Libelf already exists!"
fi


if [ ! -d "./capstone" ]
then
	echo "Building Capstone..."
	git clone https://github.com/StanPlatinum/capstone.git
	cd capstone
	Capstone_Path=`pwd`
	echo "Capstone Path: "$Capstone_Path
	mkdir build
	mkdir install-x86
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=../install-x86 -DCAPSTONE_ARCHITECTURE_DEFAULT=OFF -DCAPSTONE_X86_SUPPORT=1
	make
	if [ $? -ne 0 ]
	then
		echo "Capstone install failed!"
	else
		echo "Capstone install succeed!"
	fi
	cd ../..
else
	echo "Capstone already exist!"
fi


if [ ! -d "./llvm-mc" ]
then
	echo "Building LLVM-MC..."
	git clone https://github.com/StanPlatinum/llvm-mc.git
	cd llvm-mc
	LLVM_MC_Path=`pwd`
	echo "LLVM-MC Path: "$LLVM_MC_Path
	mkdir build
	cd build
	cmake -DLLVM_ENABLE_PROJECTS=clang -DLLVM_TARGETS_TO_BUILD="X86" -G "Unix Makefiles" ../llvm
	make -j2
	if [ $? -ne 0 ]
	then
		echo "LLVM-MC install failed!"
	else
		echo "LLVM-MC install succeed!"
	fi
	LLVM_MC_Bin_Path="$LLVM_MC_Path/build/bin"
	echo $LLVM_MC_Bin_Path
	cd ../..
else
	echo "LLVM-MC already exists!"
fi


if [ ! -d "./proofGen" ]
then
	echo "Building ProofGen..."
	git clone https://github.com/StanPlatinum/proofGen.git
	cd proofGen
	ProofGen_Path=`pwd`
	echo "LLVM Path: "$LLVM_Path
	mkdir build
	cd build
	cmake -DLLVM_ENABLE_PROJECTS=clang -DLLVM_TARGETS_TO_BUILD="X86" -G "Unix Makefiles" ../llvm
	make
	if [ $? -ne 0 ]
	then
		echo "ProofGen install failed!"
	else
		echo "ProofGen install succeed!"
	fi
	ProofGen_Bin_Path="$ProofGen_Path/build/bin"
	echo $ProofGen_Bin_Path
	cd ../..
else
	echo "ProofGen already exists!"
fi

echo "Install successfully!"
cd $Bash_Dir


echo "Configuring loader..."
echo "Generating Makefile header..."
CC4AS=$LLVM_MC_Path"/build/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-addrsig"
echo "CC = "$CC4AS > Makefile_header4target
cat Makefile_header4target Makefile_template4target > Makefile4target
mv Makefile4target ./loader/target-program
cd loader
make
cd target-program
make clean-all
echo "Generating musl-libc"
make CC="$CC4AS"
cd ../..

echo "Configuring dyloader..."
echo "Generating Makefile header..."
cat Makefile_header4checker Makefile_template4checker > Makefile4checker
mv Makefile4checker ./dynamic-loader-checker

echo "Generating Makefile header..."

cd dynamic-loader-checker
make
cd target-program
make clean-all
echo "Generating musl-libc"
make CC="$CC4AS"

