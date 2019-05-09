#include "Enclave_t.h"

#include "sgx_trts.h" /* for sgx_ocalloc, sgx_is_outside_enclave */

#include <errno.h>
#include <string.h> /* for memcpy etc */
#include <stdlib.h> /* for malloc/free etc */

#define CHECK_REF_POINTER(ptr, siz) do {	\
	if (!(ptr) || ! sgx_is_outside_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)

#define CHECK_UNIQUE_POINTER(ptr, siz) do {	\
	if ((ptr) && ! sgx_is_outside_enclave((ptr), (siz)))	\
		return SGX_ERROR_INVALID_PARAMETER;\
} while (0)


typedef struct ms_Ecall_nw_t {
	char* ms_seq_1;
	char* ms_seq_2;
	char* ms_seq_1_al;
	char* ms_seq_2_al;
	bool ms_prm;
} ms_Ecall_nw_t;

typedef struct ms_Ocall_PrintString_t {
	char* ms_str;
} ms_Ocall_PrintString_t;

static sgx_status_t SGX_CDECL sgx_Ecall_nw(void* pms)
{
	ms_Ecall_nw_t* ms = SGX_CAST(ms_Ecall_nw_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	char* _tmp_seq_1 = ms->ms_seq_1;
	size_t _len_seq_1 = _tmp_seq_1 ? strlen(_tmp_seq_1) + 1 : 0;
	char* _in_seq_1 = NULL;
	char* _tmp_seq_2 = ms->ms_seq_2;
	size_t _len_seq_2 = _tmp_seq_2 ? strlen(_tmp_seq_2) + 1 : 0;
	char* _in_seq_2 = NULL;
	char* _tmp_seq_1_al = ms->ms_seq_1_al;
	size_t _len_seq_1_al = _tmp_seq_1_al ? strlen(_tmp_seq_1_al) + 1 : 0;
	char* _in_seq_1_al = NULL;
	char* _tmp_seq_2_al = ms->ms_seq_2_al;
	size_t _len_seq_2_al = _tmp_seq_2_al ? strlen(_tmp_seq_2_al) + 1 : 0;
	char* _in_seq_2_al = NULL;

	CHECK_REF_POINTER(pms, sizeof(ms_Ecall_nw_t));
	CHECK_UNIQUE_POINTER(_tmp_seq_1, _len_seq_1);
	CHECK_UNIQUE_POINTER(_tmp_seq_2, _len_seq_2);
	CHECK_UNIQUE_POINTER(_tmp_seq_1_al, _len_seq_1_al);
	CHECK_UNIQUE_POINTER(_tmp_seq_2_al, _len_seq_2_al);

	if (_tmp_seq_1 != NULL) {
		_in_seq_1 = (char*)malloc(_len_seq_1);
		if (_in_seq_1 == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy(_in_seq_1, _tmp_seq_1, _len_seq_1);
		_in_seq_1[_len_seq_1 - 1] = '\0';
	}
	if (_tmp_seq_2 != NULL) {
		_in_seq_2 = (char*)malloc(_len_seq_2);
		if (_in_seq_2 == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy(_in_seq_2, _tmp_seq_2, _len_seq_2);
		_in_seq_2[_len_seq_2 - 1] = '\0';
	}
	if (_tmp_seq_1_al != NULL) {
		_in_seq_1_al = (char*)malloc(_len_seq_1_al);
		if (_in_seq_1_al == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy(_in_seq_1_al, _tmp_seq_1_al, _len_seq_1_al);
		_in_seq_1_al[_len_seq_1_al - 1] = '\0';
	}
	if (_tmp_seq_2_al != NULL) {
		_in_seq_2_al = (char*)malloc(_len_seq_2_al);
		if (_in_seq_2_al == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memcpy(_in_seq_2_al, _tmp_seq_2_al, _len_seq_2_al);
		_in_seq_2_al[_len_seq_2_al - 1] = '\0';
	}
	Ecall_nw(_in_seq_1, _in_seq_2, _in_seq_1_al, _in_seq_2_al, ms->ms_prm);
err:
	if (_in_seq_1) free(_in_seq_1);
	if (_in_seq_2) free(_in_seq_2);
	if (_in_seq_1_al) {
		memcpy(_tmp_seq_1_al, _in_seq_1_al, _len_seq_1_al);
		free(_in_seq_1_al);
	}
	if (_in_seq_2_al) {
		memcpy(_tmp_seq_2_al, _in_seq_2_al, _len_seq_2_al);
		free(_in_seq_2_al);
	}

	return status;
}

SGX_EXTERNC const struct {
	size_t nr_ecall;
	struct {void* ecall_addr; uint8_t is_priv;} ecall_table[1];
} g_ecall_table = {
	1,
	{
		{(void*)(uintptr_t)sgx_Ecall_nw, 0},
	}
};

SGX_EXTERNC const struct {
	size_t nr_ocall;
	uint8_t entry_table[1][1];
} g_dyn_entry_table = {
	1,
	{
		{0, },
	}
};


sgx_status_t SGX_CDECL Ocall_PrintString(const char* str)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_str = str ? strlen(str) + 1 : 0;

	ms_Ocall_PrintString_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_Ocall_PrintString_t);
	void *__tmp = NULL;

	ocalloc_size += (str != NULL && sgx_is_within_enclave(str, _len_str)) ? _len_str : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_Ocall_PrintString_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_Ocall_PrintString_t));

	if (str != NULL && sgx_is_within_enclave(str, _len_str)) {
		ms->ms_str = (char*)__tmp;
		__tmp = (void *)((size_t)__tmp + _len_str);
		memcpy((void*)ms->ms_str, str, _len_str);
	} else if (str == NULL) {
		ms->ms_str = NULL;
	} else {
		sgx_ocfree();
		return SGX_ERROR_INVALID_PARAMETER;
	}
	
	status = sgx_ocall(0, ms);


	sgx_ocfree();
	return status;
}

