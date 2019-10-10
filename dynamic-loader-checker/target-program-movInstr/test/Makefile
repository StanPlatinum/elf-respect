CC = /usr/bin/clang-3.8

TARGET_NAME = test

all: enclave_main.o

$(TARGET_NAME).bc: $(TARGET_NAME).c enclave.h
	$(CC) -fPIC -emit-llvm $< -c -o $@
	#$(CC) -fPIC -fno-asynchronous-unwind-tables -emit-llvm $< -c -o $@

$(TARGET_NAME).s: $(TARGET_NAME).bc
	llc $<

$(TARGET_NAME)_new.s: $(TARGET_NAME).s
	python code_asm.py $< > $@

enclave_main.o: $(TARGET_NAME)_new.s
	$(CC) -c $< -o $@

clean:
	rm -f *.o *.s *.bc
