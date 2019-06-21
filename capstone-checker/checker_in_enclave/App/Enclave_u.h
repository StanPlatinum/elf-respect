#ifndef ENCLAVE_U_H__
#define ENCLAVE_U_H__

#include <stdint.h>
#include <wchar.h>
#include <stddef.h>
#include <string.h>
#include "sgx_edger8r.h" /* for sgx_satus_t etc. */

#include "user_types.h"
#include "libelf_extra_types.h"
#include "capstone_x86.h"

#include <stdlib.h> /* for size_t */

#define SGX_CAST(type, item) ((type)(item))

#ifdef __cplusplus
extern "C" {
#endif

#ifndef OCALL_PRINTSTRING_DEFINED__
#define OCALL_PRINTSTRING_DEFINED__
void SGX_UBRIDGE(SGX_NOCONVENTION, Ocall_PrintString, (const char* str));
#endif
#ifndef OCALL_OPEN_DEFINED__
#define OCALL_OPEN_DEFINED__
int SGX_UBRIDGE(SGX_NOCONVENTION, ocall_open, (const char* filename, int mode));
#endif
#ifndef OCALL_READ_DEFINED__
#define OCALL_READ_DEFINED__
int SGX_UBRIDGE(SGX_NOCONVENTION, ocall_read, (int file, void* buf, unsigned int size));
#endif
#ifndef OCALL_WRITE_DEFINED__
#define OCALL_WRITE_DEFINED__
int SGX_UBRIDGE(SGX_NOCONVENTION, ocall_write, (int file, void* buf, unsigned int size));
#endif
#ifndef OCALL_CLOSE_DEFINED__
#define OCALL_CLOSE_DEFINED__
void SGX_UBRIDGE(SGX_NOCONVENTION, ocall_close, (int file));
#endif

sgx_status_t Ecall_entry(sgx_enclave_id_t eid, int* retval);
sgx_status_t Ecall_cs_disasm(sgx_enclave_id_t eid, size_t* retval, size_t csh, cs_insn* insn);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
