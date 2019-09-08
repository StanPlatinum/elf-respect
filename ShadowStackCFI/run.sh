#!/bin/bash 

LLVM_PATH="/home/weijliu/llvm-project"
LLVM_BIN_PATH=$LLVM_PATH"/build/bin"
CFIHello_So_PATH=$LLVM_PATH"/build/lib/LLVMCFIHello.so"

TARGET_SOURCE=`pwd`"/foo.c"

CFICheck_Func_PATH=`pwd`"/CFICheck.c"
echo $CFICheck_Func_PATH

Entry_Label_Table=`pwd`"/entryLabel.txt"
echo $Entry_Label_Table

echo "start generating compiled binary..."

python3 CFIShell.py $LLVM_BIN_PATH $CFIHello_So_PATH $TARGET_SOURCE $CFICheck_Func_PATH $Entry_Label_Table
