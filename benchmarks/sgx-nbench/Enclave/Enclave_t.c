#include "Enclave_t.h"

#include "sgx_trts.h" /* for sgx_ocalloc, sgx_is_outside_enclave */
#include "sgx_lfence.h" /* for sgx_lfence */

#include <errno.h>
#include <mbusafecrt.h> /* for memcpy_s etc */
#include <stdlib.h> /* for malloc/free etc */

#define CHECK_REF_POINTER(ptr, siz) do {	\
	if (!(ptr) || ! sgx_is_outside_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)

#define CHECK_UNIQUE_POINTER(ptr, siz) do {	\
	if ((ptr) && ! sgx_is_outside_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)

#define CHECK_ENCLAVE_POINTER(ptr, siz) do {	\
	if ((ptr) && ! sgx_is_within_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)

#define ADD_ASSIGN_OVERFLOW(a, b) (	\
	((a) += (b)) < (b)	\
)


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

static sgx_status_t SGX_CDECL sgx_test_function(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_test_function_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_test_function_t* ms = SGX_CAST(ms_test_function_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	const char* _tmp_str = ms->ms_str;
	size_t _len_str = ms->ms_str_len ;
	char* _in_str = NULL;

	CHECK_UNIQUE_POINTER(_tmp_str, _len_str);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_str != NULL && _len_str != 0) {
		_in_str = (char*)malloc(_len_str);
		if (_in_str == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		if (memcpy_s(_in_str, _len_str, _tmp_str, _len_str)) {
			status = SGX_ERROR_UNEXPECTED;
			goto err;
		}

		_in_str[_len_str - 1] = '\0';
		if (_len_str != strlen(_in_str) + 1)
		{
			status = SGX_ERROR_UNEXPECTED;
			goto err;
		}
	}

	test_function((const char*)_in_str);

err:
	if (_in_str) free(_in_str);
	return status;
}

static sgx_status_t SGX_CDECL sgx_add(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_add_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_add_t* ms = SGX_CAST(ms_add_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	ms->ms_retval = add(ms->ms_x, ms->ms_y);


	return status;
}

static sgx_status_t SGX_CDECL sgx_nothing(void* pms)
{
	sgx_status_t status = SGX_SUCCESS;
	if (pms != NULL) return SGX_ERROR_INVALID_PARAMETER;
	nothing();
	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_AllocateMemory(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_AllocateMemory_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_AllocateMemory_t* ms = SGX_CAST(ms_encl_AllocateMemory_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_AllocateMemory(ms->ms_size);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_AllocateMemory2(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_AllocateMemory2_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_AllocateMemory2_t* ms = SGX_CAST(ms_encl_AllocateMemory2_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_AllocateMemory2(ms->ms_size);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_AllocateMemory3(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_AllocateMemory3_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_AllocateMemory3_t* ms = SGX_CAST(ms_encl_AllocateMemory3_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_AllocateMemory3(ms->ms_size);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_AllocateMemory4(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_AllocateMemory4_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_AllocateMemory4_t* ms = SGX_CAST(ms_encl_AllocateMemory4_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_AllocateMemory4(ms->ms_size);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_AllocateMemory5(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_AllocateMemory5_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_AllocateMemory5_t* ms = SGX_CAST(ms_encl_AllocateMemory5_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_AllocateMemory5(ms->ms_size);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_FreeMemory(void* pms)
{
	sgx_status_t status = SGX_SUCCESS;
	if (pms != NULL) return SGX_ERROR_INVALID_PARAMETER;
	encl_FreeMemory();
	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_FreeMemory2(void* pms)
{
	sgx_status_t status = SGX_SUCCESS;
	if (pms != NULL) return SGX_ERROR_INVALID_PARAMETER;
	encl_FreeMemory2();
	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_FreeMemory3(void* pms)
{
	sgx_status_t status = SGX_SUCCESS;
	if (pms != NULL) return SGX_ERROR_INVALID_PARAMETER;
	encl_FreeMemory3();
	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_FreeMemory4(void* pms)
{
	sgx_status_t status = SGX_SUCCESS;
	if (pms != NULL) return SGX_ERROR_INVALID_PARAMETER;
	encl_FreeMemory4();
	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_FreeMemory5(void* pms)
{
	sgx_status_t status = SGX_SUCCESS;
	if (pms != NULL) return SGX_ERROR_INVALID_PARAMETER;
	encl_FreeMemory5();
	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_LoadNumArrayWithRand(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_LoadNumArrayWithRand_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_LoadNumArrayWithRand_t* ms = SGX_CAST(ms_encl_LoadNumArrayWithRand_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_LoadNumArrayWithRand(ms->ms_arraysize, ms->ms_numarrays);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_NumHeapSort(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_NumHeapSort_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_NumHeapSort_t* ms = SGX_CAST(ms_encl_NumHeapSort_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_NumHeapSort(ms->ms_base_offset, ms->ms_bottom, ms->ms_top);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_LoadStringArray(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_LoadStringArray_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_LoadStringArray_t* ms = SGX_CAST(ms_encl_LoadStringArray_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	ms->ms_retval = encl_LoadStringArray(ms->ms_numarrays, ms->ms_arraysize);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_call_StrHeapSort(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_call_StrHeapSort_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_call_StrHeapSort_t* ms = SGX_CAST(ms_encl_call_StrHeapSort_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_call_StrHeapSort(ms->ms_nstrings, ms->ms_numarrays, ms->ms_arraysize);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_bitSetup(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_bitSetup_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_bitSetup_t* ms = SGX_CAST(ms_encl_bitSetup_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	ms->ms_retval = encl_bitSetup(ms->ms_bitfieldarraysize, ms->ms_bitoparraysize);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_ToggleBitRun(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_ToggleBitRun_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_ToggleBitRun_t* ms = SGX_CAST(ms_encl_ToggleBitRun_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_ToggleBitRun(ms->ms_bit_addr, ms->ms_nbits, ms->ms_val);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_FlipBitRun(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_FlipBitRun_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_FlipBitRun_t* ms = SGX_CAST(ms_encl_FlipBitRun_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_FlipBitRun(ms->ms_bit_addr, ms->ms_nbits);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_SetupCPUEmFloatArrays(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_SetupCPUEmFloatArrays_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_SetupCPUEmFloatArrays_t* ms = SGX_CAST(ms_encl_SetupCPUEmFloatArrays_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_SetupCPUEmFloatArrays(ms->ms_arraysize);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_DoEmFloatIteration(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_DoEmFloatIteration_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_DoEmFloatIteration_t* ms = SGX_CAST(ms_encl_DoEmFloatIteration_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_DoEmFloatIteration(ms->ms_arraysize, ms->ms_loops);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_DoFPUTransIteration(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_DoFPUTransIteration_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_DoFPUTransIteration_t* ms = SGX_CAST(ms_encl_DoFPUTransIteration_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_DoFPUTransIteration(ms->ms_arraysize);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_LoadAssignArrayWithRand(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_LoadAssignArrayWithRand_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_LoadAssignArrayWithRand_t* ms = SGX_CAST(ms_encl_LoadAssignArrayWithRand_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_LoadAssignArrayWithRand(ms->ms_numarrays);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_call_AssignmentTest(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_call_AssignmentTest_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_call_AssignmentTest_t* ms = SGX_CAST(ms_encl_call_AssignmentTest_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_call_AssignmentTest(ms->ms_numarrays);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_app_loadIDEA(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_app_loadIDEA_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_app_loadIDEA_t* ms = SGX_CAST(ms_encl_app_loadIDEA_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_app_loadIDEA(ms->ms_arraysize);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_callIDEA(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_callIDEA_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_callIDEA_t* ms = SGX_CAST(ms_encl_callIDEA_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	unsigned short int* _tmp_Z = ms->ms_Z;
	size_t _len_Z = 52 * sizeof(unsigned short int);
	unsigned short int* _in_Z = NULL;
	unsigned short int* _tmp_DK = ms->ms_DK;
	size_t _len_DK = 52 * sizeof(unsigned short int);
	unsigned short int* _in_DK = NULL;

	if (sizeof(*_tmp_Z) != 0 &&
		52 > (SIZE_MAX / sizeof(*_tmp_Z))) {
		return SGX_ERROR_INVALID_PARAMETER;
	}

	if (sizeof(*_tmp_DK) != 0 &&
		52 > (SIZE_MAX / sizeof(*_tmp_DK))) {
		return SGX_ERROR_INVALID_PARAMETER;
	}

	CHECK_UNIQUE_POINTER(_tmp_Z, _len_Z);
	CHECK_UNIQUE_POINTER(_tmp_DK, _len_DK);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_Z != NULL && _len_Z != 0) {
		if ( _len_Z % sizeof(*_tmp_Z) != 0)
		{
			status = SGX_ERROR_INVALID_PARAMETER;
			goto err;
		}
		_in_Z = (unsigned short int*)malloc(_len_Z);
		if (_in_Z == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		if (memcpy_s(_in_Z, _len_Z, _tmp_Z, _len_Z)) {
			status = SGX_ERROR_UNEXPECTED;
			goto err;
		}

	}
	if (_tmp_DK != NULL && _len_DK != 0) {
		if ( _len_DK % sizeof(*_tmp_DK) != 0)
		{
			status = SGX_ERROR_INVALID_PARAMETER;
			goto err;
		}
		_in_DK = (unsigned short int*)malloc(_len_DK);
		if (_in_DK == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		if (memcpy_s(_in_DK, _len_DK, _tmp_DK, _len_DK)) {
			status = SGX_ERROR_UNEXPECTED;
			goto err;
		}

	}

	encl_callIDEA(ms->ms_arraysize, _in_Z, _in_DK, ms->ms_nloops);

err:
	if (_in_Z) free(_in_Z);
	if (_in_DK) free(_in_DK);
	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_set_numpats(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_set_numpats_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_set_numpats_t* ms = SGX_CAST(ms_encl_set_numpats_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_set_numpats(ms->ms_npats);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_get_in_pats(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_get_in_pats_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_get_in_pats_t* ms = SGX_CAST(ms_encl_get_in_pats_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	ms->ms_retval = encl_get_in_pats(ms->ms_patt, ms->ms_element);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_set_in_pats(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_set_in_pats_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_set_in_pats_t* ms = SGX_CAST(ms_encl_set_in_pats_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_set_in_pats(ms->ms_patt, ms->ms_element, ms->ms_val);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_set_out_pats(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_set_out_pats_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_set_out_pats_t* ms = SGX_CAST(ms_encl_set_out_pats_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_set_out_pats(ms->ms_patt, ms->ms_element, ms->ms_val);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_DoNNetIteration(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_DoNNetIteration_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_DoNNetIteration_t* ms = SGX_CAST(ms_encl_DoNNetIteration_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_DoNNetIteration(ms->ms_nloops);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_moveSeedArrays(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_moveSeedArrays_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_moveSeedArrays_t* ms = SGX_CAST(ms_encl_moveSeedArrays_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_moveSeedArrays(ms->ms_numarrays);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_call_lusolve(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_call_lusolve_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_call_lusolve_t* ms = SGX_CAST(ms_encl_call_lusolve_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_call_lusolve(ms->ms_numarrays);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_build_problem(void* pms)
{
	sgx_status_t status = SGX_SUCCESS;
	if (pms != NULL) return SGX_ERROR_INVALID_PARAMETER;
	encl_build_problem();
	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_callHuffman(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_callHuffman_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_callHuffman_t* ms = SGX_CAST(ms_encl_callHuffman_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_callHuffman(ms->ms_nloops, ms->ms_arraysize);


	return status;
}

static sgx_status_t SGX_CDECL sgx_encl_buildHuffman(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_encl_buildHuffman_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_encl_buildHuffman_t* ms = SGX_CAST(ms_encl_buildHuffman_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	encl_buildHuffman(ms->ms_arraysize);


	return status;
}

SGX_EXTERNC const struct {
	size_t nr_ecall;
	struct {void* ecall_addr; uint8_t is_priv;} ecall_table[37];
} g_ecall_table = {
	37,
	{
		{(void*)(uintptr_t)sgx_test_function, 0},
		{(void*)(uintptr_t)sgx_add, 0},
		{(void*)(uintptr_t)sgx_nothing, 0},
		{(void*)(uintptr_t)sgx_encl_AllocateMemory, 0},
		{(void*)(uintptr_t)sgx_encl_AllocateMemory2, 0},
		{(void*)(uintptr_t)sgx_encl_AllocateMemory3, 0},
		{(void*)(uintptr_t)sgx_encl_AllocateMemory4, 0},
		{(void*)(uintptr_t)sgx_encl_AllocateMemory5, 0},
		{(void*)(uintptr_t)sgx_encl_FreeMemory, 0},
		{(void*)(uintptr_t)sgx_encl_FreeMemory2, 0},
		{(void*)(uintptr_t)sgx_encl_FreeMemory3, 0},
		{(void*)(uintptr_t)sgx_encl_FreeMemory4, 0},
		{(void*)(uintptr_t)sgx_encl_FreeMemory5, 0},
		{(void*)(uintptr_t)sgx_encl_LoadNumArrayWithRand, 0},
		{(void*)(uintptr_t)sgx_encl_NumHeapSort, 0},
		{(void*)(uintptr_t)sgx_encl_LoadStringArray, 0},
		{(void*)(uintptr_t)sgx_encl_call_StrHeapSort, 0},
		{(void*)(uintptr_t)sgx_encl_bitSetup, 0},
		{(void*)(uintptr_t)sgx_encl_ToggleBitRun, 0},
		{(void*)(uintptr_t)sgx_encl_FlipBitRun, 0},
		{(void*)(uintptr_t)sgx_encl_SetupCPUEmFloatArrays, 0},
		{(void*)(uintptr_t)sgx_encl_DoEmFloatIteration, 0},
		{(void*)(uintptr_t)sgx_encl_DoFPUTransIteration, 0},
		{(void*)(uintptr_t)sgx_encl_LoadAssignArrayWithRand, 0},
		{(void*)(uintptr_t)sgx_encl_call_AssignmentTest, 0},
		{(void*)(uintptr_t)sgx_encl_app_loadIDEA, 0},
		{(void*)(uintptr_t)sgx_encl_callIDEA, 0},
		{(void*)(uintptr_t)sgx_encl_set_numpats, 0},
		{(void*)(uintptr_t)sgx_encl_get_in_pats, 0},
		{(void*)(uintptr_t)sgx_encl_set_in_pats, 0},
		{(void*)(uintptr_t)sgx_encl_set_out_pats, 0},
		{(void*)(uintptr_t)sgx_encl_DoNNetIteration, 0},
		{(void*)(uintptr_t)sgx_encl_moveSeedArrays, 0},
		{(void*)(uintptr_t)sgx_encl_call_lusolve, 0},
		{(void*)(uintptr_t)sgx_encl_build_problem, 0},
		{(void*)(uintptr_t)sgx_encl_callHuffman, 0},
		{(void*)(uintptr_t)sgx_encl_buildHuffman, 0},
	}
};

SGX_EXTERNC const struct {
	size_t nr_ocall;
	uint8_t entry_table[2][37];
} g_dyn_entry_table = {
	2,
	{
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
	}
};


sgx_status_t SGX_CDECL ocall_print_string(const char* str)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_str = str ? strlen(str) + 1 : 0;

	ms_ocall_print_string_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_ocall_print_string_t);
	void *__tmp = NULL;


	CHECK_ENCLAVE_POINTER(str, _len_str);

	if (ADD_ASSIGN_OVERFLOW(ocalloc_size, (str != NULL) ? _len_str : 0))
		return SGX_ERROR_INVALID_PARAMETER;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_ocall_print_string_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_ocall_print_string_t));
	ocalloc_size -= sizeof(ms_ocall_print_string_t);

	if (str != NULL) {
		ms->ms_str = (const char*)__tmp;
		if (_len_str % sizeof(*str) != 0) {
			sgx_ocfree();
			return SGX_ERROR_INVALID_PARAMETER;
		}
		if (memcpy_s(__tmp, ocalloc_size, str, _len_str)) {
			sgx_ocfree();
			return SGX_ERROR_UNEXPECTED;
		}
		__tmp = (void *)((size_t)__tmp + _len_str);
		ocalloc_size -= _len_str;
	} else {
		ms->ms_str = NULL;
	}
	
	status = sgx_ocall(0, ms);

	if (status == SGX_SUCCESS) {
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL sgx_oc_cpuidex(int cpuinfo[4], int leaf, int subleaf)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_cpuinfo = 4 * sizeof(int);

	ms_sgx_oc_cpuidex_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_sgx_oc_cpuidex_t);
	void *__tmp = NULL;

	void *__tmp_cpuinfo = NULL;

	CHECK_ENCLAVE_POINTER(cpuinfo, _len_cpuinfo);

	if (ADD_ASSIGN_OVERFLOW(ocalloc_size, (cpuinfo != NULL) ? _len_cpuinfo : 0))
		return SGX_ERROR_INVALID_PARAMETER;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_sgx_oc_cpuidex_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_sgx_oc_cpuidex_t));
	ocalloc_size -= sizeof(ms_sgx_oc_cpuidex_t);

	if (cpuinfo != NULL) {
		ms->ms_cpuinfo = (int*)__tmp;
		__tmp_cpuinfo = __tmp;
		if (_len_cpuinfo % sizeof(*cpuinfo) != 0) {
			sgx_ocfree();
			return SGX_ERROR_INVALID_PARAMETER;
		}
		memset(__tmp_cpuinfo, 0, _len_cpuinfo);
		__tmp = (void *)((size_t)__tmp + _len_cpuinfo);
		ocalloc_size -= _len_cpuinfo;
	} else {
		ms->ms_cpuinfo = NULL;
	}
	
	ms->ms_leaf = leaf;
	ms->ms_subleaf = subleaf;
	status = sgx_ocall(1, ms);

	if (status == SGX_SUCCESS) {
		if (cpuinfo) {
			if (memcpy_s((void*)cpuinfo, _len_cpuinfo, __tmp_cpuinfo, _len_cpuinfo)) {
				sgx_ocfree();
				return SGX_ERROR_UNEXPECTED;
			}
		}
	}
	sgx_ocfree();
	return status;
}

