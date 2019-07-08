BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

LIBCDIR = ../Enclave/TrustedLib
LIBC = $(LIBCDIR)/libc_static.a

bm_hello.o: bm_hello.c enclave.h
	$(CC) -c $(BASE_CFLAGS) -o $@ $<

clean:
	rm -f *.o
