#include "Enclave_u.h"
#include <errno.h>

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

static sgx_status_t SGX_CDECL Enclave_Ocall_PrintString(void* pms)
{
	ms_Ocall_PrintString_t* ms = SGX_CAST(ms_Ocall_PrintString_t*, pms);
	Ocall_PrintString((const char*)ms->ms_str);

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
sgx_status_t Ecall_nw(sgx_enclave_id_t eid, char* seq_1, char* seq_2, char* seq_1_al, char* seq_2_al, bool prm)
{
	sgx_status_t status;
	ms_Ecall_nw_t ms;
	ms.ms_seq_1 = seq_1;
	ms.ms_seq_2 = seq_2;
	ms.ms_seq_1_al = seq_1_al;
	ms.ms_seq_2_al = seq_2_al;
	ms.ms_prm = prm;
	status = sgx_ecall(eid, 0, &ocall_table_Enclave, &ms);
	return status;
}

