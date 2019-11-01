
#SGX_Shield_PATH = /root/SGX-Shield
#SGX_Shield_PATH = /home/weijliu/SGX-Shield
SGX_Shield_PATH = /home/liuweijie/my-sgx-shield

#Our_LLVM_PATH = /home/weijliu/llvm-project

CC4OCALL = $(SGX_Shield_PATH)/llvm/build/bin/clang-4.0 -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables
CC = clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables
#CC = $(CC4OCALL)
#CC = $(Our_LLVM_PATH)/build/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

# Now the target name will be a dir
TARGET_NAME = foo2

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

LIBC_DIR = ./libc
LIBC = $(LIBC_DIR)/libc.a
SGX_CFLAGS = $(BASE_CFLAGS) -fno-stack-protector -fvisibility=hidden

#Weijie: add Makefile in lib/ for ocalls
OCALL_OBJS_DIR = lib/
OCALL_LIB_MK = lib/ocall.mk
include $(OCALL_LIB_MK)

ASM_OBJS = lib/stack.o lib/start.o lib/ocall.o lib/rop_gadget.o lib/my_itoa.o

all: $(LIBC) $(TARGET_NAME).bin
	mv $(TARGET_NAME).bin ../program
	cp ./ShadowStackCFI/$(TARGET_NAME)/$(TARGET_NAME).txt ../entryLabel.txt

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
	$(CC4OCALL) -c -o $@ $<

tools/linker: tools/linkage_editor.cpp
	$(CXX) -o $@ $^

objs/libc_targetprogram.a: enclave_main.o $(LIBC)
	cp $^ objs/
	$(MAKE) -C objs

malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC4OCALL) -c $(SGX_CFLAGS) -o $@ $<

$(TARGET_NAME).s:
	cp ./ShadowStackCFI/$(TARGET_NAME)/$(TARGET_NAME)_opt.s $@

enclave_main.o: $(TARGET_NAME).s enclave.h
	$(CC) -c $(SGX_CFLAGS) -o $@ $(LINKERFLAG) $<

clean:
	rm -f *.s *.o objs/*.o objs/*.lo objs/*.a list \
		lib/*.o

clean-all:
	rm -f *.o *.a objs/*.o objs/*.lo objs/*.a list $(TARGET_NAME) \
                tools/linker lib/*.o
	$(MAKE) -C musl-libc clean

