CC = gcc
CXX = g++

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

LIBC_DIR = ./TrustedLib
LIBC_PATH = $(LIBC_DIR)/libc_static.a
LIBC_FLAG = -nodefaultlibs -nostdlib -L$(LIBC_PATH) -lc_static.a

SGX_CFLAGS = $(BASE_CFLAGS) -fno-stack-protector -fvisibility=hidden
#Weijie: later
#SGX_CFLAGS = $(BASE_CFLAGS) -I$(LIBC_DIR)/include -fno-stack-protector -fvisibility=hidden

#Weijie: generate target program.o
bm_hello.o: bm_hello.c enclave.h
	$(CC) -c $(SGX_CFLAGS) -I. -o $@ $(LINKERFLAG) $< 

#Weijie: start generate _start
lib/%.o: lib/%.s
	$(CC) -c -o $@ $<
ASM_OBJS = lib/stack.o lib/start.o
tools/linker: tools/linkage_editor.cpp
	$(CXX) -o $@ $(LINKERFLAG) $<

test_program: tools/linker $(ASM_OBJS)
	cp lib/*.o objs
	ls objs/*.o > list
	cat list | ./tools/linker test_program

#Weijie: don't use the following lines ...
#EXTRA_FLAGS1 = -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables
#EXTRA_FLAGS2 = -Wl, -eenclave_main
#bm_hello: bm_hello.o
	#$(CC) -o bm_hello $< $(BASE_CFLAGS) $(EXTRA_FLAGS1) 

clean:
	rm -f *.o objs/*.o bm_hello test_program
