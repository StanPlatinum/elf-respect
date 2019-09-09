/* my_stdio.h */
#ifndef __STDIO_H
#define __STDIO_H

#include <stdio.h>

#ifndef _INC_FCNTL
#define _INC_FCNTL

#define O_RDONLY       0x0000  /* open for reading only */
#define O_WRONLY       0x0001  /* open for writing only */
#define O_RDWR         0x0002  /* open for reading and writing */
#define O_APPEND       0x0008  /* writes done at eof */

#define O_CREAT        0x0100  /* create and open file */
#define O_TRUNC        0x0200  /* open and truncate */
#define O_EXCL         0x0400  /* open only if file doesn't already exist */

#define O_TEXT         0x4000  /* file mode is text (translated) */
#define O_BINARY       0x8000  /* file mode is binary (untranslated) */
#define O_WTEXT        0x10000 /* file mode is UTF16 (translated) */
#define O_U16TEXT      0x20000 /* file mode is UTF16 no BOM (translated) */
#define O_U8TEXT       0x40000 /* file mode is UTF8  no BOM (translated) */

#endif

#ifdef __cplusplus
extern "C" {
#endif

ssize_t pread(int, void *, size_t, off_t);

extern int stdin, stdout, stderr;

int open(const char* filename, int mode);
int read(int file, void *buf, unsigned int size);
int write(int file, void *buf, unsigned int size);
void close(int file);

#ifdef __cplusplus
}
#endif

#endif
