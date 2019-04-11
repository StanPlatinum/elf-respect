#ifndef ENCLAVE_U_H__
#define ENCLAVE_U_H__

#include <stdint.h>
#include <wchar.h>
#include <stddef.h>
#include <string.h>
#include "sgx_edger8r.h" /* for sgx_satus_t etc. */

#include "user_types.h"

#include <stdlib.h> /* for size_t */

#define SGX_CAST(type, item) ((type)(item))

#ifdef __cplusplus
extern "C" {
#endif

void SGX_UBRIDGE(SGX_NOCONVENTION, Ocall_PrintString, (const char* str));

sgx_status_t Ecall_SomeDataProcessing(sgx_enclave_id_t eid, char* buf, size_t len);
sgx_status_t Ecall_MaliciousDataProcessing(sgx_enclave_id_t eid, uint64_t p_inside);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
