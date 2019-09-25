TARGET_NAME = test

all: $(TARGET_NAME).s

$(TARGET_NAME).bc: $(TARGET_NAME).c enclave.h
	clang -fPIC -fno-asynchronous-unwind-tables -emit-llvm $< -c -o $@

$(TARGET_NAME).s: $(TARGET_NAME).bc
	llc $<
