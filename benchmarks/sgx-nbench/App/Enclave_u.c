#include "Enclave_u.h"
#include <errno.h>

typedef struct ms_test_function_t {
	const char* ms_str;
	size_t ms_str_len;
} ms_test_function_t;

typedef struct ms_add_t {
	int ms_retval;
	int ms_x;
	int ms_y;
} ms_add_t;

typedef struct ms_encl_AllocateMemory_t {
	size_t ms_size;
} ms_encl_AllocateMemory_t;

typedef struct ms_encl_AllocateMemory2_t {
	size_t ms_size;
} ms_encl_AllocateMemory2_t;

typedef struct ms_encl_AllocateMemory3_t {
	size_t ms_size;
} ms_encl_AllocateMemory3_t;

typedef struct ms_encl_AllocateMemory4_t {
	size_t ms_size;
} ms_encl_AllocateMemory4_t;

typedef struct ms_encl_AllocateMemory5_t {
	size_t ms_size;
} ms_encl_AllocateMemory5_t;

typedef struct ms_encl_LoadNumArrayWithRand_t {
	unsigned long int ms_arraysize;
	unsigned int ms_numarrays;
} ms_encl_LoadNumArrayWithRand_t;

typedef struct ms_encl_NumHeapSort_t {
	unsigned long int ms_base_offset;
	unsigned long int ms_bottom;
	unsigned long int ms_top;
} ms_encl_NumHeapSort_t;

typedef struct ms_encl_LoadStringArray_t {
	unsigned long int ms_retval;
	unsigned int ms_numarrays;
	unsigned long int ms_arraysize;
} ms_encl_LoadStringArray_t;

typedef struct ms_encl_call_StrHeapSort_t {
	unsigned long int ms_nstrings;
	unsigned int ms_numarrays;
	unsigned long int ms_arraysize;
} ms_encl_call_StrHeapSort_t;

typedef struct ms_encl_bitSetup_t {
	unsigned long int ms_retval;
	long int ms_bitfieldarraysize;
	long int ms_bitoparraysize;
} ms_encl_bitSetup_t;

typedef struct ms_encl_ToggleBitRun_t {
	unsigned long int ms_bit_addr;
	unsigned long int ms_nbits;
	unsigned int ms_val;
} ms_encl_ToggleBitRun_t;

typedef struct ms_encl_FlipBitRun_t {
	long int ms_bit_addr;
	long int ms_nbits;
} ms_encl_FlipBitRun_t;

typedef struct ms_encl_SetupCPUEmFloatArrays_t {
	unsigned long int ms_arraysize;
} ms_encl_SetupCPUEmFloatArrays_t;

typedef struct ms_encl_DoEmFloatIteration_t {
	unsigned long int ms_arraysize;
	unsigned long int ms_loops;
} ms_encl_DoEmFloatIteration_t;

typedef struct ms_encl_DoFPUTransIteration_t {
	unsigned long int ms_arraysize;
} ms_encl_DoFPUTransIteration_t;

typedef struct ms_encl_LoadAssignArrayWithRand_t {
	unsigned long int ms_numarrays;
} ms_encl_LoadAssignArrayWithRand_t;

typedef struct ms_encl_call_AssignmentTest_t {
	unsigned int ms_numarrays;
} ms_encl_call_AssignmentTest_t;

typedef struct ms_encl_app_loadIDEA_t {
	unsigned long int ms_arraysize;
} ms_encl_app_loadIDEA_t;

typedef struct ms_encl_callIDEA_t {
	unsigned long int ms_arraysize;
	unsigned short int* ms_Z;
	unsigned short int* ms_DK;
	unsigned long int ms_nloops;
} ms_encl_callIDEA_t;

typedef struct ms_encl_set_numpats_t {
	int ms_npats;
} ms_encl_set_numpats_t;

typedef struct ms_encl_get_in_pats_t {
	double ms_retval;
	int ms_patt;
	int ms_element;
} ms_encl_get_in_pats_t;

typedef struct ms_encl_set_in_pats_t {
	int ms_patt;
	int ms_element;
	double ms_val;
} ms_encl_set_in_pats_t;

typedef struct ms_encl_set_out_pats_t {
	int ms_patt;
	int ms_element;
	double ms_val;
} ms_encl_set_out_pats_t;

typedef struct ms_encl_DoNNetIteration_t {
	unsigned long int ms_nloops;
} ms_encl_DoNNetIteration_t;

typedef struct ms_encl_moveSeedArrays_t {
	unsigned long int ms_numarrays;
} ms_encl_moveSeedArrays_t;

typedef struct ms_encl_call_lusolve_t {
	unsigned long int ms_numarrays;
} ms_encl_call_lusolve_t;

typedef struct ms_encl_callHuffman_t {
	unsigned long int ms_nloops;
	unsigned long int ms_arraysize;
} ms_encl_callHuffman_t;

typedef struct ms_encl_buildHuffman_t {
	unsigned long int ms_arraysize;
} ms_encl_buildHuffman_t;

typedef struct ms_ocall_print_string_t {
	const char* ms_str;
} ms_ocall_print_string_t;

typedef struct ms_sgx_oc_cpuidex_t {
	int* ms_cpuinfo;
	int ms_leaf;
	int ms_subleaf;
} ms_sgx_oc_cpuidex_t;

static sgx_status_t SGX_CDECL Enclave_ocall_print_string(void* pms)
{
	ms_ocall_print_string_t* ms = SGX_CAST(ms_ocall_print_string_t*, pms);
	ocall_print_string(ms->ms_str);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL Enclave_sgx_oc_cpuidex(void* pms)
{
	ms_sgx_oc_cpuidex_t* ms = SGX_CAST(ms_sgx_oc_cpuidex_t*, pms);
	sgx_oc_cpuidex(ms->ms_cpuinfo, ms->ms_leaf, ms->ms_subleaf);

	return SGX_SUCCESS;
}

static const struct {
	size_t nr_ocall;
	void * table[2];
} ocall_table_Enclave = {
	2,
	{
		(void*)Enclave_ocall_print_string,
		(void*)Enclave_sgx_oc_cpuidex,
	}
};
sgx_status_t test_function(sgx_enclave_id_t eid, const char* str)
{
	sgx_status_t status;
	ms_test_function_t ms;
	ms.ms_str = str;
	ms.ms_str_len = str ? strlen(str) + 1 : 0;
	status = sgx_ecall(eid, 0, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t add(sgx_enclave_id_t eid, int* retval, int x, int y)
{
	sgx_status_t status;
	ms_add_t ms;
	ms.ms_x = x;
	ms.ms_y = y;
	status = sgx_ecall(eid, 1, &ocall_table_Enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t nothing(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 2, &ocall_table_Enclave, NULL);
	return status;
}

sgx_status_t encl_AllocateMemory(sgx_enclave_id_t eid, size_t size)
{
	sgx_status_t status;
	ms_encl_AllocateMemory_t ms;
	ms.ms_size = size;
	status = sgx_ecall(eid, 3, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_AllocateMemory2(sgx_enclave_id_t eid, size_t size)
{
	sgx_status_t status;
	ms_encl_AllocateMemory2_t ms;
	ms.ms_size = size;
	status = sgx_ecall(eid, 4, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_AllocateMemory3(sgx_enclave_id_t eid, size_t size)
{
	sgx_status_t status;
	ms_encl_AllocateMemory3_t ms;
	ms.ms_size = size;
	status = sgx_ecall(eid, 5, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_AllocateMemory4(sgx_enclave_id_t eid, size_t size)
{
	sgx_status_t status;
	ms_encl_AllocateMemory4_t ms;
	ms.ms_size = size;
	status = sgx_ecall(eid, 6, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_AllocateMemory5(sgx_enclave_id_t eid, size_t size)
{
	sgx_status_t status;
	ms_encl_AllocateMemory5_t ms;
	ms.ms_size = size;
	status = sgx_ecall(eid, 7, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_FreeMemory(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 8, &ocall_table_Enclave, NULL);
	return status;
}

sgx_status_t encl_FreeMemory2(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 9, &ocall_table_Enclave, NULL);
	return status;
}

sgx_status_t encl_FreeMemory3(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 10, &ocall_table_Enclave, NULL);
	return status;
}

sgx_status_t encl_FreeMemory4(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 11, &ocall_table_Enclave, NULL);
	return status;
}

sgx_status_t encl_FreeMemory5(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 12, &ocall_table_Enclave, NULL);
	return status;
}

sgx_status_t encl_LoadNumArrayWithRand(sgx_enclave_id_t eid, unsigned long int arraysize, unsigned int numarrays)
{
	sgx_status_t status;
	ms_encl_LoadNumArrayWithRand_t ms;
	ms.ms_arraysize = arraysize;
	ms.ms_numarrays = numarrays;
	status = sgx_ecall(eid, 13, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_NumHeapSort(sgx_enclave_id_t eid, unsigned long int base_offset, unsigned long int bottom, unsigned long int top)
{
	sgx_status_t status;
	ms_encl_NumHeapSort_t ms;
	ms.ms_base_offset = base_offset;
	ms.ms_bottom = bottom;
	ms.ms_top = top;
	status = sgx_ecall(eid, 14, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_LoadStringArray(sgx_enclave_id_t eid, unsigned long int* retval, unsigned int numarrays, unsigned long int arraysize)
{
	sgx_status_t status;
	ms_encl_LoadStringArray_t ms;
	ms.ms_numarrays = numarrays;
	ms.ms_arraysize = arraysize;
	status = sgx_ecall(eid, 15, &ocall_table_Enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t encl_call_StrHeapSort(sgx_enclave_id_t eid, unsigned long int nstrings, unsigned int numarrays, unsigned long int arraysize)
{
	sgx_status_t status;
	ms_encl_call_StrHeapSort_t ms;
	ms.ms_nstrings = nstrings;
	ms.ms_numarrays = numarrays;
	ms.ms_arraysize = arraysize;
	status = sgx_ecall(eid, 16, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_bitSetup(sgx_enclave_id_t eid, unsigned long int* retval, long int bitfieldarraysize, long int bitoparraysize)
{
	sgx_status_t status;
	ms_encl_bitSetup_t ms;
	ms.ms_bitfieldarraysize = bitfieldarraysize;
	ms.ms_bitoparraysize = bitoparraysize;
	status = sgx_ecall(eid, 17, &ocall_table_Enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t encl_ToggleBitRun(sgx_enclave_id_t eid, unsigned long int bit_addr, unsigned long int nbits, unsigned int val)
{
	sgx_status_t status;
	ms_encl_ToggleBitRun_t ms;
	ms.ms_bit_addr = bit_addr;
	ms.ms_nbits = nbits;
	ms.ms_val = val;
	status = sgx_ecall(eid, 18, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_FlipBitRun(sgx_enclave_id_t eid, long int bit_addr, long int nbits)
{
	sgx_status_t status;
	ms_encl_FlipBitRun_t ms;
	ms.ms_bit_addr = bit_addr;
	ms.ms_nbits = nbits;
	status = sgx_ecall(eid, 19, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_SetupCPUEmFloatArrays(sgx_enclave_id_t eid, unsigned long int arraysize)
{
	sgx_status_t status;
	ms_encl_SetupCPUEmFloatArrays_t ms;
	ms.ms_arraysize = arraysize;
	status = sgx_ecall(eid, 20, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_DoEmFloatIteration(sgx_enclave_id_t eid, unsigned long int arraysize, unsigned long int loops)
{
	sgx_status_t status;
	ms_encl_DoEmFloatIteration_t ms;
	ms.ms_arraysize = arraysize;
	ms.ms_loops = loops;
	status = sgx_ecall(eid, 21, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_DoFPUTransIteration(sgx_enclave_id_t eid, unsigned long int arraysize)
{
	sgx_status_t status;
	ms_encl_DoFPUTransIteration_t ms;
	ms.ms_arraysize = arraysize;
	status = sgx_ecall(eid, 22, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_LoadAssignArrayWithRand(sgx_enclave_id_t eid, unsigned long int numarrays)
{
	sgx_status_t status;
	ms_encl_LoadAssignArrayWithRand_t ms;
	ms.ms_numarrays = numarrays;
	status = sgx_ecall(eid, 23, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_call_AssignmentTest(sgx_enclave_id_t eid, unsigned int numarrays)
{
	sgx_status_t status;
	ms_encl_call_AssignmentTest_t ms;
	ms.ms_numarrays = numarrays;
	status = sgx_ecall(eid, 24, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_app_loadIDEA(sgx_enclave_id_t eid, unsigned long int arraysize)
{
	sgx_status_t status;
	ms_encl_app_loadIDEA_t ms;
	ms.ms_arraysize = arraysize;
	status = sgx_ecall(eid, 25, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_callIDEA(sgx_enclave_id_t eid, unsigned long int arraysize, unsigned short int* Z, unsigned short int* DK, unsigned long int nloops)
{
	sgx_status_t status;
	ms_encl_callIDEA_t ms;
	ms.ms_arraysize = arraysize;
	ms.ms_Z = Z;
	ms.ms_DK = DK;
	ms.ms_nloops = nloops;
	status = sgx_ecall(eid, 26, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_set_numpats(sgx_enclave_id_t eid, int npats)
{
	sgx_status_t status;
	ms_encl_set_numpats_t ms;
	ms.ms_npats = npats;
	status = sgx_ecall(eid, 27, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_get_in_pats(sgx_enclave_id_t eid, double* retval, int patt, int element)
{
	sgx_status_t status;
	ms_encl_get_in_pats_t ms;
	ms.ms_patt = patt;
	ms.ms_element = element;
	status = sgx_ecall(eid, 28, &ocall_table_Enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

sgx_status_t encl_set_in_pats(sgx_enclave_id_t eid, int patt, int element, double val)
{
	sgx_status_t status;
	ms_encl_set_in_pats_t ms;
	ms.ms_patt = patt;
	ms.ms_element = element;
	ms.ms_val = val;
	status = sgx_ecall(eid, 29, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_set_out_pats(sgx_enclave_id_t eid, int patt, int element, double val)
{
	sgx_status_t status;
	ms_encl_set_out_pats_t ms;
	ms.ms_patt = patt;
	ms.ms_element = element;
	ms.ms_val = val;
	status = sgx_ecall(eid, 30, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_DoNNetIteration(sgx_enclave_id_t eid, unsigned long int nloops)
{
	sgx_status_t status;
	ms_encl_DoNNetIteration_t ms;
	ms.ms_nloops = nloops;
	status = sgx_ecall(eid, 31, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_moveSeedArrays(sgx_enclave_id_t eid, unsigned long int numarrays)
{
	sgx_status_t status;
	ms_encl_moveSeedArrays_t ms;
	ms.ms_numarrays = numarrays;
	status = sgx_ecall(eid, 32, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_call_lusolve(sgx_enclave_id_t eid, unsigned long int numarrays)
{
	sgx_status_t status;
	ms_encl_call_lusolve_t ms;
	ms.ms_numarrays = numarrays;
	status = sgx_ecall(eid, 33, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_build_problem(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 34, &ocall_table_Enclave, NULL);
	return status;
}

sgx_status_t encl_callHuffman(sgx_enclave_id_t eid, unsigned long int nloops, unsigned long int arraysize)
{
	sgx_status_t status;
	ms_encl_callHuffman_t ms;
	ms.ms_nloops = nloops;
	ms.ms_arraysize = arraysize;
	status = sgx_ecall(eid, 35, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t encl_buildHuffman(sgx_enclave_id_t eid, unsigned long int arraysize)
{
	sgx_status_t status;
	ms_encl_buildHuffman_t ms;
	ms.ms_arraysize = arraysize;
	status = sgx_ecall(eid, 36, &ocall_table_Enclave, &ms);
	return status;
}

