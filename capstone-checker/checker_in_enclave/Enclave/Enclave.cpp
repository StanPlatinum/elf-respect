#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <unistd.h>


#include "Enclave.h"
#include "Enclave_t.h"

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
#include "my_stdio.c"

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
	e = elf_begin(fd, ELF_C_READ_MMAP, NULL);
	if (e == NULL) {
		PrintDebugInfo("elf_begin failed\n");
		return -1;
	}

	if (elf_getshdrstrndx(e, &shstrndx) != 0){
		PrintDebugInfo("Cannot get string section\n");
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
			PrintDebugInfo("elf_strptr returns NULL\n");
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
		PrintDebugInfo("Cannot find .text section\n");
	} else {
		PrintDebugInfo("Text sections at %lx with size %d\n", textOff, textSize);
	}
	close(fd);

	fd = open(filename, O_RDONLY);
	char* buf = (char*)malloc(textSize);

	/* Weijie: use lseek and read instead of pread... */
	//off_t lseek_result;
	//lseek_result = lseek(fd, textOff, SEEK_SET);
	//ssize_t ret = read(fd, buf, textSize);
	ssize_t ret = pread(fd, buf, textSize, textOff);

	if (ret != textSize) {
		PrintDebugInfo("Error in reading code\n");
		return -1;
	}
	close(fd);

	csh handle;
	cs_insn *insn;
	size_t count;

	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle)) {
		PrintDebugInfo("ERROR: Failed to initialize engine!\n");
		return -1;
	}

	count = cs_disasm(handle, (const unsigned char*)buf, textSize, textAddr, 0, &insn);
	if (count) {
		size_t j;
		for (j = 0; j < count; j++) {
			PrintDebugInfo("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);
		}
		cs_free(insn, count);
	} else
		PrintDebugInfo("ERROR: Failed to disassemble given code!\n");
	cs_close(&handle);
	free(buf);

	return 0;
}
