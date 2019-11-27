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

#ifndef OCALL_PRINT_STRING_DEFINED__
#define OCALL_PRINT_STRING_DEFINED__
void SGX_UBRIDGE(SGX_NOCONVENTION, ocall_print_string, (const char* str));
#endif
#ifndef SGX_OC_CPUIDEX_DEFINED__
#define SGX_OC_CPUIDEX_DEFINED__
void SGX_UBRIDGE(SGX_CDECL, sgx_oc_cpuidex, (int cpuinfo[4], int leaf, int subleaf));
#endif

sgx_status_t test_function(sgx_enclave_id_t eid, const char* str);
sgx_status_t add(sgx_enclave_id_t eid, int* retval, int x, int y);
sgx_status_t nothing(sgx_enclave_id_t eid);
sgx_status_t encl_AllocateMemory(sgx_enclave_id_t eid, size_t size);
sgx_status_t encl_AllocateMemory2(sgx_enclave_id_t eid, size_t size);
sgx_status_t encl_AllocateMemory3(sgx_enclave_id_t eid, size_t size);
sgx_status_t encl_AllocateMemory4(sgx_enclave_id_t eid, size_t size);
sgx_status_t encl_AllocateMemory5(sgx_enclave_id_t eid, size_t size);
sgx_status_t encl_FreeMemory(sgx_enclave_id_t eid);
sgx_status_t encl_FreeMemory2(sgx_enclave_id_t eid);
sgx_status_t encl_FreeMemory3(sgx_enclave_id_t eid);
sgx_status_t encl_FreeMemory4(sgx_enclave_id_t eid);
sgx_status_t encl_FreeMemory5(sgx_enclave_id_t eid);
sgx_status_t encl_LoadNumArrayWithRand(sgx_enclave_id_t eid, unsigned long int arraysize, unsigned int numarrays);
sgx_status_t encl_NumHeapSort(sgx_enclave_id_t eid, unsigned long int base_offset, unsigned long int bottom, unsigned long int top);
sgx_status_t encl_LoadStringArray(sgx_enclave_id_t eid, unsigned long int* retval, unsigned int numarrays, unsigned long int arraysize);
sgx_status_t encl_call_StrHeapSort(sgx_enclave_id_t eid, unsigned long int nstrings, unsigned int numarrays, unsigned long int arraysize);
sgx_status_t encl_bitSetup(sgx_enclave_id_t eid, unsigned long int* retval, long int bitfieldarraysize, long int bitoparraysize);
sgx_status_t encl_ToggleBitRun(sgx_enclave_id_t eid, unsigned long int bit_addr, unsigned long int nbits, unsigned int val);
sgx_status_t encl_FlipBitRun(sgx_enclave_id_t eid, long int bit_addr, long int nbits);
sgx_status_t encl_SetupCPUEmFloatArrays(sgx_enclave_id_t eid, unsigned long int arraysize);
sgx_status_t encl_DoEmFloatIteration(sgx_enclave_id_t eid, unsigned long int arraysize, unsigned long int loops);
sgx_status_t encl_DoFPUTransIteration(sgx_enclave_id_t eid, unsigned long int arraysize);
sgx_status_t encl_LoadAssignArrayWithRand(sgx_enclave_id_t eid, unsigned long int numarrays);
sgx_status_t encl_call_AssignmentTest(sgx_enclave_id_t eid, unsigned int numarrays);
sgx_status_t encl_app_loadIDEA(sgx_enclave_id_t eid, unsigned long int arraysize);
sgx_status_t encl_callIDEA(sgx_enclave_id_t eid, unsigned long int arraysize, unsigned short int* Z, unsigned short int* DK, unsigned long int nloops);
sgx_status_t encl_set_numpats(sgx_enclave_id_t eid, int npats);
sgx_status_t encl_get_in_pats(sgx_enclave_id_t eid, double* retval, int patt, int element);
sgx_status_t encl_set_in_pats(sgx_enclave_id_t eid, int patt, int element, double val);
sgx_status_t encl_set_out_pats(sgx_enclave_id_t eid, int patt, int element, double val);
sgx_status_t encl_DoNNetIteration(sgx_enclave_id_t eid, unsigned long int nloops);
sgx_status_t encl_moveSeedArrays(sgx_enclave_id_t eid, unsigned long int numarrays);
sgx_status_t encl_call_lusolve(sgx_enclave_id_t eid, unsigned long int numarrays);
sgx_status_t encl_build_problem(sgx_enclave_id_t eid);
sgx_status_t encl_callHuffman(sgx_enclave_id_t eid, unsigned long int nloops, unsigned long int arraysize);
sgx_status_t encl_buildHuffman(sgx_enclave_id_t eid, unsigned long int arraysize);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
