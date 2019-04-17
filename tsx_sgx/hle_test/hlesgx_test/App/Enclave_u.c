#include "Enclave_u.h"
#include <errno.h>

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
sgx_status_t hle_test(sgx_enclave_id_t eid)
{
	sgx_status_t status;
	status = sgx_ecall(eid, 0, &ocall_table_Enclave, NULL);
	return status;
}

