CC = clang

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

EXTRA_FLAGS = -fPIC -fno-asynchronous-unwind-tables -fno-jump-tables

LIBCDIR = ../Enclave/TrustedLib
LIBC = $(LIBCDIR)/libc_static.a

bm_hello.o: bm_hello.c enclave.h
	$(CC) -c $(BASE_CFLAGS) -o $@ $< $(EXTRA_FLAGS)

bm_hello: bm_hello.o
	$(CC) -o bm_hello $<

clean:
	rm -f *.o bm_hello
