/* ocall.cpp
 * Assuming the code is compiled under Linux/Ubuntu
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>

int ocall_open(const char* filename, int mode) 
{
	//open(argv[1], O_RDONLY);
	return open(filename, mode);
}

int ocall_read(int file, void *buf, unsigned int size) {
	//while( read(fd, buf, sizeof(buf)>0) )
	//{
	//	printf("%s\n", buf);
	//	memset(buf, 0, sizeof(buf));
	//}
	return read(file, buf, size);
}

int ocall_write(int file, void *buf, unsigned int size) {
	//write(fd, buf, strlen(buf));
	return write(file, buf, size);
}

void ocall_close(int file) {
	//close(fd);
	close(file);
}
