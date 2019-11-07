#SGX_Shield_PATH = /root/SGX-Shield
Our_AS_Path = /home/weijliu/SGX-Shield
#Our_AS_Path = /home/liuweijie/llvm-assembler

#LLVM_PATH = /home/liuweijie/llvm-project
LLVM_PATH = /home/weijliu/llvm-project
LLVM_BIN_PATH = $(LLVM_PATH)/build/bin
CFIHello_So_PATH = $(LLVM_PATH)/build/lib/LLVMCFIHello.so

#CC = $(LLVM_PATH)/build/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables
CC4AS = $(Our_AS_Path)/llvm/build/bin/clang-4.0 -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

CLEAN_CC = /home/weijliu/llvm-source/build/bin/clang
AS = $(CLEAN_CC) -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables
#AS = $(CC)

# Now the target name will be a dir
TARGET_NAME = foo2
#TARGET_NAME = bm_malloc_and_sort
#TARGET_NAME = bm_malloc_simple
#TARGET_NAME = bmms
#TARGET_NAME = bmmas
#TARGET_NAME = malloc_and_sort
#TARGET_NAME = nw4test
#TARGET_NAME = nw

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

LIBC_DIR = libc
LIBC = $(LIBC_DIR)/libc.a

SGX_CFLAGS = $(BASE_CFLAGS) -fno-stack-protector -fvisibility=hidden

OCALL_OBJS_DIR = lib/
OCALL_LIB_MK = lib/ocall.mk
include $(OCALL_LIB_MK)

ASM_OBJS = lib/stack.o lib/start.o lib/ocall.o lib/rop_gadget.o lib/my_itoa.o

all: $(LIBC) $(TARGET_NAME).bin
	mv $(TARGET_NAME).bin ../program
	cp $(TARGET_NAME)/$(TARGET_NAME).txt ../entryLabel.txt

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

objs/libc_targetprogram.a: enclave_main.o $(LIBC)
	cp $^ objs/
	$(MAKE) -C objs

malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC4AS) -c $(SGX_CFLAGS) -o $@ $<

$(TARGET_NAME).s:
	python3 ./CFIShell.py $(LLVM_BIN_PATH) $(CFIHello_So_PATH) $(TARGET_NAME).c ./CFICheck.c n
	cp $(TARGET_NAME)/$(TARGET_NAME)_opt.s $@

enclave_main.o: $(TARGET_NAME).s enclave.h
	$(AS) -c $< -o $@

clean:
	rm -f *.ll *.s *.o objs/*.o objs/*.lo objs/*.a \
		list lib/*.o
	rm -rf $(TARGET_NAME)

clean-all:
	rm -f *.o *.a objs/*.o objs/*.lo objs/*.a list \
		tools/linker lib/*.o
	rm -rf $(TARGET_NAME)

