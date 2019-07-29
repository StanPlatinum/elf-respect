CC = clang
#CC = gcc
CXX = clang++

#TARGET_NAME = test
TARGET_NAME = nw4test
#TARGET_NAME = bm_malloc_simple

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

EXTRA_FLAGS1 = -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

#LIBC_DIR = ./TrustedLib
#LIBC_PATH = $(LIBC_DIR)/libc_static.a
NOLIBC_FLAG = -nodefaultlibs -nostdlib

LIBCDIR = musl-libc
LIBC = $(LIBCDIR)/lib/libc.a

#Weijie: add Makefile in lib/ for ocalls
OCALL_OBJS_DIR = lib/
OCALL_LIB_MK = lib/ocall.mk
include $(OCALL_LIB_MK)

ASM_OBJS = lib/stack.o lib/start.o lib/ocall.o

#Weijie: use musl-libc to provide exit.o
SGX_CFLAGS = $(BASE_CFLAGS) -I$(LIBCDIR)/include -fno-stack-protector -fvisibility=hidden

all: $(LIBC) $(TARGET_NAME)

$(LIBC):
	(cd musl-libc; ./configure)
	make -C musl-libc lib/libc.a

$(TARGET_NAME): objs/libc_targetprogram.a tools/linker $(OCALL_OBJS) $(ASM_OBJS)
	cp lib/*.o objs
	ls objs/*.o > list
	cat list | ./tools/linker $(TARGET_NAME)
	@echo "Build successfully!"

lib/%.o: lib/%.s
	$(CC) -c -o $@ $<

#Weijie: generate target obj file
enclave_main.o: $(TARGET_NAME).c enclave.h
	$(CC) -S -I. -o enclave_main.s $<
	gcc -c enclave_main.s -o $@
	#gcc -c new.s -o $@

tools/linker: tools/linkage_editor.cpp
	$(CXX) -o $@ $^

#Weijie: prepare whole static linked (with libc_static.a) obj and execute Makefile in Dir objs/
objs/libc_targetprogram.a: enclave_main.o malloc.o $(LIBC) 
	cp $^ objs/
	$(MAKE) -C objs
	cp malloc.o objs/

#Weijie: add malloc.o 
malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC) -c $(SGX_CFLAGS) -o $@ $<

clean:
	rm -f enclave_main.s *.o objs/*.o objs/*.lo list $(TARGET_NAME) \
		lib/*.o

clean-all:
	rm -f *.o *.a objs/*.o objs/*.lo objs/*.a list $(TARGET_NAME) \
                tools/linker lib/*.o
	$(MAKE) -C musl-libc clean

