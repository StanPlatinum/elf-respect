#SGX_Shield_PATH = /root/SGX-Shield
Our_AS_Path = /home/weijliu/llvm-mc
#Our_AS_Path = /home/liuweijie/llvm-assembler

CC4AS = $(Our_AS_Path)/build/bin/clang -fPIC

#LLVM_PATH = /home/liuweijie/llvm-project

#LLVM_PATH = /home/weijliu/llvm-project
LLVM_PATH = /home/weijliu/proofGen
LLVM_BIN_PATH = $(LLVM_PATH)/build/bin
CFIHello_So_PATH = $(LLVM_PATH)/build/lib/LLVMCFIHello.so

#CC = $(LLVM_PATH)/build/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables
#CC4T = $(LLVM_PATH)/build/bin/clang -fno-asynchronous-unwind-tables -fno-addrsig -S -Xclang -load -Xclang $(CFIHello_So_PATH)
CC = $(LLVM_PATH)/build/bin/clang -fno-asynchronous-unwind-tables -fno-addrsig -Xclang -load -Xclang $(CFIHello_So_PATH)
#AS = $(CC)

TARGET_NAME = foo2

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

MUSL_LIBC_DIR = ./musl-libc
MUSL_LIBC = $(MUSL_LIBC_DIR)/lib/libc.a
SGX_CFLAGS = $(BASE_CFLAGS) -I$(MUSL_LIBC_DIR)/include -fno-stack-protector -fvisibility=hidden

OCALL_OBJS_DIR = lib/
OCALL_LIB_MK = lib/ocall.mk
include $(OCALL_LIB_MK)

ASM_OBJS = lib/stack.o lib/start.o lib/ocall.o lib/rop_gadget.o

all: $(MUSL_LIBC) $(TARGET_NAME).bin
	mv $(TARGET_NAME).bin ../program
	cp $(TARGET_NAME).txt ../entryLabel.txt

$(MUSL_LIBC):
	(cd musl-libc; ./configure)
	make -C musl-libc lib/libc.a

$(TARGET_NAME).bin: objs/libc_targetprogram.a tools/linker malloc.o $(OCALL_OBJS) $(ASM_OBJS)
	cp malloc.o objs/
	cp lib/*.o objs
	ls objs/*.o > list
	cat list | ./tools/linker $(TARGET_NAME).bin
	@echo "Build successfully!"

lib/%.o: lib/%.s
	$(CC4AS) -c -o $@ $<

tools/linker: tools/linkage_editor.cpp
	$(CXX) -o $@ $^

objs/libc_targetprogram.a: enclave_main.o $(MUSL_LIBC)
	cp $^ objs/
	$(MAKE) -C objs

malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC4AS) -c $(SGX_CFLAGS) -o $@ $<

#$(TARGET_NAME).s: $(TARGET_NAME).c
#	$(CC4T) $< -o $@

#enclave_main.o: $(TARGET_NAME).s enclave.h
enclave_main.o: $(TARGET_NAME).c enclave.h CFICheck.c
	$(CC) -c $< -o $@

clean:
	rm -f *.ll *.s *.o objs/*.o objs/*.lo objs/*.a \
		list lib/*.o
	rm -rf $(TARGET_NAME)

clean-all:
	rm -f *.o *.a objs/*.o objs/*.lo objs/*.a list \
		tools/linker lib/*.o
	rm -rf $(TARGET_NAME)
	$(MAKE) -C musl-libc clean

