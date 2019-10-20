
#SGX_Shield_PATH = /root/SGX-Shield
SGX_Shield_PATH = /home/weijliu/SGX-Shield

Our_LLVM_PATH = /home/weijliu/llvm-project

CC4OCALL = $(SGX_Shield_PATH)/llvm/build/bin/clang-4.0 -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables
CC = $(Our_LLVM_PATH)/build/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

#CC = clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables
#Weijie: add llvm install path
#CC = /opt/llvm/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

#CXX = clang++

#TARGET_NAME = test
#TARGET_NAME = simple_loop
#TARGET_NAME = bm_malloc_and_sort
#TARGET_NAME = bm_malloc_simple
#TARGET_NAME = bm_hello
#TARGET_NAME = nw4test
TARGET_NAME = foo2

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

NOLIBC_FLAG = -nodefaultlibs -nostdlib

#MUSL_LIBC_DIR = ./musl-libc
#MUSL_LIBC = $(MUSL_LIBC_DIR)/lib/libc.a
#SGX_CFLAGS = $(BASE_CFLAGS) -I$(MUSL_LIBC_DIR)/include -fno-stack-protector -fvisibility=hidden

#Weijie: or use libc to provide exit.o ... and so on
LIBC_DIR = ./libc
LIBC = $(LIBC_DIR)/libc.a
SGX_CFLAGS = $(BASE_CFLAGS) -fno-stack-protector -fvisibility=hidden

#Weijie: add Makefile in lib/ for ocalls
OCALL_OBJS_DIR = lib/
OCALL_LIB_MK = lib/ocall.mk
include $(OCALL_LIB_MK)

ASM_OBJS = lib/stack.o lib/start.o lib/ocall.o lib/rop_gadget.o

#all: $(MUSL_LIBC) $(TARGET_NAME)
all: $(LIBC) $(TARGET_NAME)
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
	$(CC4OCALL) -c -o $@ $<

tools/linker: tools/linkage_editor.cpp
	$(CXX) -o $@ $^

#Weijie: prepare whole static linked (with libc_static.a) obj and execute Makefile in Dir objs/
#Weijie: could also use libc.a directly. if so, replace MUSL_LIC TO LIBC
#objs/libc_targetprogram.a: enclave_main.o malloc.o $(MUSL_LIBC)
objs/libc_targetprogram.a: enclave_main.o $(LIBC)
	cp $^ objs/
	$(MAKE) -C objs

#Weijie: add malloc.o 
malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC4OCALL) -c $(SGX_CFLAGS) -o $@ $<

#Weijie: generate target obj file
enclave_main.o: $(TARGET_NAME).c enclave.h
	$(CC) -S -I. -o enclave_main.s $<
	$(CC) -c enclave_main.s -o $@
	#$(CC) -c $(SGX_CFLAGS) -I. -o $@ $(LINKERFLAG) $<

clean:
	rm -f *.s *.o objs/*.o objs/*.lo objs/*.a list $(TARGET_NAME) \
		lib/*.o

clean-all:
	rm -f *.o *.a objs/*.o objs/*.lo objs/*.a list $(TARGET_NAME) \
                tools/linker lib/*.o
	$(MAKE) -C musl-libc clean

