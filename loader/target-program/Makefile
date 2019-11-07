
#CC = /home/weijliu/llvm-source/build/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

CC4AS = /home/liuweijie/llvm-assembler/build/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables
CC = clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

CXX = clang++

#TARGET_NAME = malloc_and_sort
#TARGET_NAME = bm_malloc_simple
#TARGET_NAME = bm_hello
TARGET_NAME = nw
#TARGET_NAME = foo2

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

NOLIBC_FLAG = -nodefaultlibs -nostdlib

MUSL_LIBC_DIR = ./musl-libc
MUSL_LIBC = $(MUSL_LIBC_DIR)/lib/libc.a
SGX_CFLAGS = $(BASE_CFLAGS) -I$(MUSL_LIBC_DIR)/include -fno-stack-protector -fvisibility=hidden

#Weijie: add Makefile in lib/ for ocalls
OCALL_OBJS_DIR = lib/
OCALL_LIB_MK = lib/ocall.mk
include $(OCALL_LIB_MK)

ASM_OBJS = lib/stack.o lib/start.o lib/ocall.o lib/rop_gadget.o

all: $(MUSL_LIBC) $(TARGET_NAME)
	mv $(TARGET_NAME) ../program

$(MUSL_LIBC):
	(cd musl-libc; ./configure)
	make -C musl-libc lib/libc.a

$(TARGET_NAME): objs/libc_targetprogram.a tools/linker malloc.o $(OCALL_OBJS) $(ASM_OBJS)
	cp malloc.o objs/
	cp lib/*.o objs
	ls objs/*.o > list
	cat list | ./tools/linker $(TARGET_NAME)
	@echo "Build successfully!"

lib/%.o: lib/%.s 
	$(CC4AS) -c -o $@ $<

tools/linker: tools/linkage_editor.cpp
	$(CXX) -o $@ $^

objs/libc_targetprogram.a: enclave_main.o malloc.o $(MUSL_LIBC)
	cp $^ objs/
	$(MAKE) -C objs

malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC4AS) -c $(SGX_CFLAGS) -o $@ $<

enclave_main.o: $(TARGET_NAME).c enclave.h
	$(CC) -S -I. -o enclave_main.s $<
	$(CC) -c enclave_main.s -o $@

clean:
	rm -f *.o *.a objs/*.o objs/*.lo objs/*.a list $(TARGET_NAME)

clean-all:
	rm -f *.o *.a objs/*.o objs/*.lo objs/*.a list $(TARGET_NAME) \
                tools/linker lib/*.o
	$(MAKE) -C musl-libc clean

