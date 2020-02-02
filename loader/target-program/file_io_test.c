#include <stdio.h>
#include <enclave.h>
#include <fcntl.h>

#define PATH "./target-program/foo2.c"
#define BUFFER_SIZE 100

//Weijie:
int readline(int fd, const char *buf, size_t n)
{
	for(int i = 0; i < n - 1; i++){
		char tmp_buf[1];
		if (read(fd, tmp_buf, 1) != NULL) {
			strcat(buf, tmp_buf);
			if (tmp_buf[0] == '\n') {
				strcat(buf, "\0");
				return (i+1);
			}
		}
		else {
			strcat(buf, "\0");
			return (i+1);
		}
	}
	strcat(buf, "\0");
	return n;
}

void enclave_main(void)
{
	int in_fd;
	in_fd = open(PATH, O_RDONLY, S_IRUSR);

	if (in_fd == -1) {
		puts("PARAM file cannot be opened!\n")    ;
	}

	char buffer[BUFFER_SIZE];
	//if (read(in_fd, buffer, BUFFER_SIZE) != NULL) {
	if (readline(in_fd, buffer, BUFFER_SIZE) > 0) {
		puts(buffer);
	}

	enclave_exit();
}
