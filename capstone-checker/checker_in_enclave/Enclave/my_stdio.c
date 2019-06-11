/* my_stdio.cpp */

#include "my_stdio.h"
#include <stdarg.h>
#include <string.h>

#define BUF_SIZE 1024

//int stdin = 0, stdout = 1, stderr = 2;

void fprintf(int file, const char* fmt, ...) {
    char buf[BUFSIZ] = {'\0'};
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(buf, BUFSIZ, fmt, ap);
    va_end(ap);
    size_t len = strlen(buf);
    write(file, buf, len);
}

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
