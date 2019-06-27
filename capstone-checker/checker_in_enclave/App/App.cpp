/*
 * Copyright (C) 2011-2017 Intel Corporation. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *   * Neither the name of Intel Corporation nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */


#include <stdio.h>
#include <string.h>
#include <assert.h>

# include <unistd.h>
# include <pwd.h>
# define MAX_PATH FILENAME_MAX

#include "sgx_urts.h"
#include "App.h"
#include "Enclave_u.h"

/* for my own use */
#include <string>
#include <iostream>

using namespace std;


/* Global EID shared by multiple threads */
sgx_enclave_id_t global_eid = 0;

typedef struct _sgx_errlist_t {
	sgx_status_t err;
	const char *msg;
	const char *sug; /* Suggestion */
} sgx_errlist_t;

/* Error code returned by sgx_create_enclave */
static sgx_errlist_t sgx_errlist[] = {
	{
		SGX_ERROR_UNEXPECTED,
		"Unexpected error occurred.",
		NULL
	},
	{
		SGX_ERROR_INVALID_PARAMETER,
		"Invalid parameter.",
		NULL
	},
	{
		SGX_ERROR_OUT_OF_MEMORY,
		"Out of memory.",
		NULL
	},
	{
		SGX_ERROR_ENCLAVE_LOST,
		"Power transition occurred.",
		"Please refer to the sample \"PowerTransition\" for details."
	},
	{
		SGX_ERROR_INVALID_ENCLAVE,
		"Invalid enclave image.",
		NULL
	},
	{
		SGX_ERROR_INVALID_ENCLAVE_ID,
		"Invalid enclave identification.",
		NULL
	},
	{
		SGX_ERROR_INVALID_SIGNATURE,
		"Invalid enclave signature.",
		NULL
	},
	{
		SGX_ERROR_OUT_OF_EPC,
		"Out of EPC memory.",
		NULL
	},
	{
		SGX_ERROR_NO_DEVICE,
		"Invalid SGX device.",
		"Please make sure SGX module is enabled in the BIOS, and install SGX driver afterwards."
	},
	{
		SGX_ERROR_MEMORY_MAP_CONFLICT,
		"Memory map conflicted.",
		NULL
	},
	{
		SGX_ERROR_INVALID_METADATA,
		"Invalid enclave metadata.",
		NULL
	},
	{
		SGX_ERROR_DEVICE_BUSY,
		"SGX device was busy.",
		NULL
	},
	{
		SGX_ERROR_INVALID_VERSION,
		"Enclave version was invalid.",
		NULL
	},
	{
		SGX_ERROR_INVALID_ATTRIBUTE,
		"Enclave was not authorized.",
		NULL
	},
	{
		SGX_ERROR_ENCLAVE_FILE_ACCESS,
		"Can't open enclave file.",
		NULL
	},
};

/********************************************************/

/* Check error conditions for loading enclave */
void print_error_message(sgx_status_t ret)
{
	size_t idx = 0;
	size_t ttl = sizeof sgx_errlist/sizeof sgx_errlist[0];

	for (idx = 0; idx < ttl; idx++) {
		if(ret == sgx_errlist[idx].err) {
			if(NULL != sgx_errlist[idx].sug)
				printf("Info: %s\n", sgx_errlist[idx].sug);
			printf("Error: %s\n", sgx_errlist[idx].msg);
			break;
		}
	}

	if (idx == ttl)
		printf("Error: Unexpected error occurred.\n");
}

/* Initialize the enclave:
 *   Step 1: try to retrieve the launch token saved by last transaction
 *   Step 2: call sgx_create_enclave to initialize an enclave instance
 *   Step 3: save the launch token if it is updated
 */
int initialize_enclave(void)
{
	char token_path[MAX_PATH] = {'\0'};
	sgx_launch_token_t token = {0};
	sgx_status_t ret = SGX_ERROR_UNEXPECTED;
	int updated = 0;

	/* Step 1: try to retrieve the launch token saved by last transaction 
	 *         if there is no token, then create a new one.
	 */
	/* try to get the token saved in $HOME */
	const char *home_dir = getpwuid(getuid())->pw_dir;

	if (home_dir != NULL && 
			(strlen(home_dir)+strlen("/")+sizeof(TOKEN_FILENAME)+1) <= MAX_PATH) {
		/* compose the token path */
		strncpy(token_path, home_dir, strlen(home_dir));
		strncat(token_path, "/", strlen("/"));
		strncat(token_path, TOKEN_FILENAME, sizeof(TOKEN_FILENAME)+1);
	} else {
		/* if token path is too long or $HOME is NULL */
		strncpy(token_path, TOKEN_FILENAME, sizeof(TOKEN_FILENAME));
	}

	FILE *fp = fopen(token_path, "rb");
	if (fp == NULL && (fp = fopen(token_path, "wb")) == NULL) {
		printf("Warning: Failed to create/open the launch token file \"%s\".\n", token_path);
	}

	if (fp != NULL) {
		/* read the token from saved file */
		size_t read_num = fread(token, 1, sizeof(sgx_launch_token_t), fp);
		if (read_num != 0 && read_num != sizeof(sgx_launch_token_t)) {
			/* if token is invalid, clear the buffer */
			memset(&token, 0x0, sizeof(sgx_launch_token_t));
			printf("Warning: Invalid launch token read from \"%s\".\n", token_path);
		}
	}
	/* Step 2: call sgx_create_enclave to initialize an enclave instance */
	/* Debug Support: set 2nd parameter to 1 */
	ret = sgx_create_enclave(ENCLAVE_FILENAME, SGX_DEBUG_FLAG, &token, &updated, &global_eid, NULL);
	if (ret != SGX_SUCCESS) {
		print_error_message(ret);
		if (fp != NULL) fclose(fp);
		return -1;
	}

	/* Step 3: save the launch token if it is updated */
	if (updated == FALSE || fp == NULL) {
		/* if the token is not updated, or file handler is invalid, do not perform saving */
		if (fp != NULL) fclose(fp);
		return 0;
	}

	/* reopen the file with write capablity */
	fp = freopen(token_path, "wb", fp);
	if (fp == NULL) return 0;
	size_t write_num = fwrite(token, 1, sizeof(sgx_launch_token_t), fp);
	if (write_num != sizeof(sgx_launch_token_t))
		printf("Warning: Failed to save launch token to \"%s\".\n", token_path);
	fclose(fp);
	return 0;
}


/********************************************************/

/* My OCall functions */
void Ocall_PrintString(const char *str){
	printf("%s", str);
}

#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include <signal.h>

#include "libelf.h"
#include "capstone/capstone.h"

#include "ocall.cpp"

/* Application entry */
int SGX_CDECL main(int argc, char *argv[])
{
	char *  program = *argv ;
	bool    prm = false;

	/* Initialize the enclave */
	if(initialize_enclave() < 0){
		printf("Enter a character before exit ...\n");
		getchar();
		return -1; 
	}

	/* Weijie: read elf outside... */
	char *filename = argv[1];

	int fd;
        Elf *e;
        Elf_Scn *scn = NULL;
        Elf64_Shdr *shdr64;
        size_t shstrndx;

        fd = open(filename, O_RDONLY);
        if (fd < 0) {
                printf("Cannot open file %s\n", filename);
                return -1;
        }
        
	if (elf_version(EV_CURRENT) == EV_NONE) {
                printf("ELF library initialization failed\n");
                return -1;
        }

	e = elf_begin(fd, ELF_C_READ_MMAP, NULL);

        if (e == NULL) {
                printf("elf_begin failed\n");
                return -1;
        }


        if (elf_getshdrstrndx(e, &shstrndx) != 0){
                printf("Cannot get string section\n");
                return -1;
        }

	printf("-----get textSize-----\n");

        char* name;
        Elf64_Off textOff = 0;
        Elf64_Xword textSize;
        Elf64_Addr textAddr;
        while ( (scn = elf_nextscn(e, scn)) != NULL) {
                shdr64 = elf64_getshdr(scn);
                name = elf_strptr(e, shstrndx, shdr64->sh_name);
                if (name == NULL) {
                        printf("elf_strptr returns NULL\n");
                        continue;
                }
                if (strcmp(name, ".text") == 0) {
                        textOff = shdr64->sh_offset;
                        textSize = shdr64->sh_size;
                        textAddr = shdr64->sh_addr;
                        break;
                }
        }
        if (textOff == 0) {
                printf("Cannot find .text section\n");
        } else {
                printf("Text sections at %lx with size %ld\n", textOff, textSize);
        }

        close(fd);

	printf("-----open file: %s, again-----\n", filename);

        fd = open(filename, O_RDONLY);
        char* buf = (char*)malloc(textSize);

        /* Weijie: use lseek and read instead of pread... */
        //off_t lseek_result;
        //lseek_result = lseek(fd, textOff, SEEK_SET);
        //ssize_t ret = read(fd, buf, textSize);
        ssize_t ret = pread(fd, buf, textSize, textOff);

        if (ret != textSize) {
                printf("Error in reading code\n");
                return -1;
        }
        close(fd);

	printf("-----App checking-----\n");

	/* Start to call... */
	/* ecall's return value should be a pointer...*/
	int* rv;
	Ecall_entry(global_eid, rv);

/* the following: "calling Ecall_cs_disasm version" */
#if 0
	csh handle;
        cs_insn *insn;
	size_t count;
        size_t *count_p = &count;

        if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
                printf("ERROR: Failed to initialize engine!\n");
                return -1;
        }
	Ecall_cs_disasm(global_eid, count_p, handle, insn);
	count = *count_p;
	printf("-----App checking again-----\n");
        
	if (count) {
                size_t j;
                for (j = 0; j < count; j++) {
                        printf("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);
                }
		//printf("-----App checking before cs_freeing-----\n");
                //cs_free(insn, count);
        } else
                printf("ERROR: Failed to disassemble given code!\n");

	printf("-----App checking before cs_closing-----\n");
        cs_close(&handle);
#endif

	printf("-----mission completed-----\n");
	/* Destroy the enclave */
	sgx_destroy_enclave(global_eid);

	return 0;
}

