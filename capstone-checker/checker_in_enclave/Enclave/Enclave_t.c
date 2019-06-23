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


typedef struct ms_Ecall_entry_t {
	int ms_retval;
} ms_Ecall_entry_t;

typedef struct ms_Ecall_cs_disasm_t {
	size_t ms_retval;
	size_t ms_csh;
	cs_insn* ms_insn;
} ms_Ecall_cs_disasm_t;

typedef struct ms_Ocall_PrintString_t {
	const char* ms_str;
} ms_Ocall_PrintString_t;

typedef struct ms_ocall_open_t {
	int ms_retval;
	const char* ms_filename;
	int ms_mode;
} ms_ocall_open_t;

typedef struct ms_ocall_read_t {
	int ms_retval;
	int ms_file;
	void* ms_buf;
	unsigned int ms_size;
} ms_ocall_read_t;

typedef struct ms_ocall_write_t {
	int ms_retval;
	int ms_file;
	void* ms_buf;
	unsigned int ms_size;
} ms_ocall_write_t;

typedef struct ms_ocall_close_t {
	int ms_file;
} ms_ocall_close_t;

static sgx_status_t SGX_CDECL sgx_Ecall_entry(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_Ecall_entry_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_Ecall_entry_t* ms = SGX_CAST(ms_Ecall_entry_t*, pms);
	sgx_status_t status = SGX_SUCCESS;



	ms->ms_retval = Ecall_entry();


	return status;
}

static sgx_status_t SGX_CDECL sgx_Ecall_cs_disasm(void* pms)
{
	CHECK_REF_POINTER(pms, sizeof(ms_Ecall_cs_disasm_t));
	//
	// fence after pointer checks
	//
	sgx_lfence();
	ms_Ecall_cs_disasm_t* ms = SGX_CAST(ms_Ecall_cs_disasm_t*, pms);
	sgx_status_t status = SGX_SUCCESS;
	cs_insn* _tmp_insn = ms->ms_insn;
	size_t _len_insn = 1 * sizeof(cs_insn);
	cs_insn* _in_insn = NULL;

	CHECK_UNIQUE_POINTER(_tmp_insn, _len_insn);

	//
	// fence after pointer checks
	//
	sgx_lfence();

	if (_tmp_insn != NULL && _len_insn != 0) {
		if ((_in_insn = (cs_insn*)malloc(_len_insn)) == NULL) {
			status = SGX_ERROR_OUT_OF_MEMORY;
			goto err;
		}

		memset((void*)_in_insn, 0, _len_insn);
	}

	ms->ms_retval = Ecall_cs_disasm(ms->ms_csh, _in_insn);
err:
	if (_in_insn) {
		if (memcpy_s(_tmp_insn, _len_insn, _in_insn, _len_insn)) {
			status = SGX_ERROR_UNEXPECTED;
		}
		free(_in_insn);
	}

	return status;
}

SGX_EXTERNC const struct {
	size_t nr_ecall;
	struct {void* ecall_addr; uint8_t is_priv;} ecall_table[2];
} g_ecall_table = {
	2,
	{
		{(void*)(uintptr_t)sgx_Ecall_entry, 0},
		{(void*)(uintptr_t)sgx_Ecall_cs_disasm, 0},
	}
};

SGX_EXTERNC const struct {
	size_t nr_ocall;
	uint8_t entry_table[5][2];
} g_dyn_entry_table = {
	5,
	{
		{0, 0, },
		{0, 0, },
		{0, 0, },
		{0, 0, },
		{0, 0, },
	}
};


sgx_status_t SGX_CDECL Ocall_PrintString(const char* str)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_str = str ? strlen(str) + 1 : 0;

	ms_Ocall_PrintString_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_Ocall_PrintString_t);
	void *__tmp = NULL;


	CHECK_ENCLAVE_POINTER(str, _len_str);

	ocalloc_size += (str != NULL) ? _len_str : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_Ocall_PrintString_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_Ocall_PrintString_t));
	ocalloc_size -= sizeof(ms_Ocall_PrintString_t);

	if (str != NULL) {
		ms->ms_str = (const char*)__tmp;
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

sgx_status_t SGX_CDECL ocall_open(int* retval, const char* filename, int mode)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_filename = filename ? strlen(filename) + 1 : 0;

	ms_ocall_open_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_ocall_open_t);
	void *__tmp = NULL;


	CHECK_ENCLAVE_POINTER(filename, _len_filename);

	ocalloc_size += (filename != NULL) ? _len_filename : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_ocall_open_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_ocall_open_t));
	ocalloc_size -= sizeof(ms_ocall_open_t);

	if (filename != NULL) {
		ms->ms_filename = (const char*)__tmp;
		if (memcpy_s(__tmp, ocalloc_size, filename, _len_filename)) {
			sgx_ocfree();
			return SGX_ERROR_UNEXPECTED;
		}
		__tmp = (void *)((size_t)__tmp + _len_filename);
		ocalloc_size -= _len_filename;
	} else {
		ms->ms_filename = NULL;
	}
	
	ms->ms_mode = mode;
	status = sgx_ocall(1, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL ocall_read(int* retval, int file, void* buf, unsigned int size)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_buf = size;

	ms_ocall_read_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_ocall_read_t);
	void *__tmp = NULL;

	void *__tmp_buf = NULL;

	CHECK_ENCLAVE_POINTER(buf, _len_buf);

	ocalloc_size += (buf != NULL) ? _len_buf : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_ocall_read_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_ocall_read_t));
	ocalloc_size -= sizeof(ms_ocall_read_t);

	ms->ms_file = file;
	if (buf != NULL) {
		ms->ms_buf = (void*)__tmp;
		__tmp_buf = __tmp;
		memset(__tmp_buf, 0, _len_buf);
		__tmp = (void *)((size_t)__tmp + _len_buf);
		ocalloc_size -= _len_buf;
	} else {
		ms->ms_buf = NULL;
	}
	
	ms->ms_size = size;
	status = sgx_ocall(2, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
		if (buf) {
			if (memcpy_s((void*)buf, _len_buf, __tmp_buf, _len_buf)) {
				sgx_ocfree();
				return SGX_ERROR_UNEXPECTED;
			}
		}
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL ocall_write(int* retval, int file, void* buf, unsigned int size)
{
	sgx_status_t status = SGX_SUCCESS;
	size_t _len_buf = size;

	ms_ocall_write_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_ocall_write_t);
	void *__tmp = NULL;


	CHECK_ENCLAVE_POINTER(buf, _len_buf);

	ocalloc_size += (buf != NULL) ? _len_buf : 0;

	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_ocall_write_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_ocall_write_t));
	ocalloc_size -= sizeof(ms_ocall_write_t);

	ms->ms_file = file;
	if (buf != NULL) {
		ms->ms_buf = (void*)__tmp;
		if (memcpy_s(__tmp, ocalloc_size, buf, _len_buf)) {
			sgx_ocfree();
			return SGX_ERROR_UNEXPECTED;
		}
		__tmp = (void *)((size_t)__tmp + _len_buf);
		ocalloc_size -= _len_buf;
	} else {
		ms->ms_buf = NULL;
	}
	
	ms->ms_size = size;
	status = sgx_ocall(3, ms);

	if (status == SGX_SUCCESS) {
		if (retval) *retval = ms->ms_retval;
	}
	sgx_ocfree();
	return status;
}

sgx_status_t SGX_CDECL ocall_close(int file)
{
	sgx_status_t status = SGX_SUCCESS;

	ms_ocall_close_t* ms = NULL;
	size_t ocalloc_size = sizeof(ms_ocall_close_t);
	void *__tmp = NULL;


	__tmp = sgx_ocalloc(ocalloc_size);
	if (__tmp == NULL) {
		sgx_ocfree();
		return SGX_ERROR_UNEXPECTED;
	}
	ms = (ms_ocall_close_t*)__tmp;
	__tmp = (void *)((size_t)__tmp + sizeof(ms_ocall_close_t));
	ocalloc_size -= sizeof(ms_ocall_close_t);

	ms->ms_file = file;
	status = sgx_ocall(4, ms);

	if (status == SGX_SUCCESS) {
	}
	sgx_ocfree();
	return status;
}

