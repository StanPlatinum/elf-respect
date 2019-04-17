#include "Enclave_u.h"
#include <errno.h>

typedef struct ms_Ecall_SomeDataProcessing_t {
	char* ms_buf;
	size_t ms_len;
} ms_Ecall_SomeDataProcessing_t;

typedef struct ms_Ecall_MaliciousDataProcessing_t {
	uint64_t ms_p_inside;
} ms_Ecall_MaliciousDataProcessing_t;

typedef struct ms_Ocall_PrintString_t {
	const char* ms_str;
} ms_Ocall_PrintString_t;

static sgx_status_t SGX_CDECL Enclave_Ocall_PrintString(void* pms)
{
	ms_Ocall_PrintString_t* ms = SGX_CAST(ms_Ocall_PrintString_t*, pms);
	Ocall_PrintString(ms->ms_str);

	return SGX_SUCCESS;
}

static const struct {
	size_t nr_ocall;
	void * table[1];
} ocall_table_Enclave = {
	1,
	{
		(void*)Enclave_Ocall_PrintString,
	}
};
sgx_status_t Ecall_SomeDataProcessing(sgx_enclave_id_t eid, char* buf, size_t len)
{
	sgx_status_t status;
	ms_Ecall_SomeDataProcessing_t ms;
	ms.ms_buf = buf;
	ms.ms_len = len;
	status = sgx_ecall(eid, 0, &ocall_table_Enclave, &ms);
	return status;
}

sgx_status_t Ecall_MaliciousDataProcessing(sgx_enclave_id_t eid, uint64_t p_inside)
{
	sgx_status_t status;
	ms_Ecall_MaliciousDataProcessing_t ms;
	ms.ms_p_inside = p_inside;
	status = sgx_ecall(eid, 1, &ocall_table_Enclave, &ms);
	return status;
}

