/* ocall.cpp
 * Assuming the code is compiled under windows
 */
#include "io.h"

int ocall_open(const char* filename, int mode) {
    return _open(filename, mode);
}

int ocall_read(int file, void *buf, unsigned int size) {
    return _read(file, buf, size);
}

int ocall_write(int file, void *buf, unsigned int size) {
    return _write(file, buf, size);
}

void ocall_close(int file) {
    _close(file);
}
