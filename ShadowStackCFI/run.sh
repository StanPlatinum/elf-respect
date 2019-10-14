#!/bin/bash 

LLVM_PATH="/home/weijliu/llvm-project"
LLVM_BIN_PATH=$LLVM_PATH"/build/bin"

CFIHello_So_PATH=$LLVM_PATH"/build/lib/LLVMCFIHello.so"
echo $CFIHello_So_PATH

TARGET_SOURCE=`pwd`"/foo2.c"

CFICheck_Func_PATH=`pwd`"/CFICheck.c"
echo $CFICheck_Func_PATH

echo "start generating compiled binary..."

python3 CFIShell.py $LLVM_BIN_PATH $CFIHello_So_PATH $TARGET_SOURCE $CFICheck_Func_PATH o
