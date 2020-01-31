#include <stdio.h>
#include <enclave.h>
#include <fcntl.h>

#define SAVE_PARAM_PATH "./target-program/foo2.c"

void enclave_main(void)
{
	int in_fd;
	in_fd = open(SAVE_PARAM_PATH, O_RDONLY);
	//in_fd = open(SAVE_PARAM_PATH, O_RDWR, S_IRWXG);
	//in_fd = open(SAVE_PARAM_PATH, O_RDWR | O_CREAT, S_IRWXG);
	if (in_fd == -1) {
		puts("PARAM file cannot be opened!\n")    ;
	}
	enclave_exit();
}
