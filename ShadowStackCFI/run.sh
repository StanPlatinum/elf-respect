#!/bin/bash 

#LLVM_PATH="/home/weijliu/llvm-project"
LLVM_PATH="/home/liuweijie/llvm-project"
LLVM_BIN_PATH=$LLVM_PATH"/build/bin"

CFIHello_So_PATH=$LLVM_PATH"/build/lib/LLVMCFIHello.so"
echo $CFIHello_So_PATH

#ShadowStackCFI_PATH="/home/liuweijie/elf-respect/ShadowStackCFI"
ShadowStackCFI_PATH="."

#TARGET_SOURCE=$ShadowStackCFI_PATH"/foo2.c"
#TARGET_SOURCE=$ShadowStackCFI_PATH"/bm_malloc_and_sort.c"
TARGET_SOURCE=$ShadowStackCFI_PATH"/nw4test.c"

CFICheck_Func_PATH=$ShadowStackCFI_PATH"/CFICheck.c"
echo $CFICheck_Func_PATH

CFIShell_PyPATH=$ShadowStackCFI_PATH"/CFIShell.py"

echo "start generating compiled binary..."

python3 $CFIShell_PyPATH $LLVM_BIN_PATH $CFIHello_So_PATH $TARGET_SOURCE $CFICheck_Func_PATH n
