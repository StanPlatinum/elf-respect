#Weijie: still must use gcc to compile the source..., clang would fail, don't know why...
CC = clang
#CC = gcc
CXX = clang++

TARGET_NAME = simple_loop

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

EXTRA_FLAGS1 = -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

LIBC_DIR = ./TrustedLib
LIBC_PATH = $(LIBC_DIR)/libc_static.a
LIBC_FLAG = -nodefaultlibs -nostdlib -L$(LIBC_PATH) -lc_static.a

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
	#$(CC) -c $(SGX_CFLAGS) -I. -o $@ $< 
	gcc -c $(SGX_CFLAGS) -I. -o $@ $< 

#Weijie: start generate _start
lib/%.o: lib/%.s
	$(CC) -c -o $@ $<

ASM_OBJS = lib/stack.o lib/start.o

tools/linker: tools/linkage_editor.cpp
	$(CXX) -o $@ $^

#Weijie: add malloc. 
#Weijie: Here malloc.o should be compiled with gcc, otherwise bad things (related with nonnull) will happen.
malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC) -c $(SGX_CFLAGS) -o $@ $<

#Weijie: prepare whole static linked (with libc_static.a) obj
objs/libc_targetprogram.a: enclave_main.o malloc.o $(LIBC_PATH)
	cp $^ objs/
	$(MAKE) -C objs
	cp malloc.o objs/

#Weijie: don't use the following lines ...
#EXTRA_FLAGS2 = -Wl, -eenclave_main
#$(TARGET_NAME): $(TARGET_NAME).o
	#$(CC) -o $(TARGET_NAME) $< $(BASE_CFLAGS) $(EXTRA_FLAGS1) 

clean:
	rm -f *.o objs/*.o objs/*.lo $(TARGET_NAME)


