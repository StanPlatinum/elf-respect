#include <stdio.h>
#include <enclave.h>
#include <fcntl.h>

#define PATH "./target-program/foo2.c"
#define BUFFER_SIZE 16

void enclave_main(void)
{
	int in_fd;
	in_fd = open(PATH, O_RDONLY, S_IRUSR);

	if (in_fd == -1) {
		puts("PARAM file cannot be opened!\n")    ;
	}

	char buffer[BUFFER_SIZE];
	if (read(in_fd, buffer, BUFFER_SIZE) != NULL) {
		puts(buffer);
	}

	enclave_exit();
}
