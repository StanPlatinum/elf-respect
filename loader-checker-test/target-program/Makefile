#Weijie: still must use gcc to compile the source..., clang would fail, don't know why...
CC = clang
#CC = gcc
CXX = clang++

TARGET_NAME = test

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

EXTRA_FLAGS1 = -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

LIBC_DIR = ./TrustedLib
LIBC_PATH = $(LIBC_DIR)/libc_static.a
LIBC_FLAG = -nodefaultlibs -nostdlib -L$(LIBC_PATH) -lc_static.a

#Weijie: add Makefile in lib/ for ocalls
OCALL_OBJS_DIR = lib/
OCALL_LIB_MK = lib/ocall.mk

include $(OCALL_LIB_MK)

SGX_CFLAGS = $(BASE_CFLAGS) -fno-stack-protector -fvisibility=hidden
#Weijie: later the whole libc will be added into this ...
#SGX_CFLAGS = $(BASE_CFLAGS) -I$(LIBC_DIR)/include -fno-stack-protector -fvisibility=hidden

all: objs/libc_targetprogram.a tools/linker $(ASM_OBJS)
	cp lib/*.o objs
	ls objs/*.o > list
	cat list | ./tools/linker $(TARGET_NAME)
	@echo "Build successfully!"

#Weijie: generate target obj file: enclave_main.o
enclave_main.o: $(TARGET_NAME).c enclave.h
	#$(CC) -S -I. -o enclave_main.s $<
	#gcc -c enclave_main.s -o $@
	gcc -c test.new.s -o $@

#Weijie: generate _start
lib/%.o: lib/%.s
	$(CC) -c -o $@ $<

ASM_OBJS = lib/stack.o lib/start.o

tools/linker: tools/linkage_editor.cpp
	$(CXX) -o $@ $^

#Weijie: add malloc.o 
#Weijie: Here malloc.o should be compiled with gcc, otherwise bad things (related with nonnull) will happen.
malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC) -c $(SGX_CFLAGS) -o $@ $<

#Weijie: prepare whole static linked (with libc_static.a) obj
#Weijie: execute Makefile in Dir objs/
objs/libc_targetprogram.a: enclave_main.o malloc.o $(LIBC_PATH)
	cp $^ objs/
	$(MAKE) -C objs
	cp malloc.o objs/

clean:
	rm -f enclave_main.s *.o objs/*.o objs/*.lo list $(TARGET_NAME)


