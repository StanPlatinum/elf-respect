#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#include "libelf.h"
#include "capstone/capstone.h"
int main(int argc, char **argv) {
    int fd;
    Elf *e;
    Elf_Scn *scn = NULL;
    Elf64_Shdr *shdr64;
    size_t shstrndx;

    if (elf_version(EV_CURRENT) == EV_NONE) {
        fprintf(stderr, "ELF library initialization failed\n");
        return -1;
    }

    fd = open(argv[1], O_RDONLY, 0);
    if (fd < 0) {
        fprintf(stderr, " Cannot open file %s\n", argv[1]);
        return -1;
    }
    e = elf_begin(fd, ELF_C_READ_MMAP, NULL);
    if (e == NULL) {
        fprintf (stderr, "elf_begin failed\n");
        return -1;
    }

    if (elf_getshdrstrndx(e, &shstrndx) != 0){
        fprintf(stderr, " cannot get string section\n");
        return -1;
    }


    char* name;
    Elf64_Off textOff = 0;
    Elf64_Xword textSize; 
    Elf64_Addr textAddr;
    while ( (scn = elf_nextscn(e, scn)) != NULL) {
        shdr64 = elf64_getshdr(scn);
        name = elf_strptr(e, shstrndx, shdr64->sh_name);
        if (name == NULL) {
            fprintf(stderr, "elf_strptr returns NULL\n");
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
        fprintf(stderr, "Cannot find .text section\n");
    } else {
        fprintf(stderr, "Text sections at %lx with size %d\n", textOff, textSize);
    }
    close(fd);

    fd = open(argv[1], O_RDONLY, 0);
    char* buf = (char*)malloc(textSize);
    ssize_t ret = pread(fd, buf, textSize, textOff);
    if (ret != textSize) {
        fprintf(stderr, "Error in reading code\n");
        return -1;
    }
    close(fd);

	csh handle;
	cs_insn *insn;
	size_t count;

	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
		printf("ERROR: Failed to initialize engine!\n");
		return -1;
	}

	count = cs_disasm(handle, buf, textSize, textAddr, 0, &insn);
	if (count) {
		size_t j;

		for (j = 0; j < count; j++) {
			printf("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);
		}

		cs_free(insn, count);
	} else
		printf("ERROR: Failed to disassemble given code!\n");

	cs_close(&handle);
    free(buf);
    return 0;

}
