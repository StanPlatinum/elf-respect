#include "Enclave_u.h"
#include <errno.h>

typedef struct ms_Ecall_entry_t {
	int ms_retval;
	char* ms_filename;
	size_t ms_filename_len;
} ms_Ecall_entry_t;

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

static sgx_status_t SGX_CDECL Enclave_Ocall_PrintString(void* pms)
{
	ms_Ocall_PrintString_t* ms = SGX_CAST(ms_Ocall_PrintString_t*, pms);
	Ocall_PrintString(ms->ms_str);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL Enclave_ocall_open(void* pms)
{
	ms_ocall_open_t* ms = SGX_CAST(ms_ocall_open_t*, pms);
	ms->ms_retval = ocall_open(ms->ms_filename, ms->ms_mode);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL Enclave_ocall_read(void* pms)
{
	ms_ocall_read_t* ms = SGX_CAST(ms_ocall_read_t*, pms);
	ms->ms_retval = ocall_read(ms->ms_file, ms->ms_buf, ms->ms_size);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL Enclave_ocall_write(void* pms)
{
	ms_ocall_write_t* ms = SGX_CAST(ms_ocall_write_t*, pms);
	ms->ms_retval = ocall_write(ms->ms_file, ms->ms_buf, ms->ms_size);

	return SGX_SUCCESS;
}

static sgx_status_t SGX_CDECL Enclave_ocall_close(void* pms)
{
	ms_ocall_close_t* ms = SGX_CAST(ms_ocall_close_t*, pms);
	ocall_close(ms->ms_file);

	return SGX_SUCCESS;
}

static const struct {
	size_t nr_ocall;
	void * table[5];
} ocall_table_Enclave = {
	5,
	{
		(void*)Enclave_Ocall_PrintString,
		(void*)Enclave_ocall_open,
		(void*)Enclave_ocall_read,
		(void*)Enclave_ocall_write,
		(void*)Enclave_ocall_close,
	}
};
sgx_status_t Ecall_entry(sgx_enclave_id_t eid, int* retval, char* filename)
{
	sgx_status_t status;
	ms_Ecall_entry_t ms;
	ms.ms_filename = filename;
	ms.ms_filename_len = filename ? strlen(filename) + 1 : 0;
	status = sgx_ecall(eid, 0, &ocall_table_Enclave, &ms);
	if (status == SGX_SUCCESS && retval) *retval = ms.ms_retval;
	return status;
}

