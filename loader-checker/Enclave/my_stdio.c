/* my_stdio.c */

#include "my_stdio.h"
#include <stdarg.h>
#include <string.h>

#define BUF_SIZE 1024

int open(const char* filename, int mode) {
    int ret;
    if (ocall_open(&ret, filename, mode) != SGX_SUCCESS) return -1;
    return ret;
}

int read(int file, void *buf, unsigned int size) {
    int ret;
    if (ocall_read(&ret, file, buf, size) != SGX_SUCCESS) return -1;
    return ret;
}

int write(int file, void *buf, unsigned int size) {
    int ret;
    if (ocall_write(&ret, file, buf, size) != SGX_SUCCESS) return -1;
    return ret;
}

void close(int file) {
    ocall_close(file);
}
