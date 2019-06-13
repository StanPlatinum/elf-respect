#ifndef ENCLAVE_T_H__
#define ENCLAVE_T_H__

#include <stdint.h>
#include <wchar.h>
#include <stddef.h>
#include "sgx_edger8r.h" /* for sgx_ocall etc. */

#include "user_types.h"
#include "libelf_extra_types.h"

#include <stdlib.h> /* for size_t */

#define SGX_CAST(type, item) ((type)(item))

#ifdef __cplusplus
extern "C" {
#endif

int Ecall_entry(char* filename);

sgx_status_t SGX_CDECL Ocall_PrintString(const char* str);
sgx_status_t SGX_CDECL ocall_open(int* retval, const char* filename, int mode);
sgx_status_t SGX_CDECL ocall_read(int* retval, int file, void* buf, unsigned int size);
sgx_status_t SGX_CDECL ocall_write(int* retval, int file, void* buf, unsigned int size);
sgx_status_t SGX_CDECL ocall_close(int file);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
