#Weijie: add makefile rules for objs

all: libc_targetprogram.a

libc_targetprogram.a: ./libc_static.a
	$(AR) -x ./libc_static.a
	$(AR) -rs libc_targetprogram.a *.o ../bm_hello.o

clean:
	rm -f *.o *.a

