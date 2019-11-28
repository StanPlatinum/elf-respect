#ifndef ENCLAVE_T_H__
#define ENCLAVE_T_H__

#include <stdint.h>
#include <wchar.h>
#include <stddef.h>
#include "sgx_edger8r.h" /* for sgx_ocall etc. */

#include "user_types.h"

#include <stdlib.h> /* for size_t */

#define SGX_CAST(type, item) ((type)(item))

#ifdef __cplusplus
extern "C" {
#endif

void test_function(const char* str);
int add(int x, int y);
void nothing(void);
void encl_AllocateMemory(size_t size);
void encl_AllocateMemory2(size_t size);
void encl_AllocateMemory3(size_t size);
void encl_AllocateMemory4(size_t size);
void encl_AllocateMemory5(size_t size);
void encl_FreeMemory(void);
void encl_FreeMemory2(void);
void encl_FreeMemory3(void);
void encl_FreeMemory4(void);
void encl_FreeMemory5(void);
void encl_LoadNumArrayWithRand(unsigned long int arraysize, unsigned int numarrays);
void encl_NumHeapSort(unsigned long int base_offset, unsigned long int bottom, unsigned long int top);
unsigned long int encl_LoadStringArray(unsigned int numarrays, unsigned long int arraysize);
void encl_call_StrHeapSort(unsigned long int nstrings, unsigned int numarrays, unsigned long int arraysize);
unsigned long int encl_bitSetup(long int bitfieldarraysize, long int bitoparraysize);
void encl_ToggleBitRun(unsigned long int bit_addr, unsigned long int nbits, unsigned int val);
void encl_FlipBitRun(long int bit_addr, long int nbits);
void encl_SetupCPUEmFloatArrays(unsigned long int arraysize);
void encl_DoEmFloatIteration(unsigned long int arraysize, unsigned long int loops);
void encl_DoFPUTransIteration(unsigned long int arraysize);
void encl_LoadAssignArrayWithRand(unsigned long int numarrays);
void encl_call_AssignmentTest(unsigned int numarrays);
void encl_app_loadIDEA(unsigned long int arraysize);
void encl_callIDEA(unsigned long int arraysize, unsigned short int* Z, unsigned short int* DK, unsigned long int nloops);
void encl_set_numpats(int npats);
double encl_get_in_pats(int patt, int element);
void encl_set_in_pats(int patt, int element, double val);
void encl_set_out_pats(int patt, int element, double val);
void encl_DoNNetIteration(unsigned long int nloops);
void encl_moveSeedArrays(unsigned long int numarrays);
void encl_call_lusolve(unsigned long int numarrays);
void encl_build_problem(void);
void encl_callHuffman(unsigned long int nloops, unsigned long int arraysize);
void encl_buildHuffman(unsigned long int arraysize);

sgx_status_t SGX_CDECL ocall_print_string(const char* str);
sgx_status_t SGX_CDECL sgx_oc_cpuidex(int cpuinfo[4], int leaf, int subleaf);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif
