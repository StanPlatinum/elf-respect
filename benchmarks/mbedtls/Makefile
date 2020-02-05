LLVM_PATH = /home/weijliu/proofGen

LLVM_BIN_PATH = $(LLVM_PATH)/build/bin
CFIHello_So_PATH = $(LLVM_PATH)/build/lib/LLVMCFIHello.so

CC = /home/weijliu/llvm-mc/build/bin/clang -fPIC -fno-asynchronous-unwind-tables -fno-addrsig -mstackrealign
#CC = $(LLVM_PATH)/build/bin/clang -fno-asynchronous-unwind-tables -fno-addrsig -Xclang -load -Xclang $(CFIHello_So_PATH)

# Also see "include/mbedtls/config.h"

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11

NOLIBC_FLAG = -nodefaultlibs -nostdlib

CFLAGS = $(BASE_CFLAGS) -I../musl-libc/include \
		 -fno-stack-protector -fvisibility=hidden

LOCAL_CFLAGS = -Iinclude -I../ -D_FILE_OFFSET_BITS=64

OBJS_CRYPTO=	aes.o		aesni.o		arc4.o		\
		asn1parse.o	asn1write.o	base64.o	\
		bignum.o	blowfish.o	camellia.o	\
		ccm.o		cipher.o	cipher_wrap.o	\
		ctr_drbg.o	des.o		dhm.o		\
		ecdh.o		ecdsa.o		ecjpake.o	\
		ecp.o						\
		ecp_curves.o	entropy.o	entropy_poll.o	\
		error.o		gcm.o		havege.o	\
		hmac_drbg.o	md.o		md2.o		\
		md4.o		md5.o		md_wrap.o	\
		memory_buffer_alloc.o		oid.o		\
		padlock.o	pem.o		pk.o		\
		pk_wrap.o	pkcs12.o	pkcs5.o		\
		pkparse.o	pkwrite.o	platform.o	\
		ripemd160.o	rsa.o		sha1.o		\
		sha256.o	sha512.o	threading.o	\
		timing.o	version.o			\
		version_features.o		xtea.o

OBJS_X509=	certs.o		pkcs11.o	x509.o		\
		x509_create.o	x509_crl.o	x509_crt.o	\
		x509_csr.o	x509write_crt.o	x509write_csr.o

OBJS_TLS=	debug.o		net.o		ssl_cache.o	\
		ssl_ciphersuites.o		ssl_cli.o	\
		ssl_cookie.o	ssl_srv.o	ssl_ticket.o	\
		ssl_tls.o

.PHONY: all static clean

all: static
	cat *.txt > entryLabel4ssl
	sort entryLabel4ssl | uniq > entryLabel4ssl.txt
	rm entryLabel4ssl
	mv entryLabel4ssl.txt ..
	rm *.txt

mbedtls_Flag = -lmbedtls -lmbedcrypto -lmbedx509

LIBGCC = libgcc/ashldi3.o libgcc/ashrdi3.o libgcc/__divide_error.o  \
			 libgcc/__divdi3.o libgcc/__divti3.o libgcc/__lshrdi3.o     \
			 libgcc/multi3.o libgcc/__negti2.o libgcc/__udivdi3.o       \
			 libgcc/__udivmoddi4.o libgcc/__udivmodti4.o                \
			 libgcc/__udivti3.o libgcc/__umoddi3.o libgcc/__umodti3.o

CRT_LIBS = musl-libc/lib/crt1.o musl-libc/lib/crti.o musl-libc/lib/crtn.o

malloc.o: malloc/malloc.c malloc/dlmalloc.inc
	$(CC) -c $(LOCAL_CFLAGS) $(CFAGS) -o $@ $<

main: ssl_server_main.c static
	$(CC) $(LOCAL_CFLAGS) $(CFLAGS) $< -o $@ $(mbedtls_Flag) -L.

#ssl_server_main.o: ssl_server_main.c static
#	$(CC) -c $(LOCAL_CFLAGS) $(CFLAGS) $(NOLIBC_FLAG) $< -o $@ -lc -L. -L./musl-libc/lib

#main: ssl_server_main.o malloc.o $(LIBGCC) $(CRT_LIBS)
#	$(CC) $(LOCAL_CFLAGS) $(CFLAGS) $(NOLIBC_FLAG) $^ -o $@ $(mbedtls_Flag) -lc -L. -L./musl-libc/lib
		
static: libmbedcrypto.a libmbedx509.a libmbedtls.a

# tls
libmbedtls.a: $(OBJS_TLS)
	echo "  AR    $@"
	$(AR) -rc $@ $(OBJS_TLS)
	echo "  RL    $@"
	$(AR) -s $@

# x509
libmbedx509.a: $(OBJS_X509)
	echo "  AR    $@"
	$(AR) -rc $@ $(OBJS_X509)
	echo "  RL    $@"
	$(AR) -s $@

# crypto
libmbedcrypto.a: $(OBJS_CRYPTO)
	echo "  AR    $@"
	$(AR) -rc $@ $(OBJS_CRYPTO)
	echo "  RL    $@"
	$(AR) -s $@

%.o: %.c
	$(CC) $(LOCAL_CFLAGS) $(CFLAGS) -c $<
#	$(CC) -Xclang -load -Xclang $/your/llvm/path/build/lib/LLVMCFIHello.so $< -o $@

clean:
	rm -f main *.o libmbed*
