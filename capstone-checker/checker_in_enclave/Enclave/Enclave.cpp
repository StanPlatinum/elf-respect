#include <stdio.h>
#include <string.h>
#include <stdarg.h>

#include "Enclave.h"
#include "Enclave_t.h"

#include "my_stdio.h"
#include "my_stdio.c"

/* My private Enclave functions */
void PrintDebugInfo(const char *fmt, ...)
{
	char buf[BUFSIZ] = {'\0'};
	va_list ap;
	va_start(ap, fmt);
	vsnprintf(buf, BUFSIZ, fmt, ap);
	va_end(ap);
	Ocall_PrintString(buf);
}

#include "libelf.h"
#include "capstone/capstone.h"

int Ecall_entry(char *filename) {
        int fd;
        Elf *e;
        Elf_Scn *scn = NULL;
        Elf64_Shdr *shdr64;
        size_t shstrndx;

        if (elf_version(EV_CURRENT) == EV_NONE) {
                PrintDebugInfo("ELF library initialization failed\n");
                return -1;
        }

        fd = open(filename, O_RDONLY);
        if (fd < 0) {
                PrintDebugInfo("Cannot open file %s\n", filename);
                return -1;
        }
#if 0
        e = elf_begin(fd, ELF_C_READ_MMAP, NULL);
        if (e == NULL) {
                PrintDebugInfo("elf_begin failed\n");
                return -1;
        }
#endif
	close(fd);
	return 0;
}
