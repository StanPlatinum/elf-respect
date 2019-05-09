#ifndef ENCLAVE_U_H__
#define ENCLAVE_U_H__

#include <stdint.h>
#include <wchar.h>
#include <stddef.h>
#include <string.h>
#include "sgx_edger8r.h" /* for sgx_satus_t etc. */

#include "user_types.h"
#include "stdbool.h"

#include <stdlib.h> /* for size_t */

#define SGX_CAST(type, item) ((type)(item))

#ifdef __cplusplus
extern "C" {
#endif

void SGX_UBRIDGE(SGX_NOCONVENTION, Ocall_PrintString, (const char* str));

sgx_status_t Ecall_nw(sgx_enclave_id_t eid, char* seq_1, char* seq_2, char* seq_1_al, char* seq_2_al, bool prm);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
