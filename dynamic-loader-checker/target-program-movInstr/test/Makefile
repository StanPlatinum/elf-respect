TARGET_NAME = test

all: $(TARGET_NAME)_new.s

$(TARGET_NAME).bc: $(TARGET_NAME).c enclave.h
	clang -fPIC -fno-asynchronous-unwind-tables -emit-llvm $< -c -o $@

$(TARGET_NAME).s: $(TARGET_NAME).bc
	llc $<

$(TARGET_NAME)_new.s: $(TARGET_NAME).s
	python code_asm.py $< > $@

clean:
	rm -f *.o *.s *.bc
