#Weijie: must use gcc to compile the ENCLAVE. clang would fail due to some reasons...
#CC = clang -fno-asynchronous-unwind-tables -fno-jump-tables
CC = clang
#CC = gcc
CXX = clang++

TARGET_NAME = simple_loop

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

LIBC_DIR = ./libc
LIBC_PATH = $(LIBC_DIR)/libc.a

#Weijie: add Makefile in lib/ for ocalls
OCALL_OBJS_DIR = lib/
OCALL_LIB_MK = lib/ocall.mk

include $(OCALL_LIB_MK)

SGX_CFLAGS = $(BASE_CFLAGS) -fno-stack-protector -fvisibility=hidden
#Weijie: later the whole libc will be added into this ...

ASM_OBJS = lib/stack.o lib/start.o lib/ocall.o

all: objs/libc_targetprogram.a tools/linker $(OCALL_OBJS) $(ASM_OBJS)
	cp lib/*.o objs
	ls objs/*.o > list
	cat list | ./tools/linker $(TARGET_NAME)
	@echo "Build successfully!"

#Weijie: generate _start
lib/%.o: lib/%.s
	$(CC) -c -o $@ $<

tools/linker: tools/linkage_editor.cpp
	$(CXX) -o $@ $^

#Weijie: prepare whole static linked (with libc_static.a) obj
#Weijie: execute Makefile in Dir objs/
objs/libc_targetprogram.a: enclave_main.o malloc.o $(LIBC_PATH)
	cp $^ objs/
	$(MAKE) -C objs
	cp malloc.o objs/

#Weijie: add malloc.o 
#Weijie: But later it turns out a negligible issue. malloc.o could be compiled with either gcc or clang (llvm).
malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC) -c $(SGX_CFLAGS) -o $@ $<

#Weijie: generate target obj file: enclave_main.o
#Weijie: separated compiling
enclave_main.o: $(TARGET_NAME).c enclave.h
	$(CC) -S -I. -o enclave_main.s $<
	gcc -c enclave_main.s -o $@
	#$(CC) -c $(SGX_CFLAGS) -I. -o $@ $< 
	#gcc -c -I. -o $@ $<
	#Weijie: must use clang to compile the source .c file, otherwise _G_O_T_will not be found.

clean:
	rm -f enclave_main.s list *.o lib/*.o objs/*.o objs/*.lo $(TARGET_NAME)
