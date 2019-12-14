LLVM_PATH = /home/weijliu/proofGen
CFIHello_So_PATH = $(LLVM_PATH)/build/lib/LLVMCFIHello.so
CC = $(LLVM_PATH)/build/bin/clang -fno-asynchronous-unwind-tables -fno-addrsig -Xclang -load -Xclang $(CFIHello_So_PATH)


# need to compile without ssl_server.c!


mbedtls_Path = ../mbedtls
mbedtls_Inc_Path = $(mbedtls_Path)/include
mbedtls_Lib_Path = $(mbedtls_Path)

mbedtls_Flag = -lmbedtls -lmbedcrypto -lmbedx509

hmac-test: hmac-test.c
	$(CC) $< -o $@ $(mbedtls_Flag) -L$(mbedtls_Lib_Path) -I$(mbedtls_Inc_Path)

clean:
	rm -f hmac-test
