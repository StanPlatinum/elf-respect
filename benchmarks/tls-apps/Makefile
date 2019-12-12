mbedtls_Path = ../mbedtls
mbedtls_Inc_Path = $(mbedtls_Path)/include
mbedtls_Lib_Path = $(mbedtls_Path)

mbedtls_Flag = -lmbedtls -lmbedcrypto -lmbedx509

hmac-test: hmac-test.c
	$(CC) $< -o $@ $(mbedtls_Flag) -L$(mbedtls_Lib_Path) -I$(mbedtls_Inc_Path)

clean:
	rm -f hmac-test
