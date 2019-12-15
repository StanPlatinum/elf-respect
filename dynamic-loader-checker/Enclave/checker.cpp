#include <capstone/platform.h>
#include <capstone/capstone.h>

struct platform {
	cs_arch arch;
	cs_mode mode;
	unsigned char *code;
	size_t size;
	const char *comment;
	cs_opt_type opt_type;
	cs_opt_value opt_value;
};

static void print_string_hex(unsigned char *str, size_t len)
{
	unsigned char *c;

	PrintDebugInfo("Code: ");
	for (c = str; c < str + len; c++) {
		PrintDebugInfo("0x%02x ", *c & 0xff);
	}
	PrintDebugInfo("\n");
}

#define X86_CODE64 "\x55\x48\x8b\x05\xb8\x13\x00\x00"
static void test()
{
	struct platform test64_platform = 
	{
		CS_ARCH_X86,
		CS_MODE_64,
		(unsigned char *)X86_CODE64,
		sizeof(X86_CODE64) - 1,
		"X86 64 (Intel syntax)"
	};

	csh handle;
	uint64_t address;
	cs_insn *insn;
	cs_detail *detail;
	int i;
	cs_err err;
	const uint8_t *code;
	size_t size;

	PrintDebugInfo("****************\n");
	PrintDebugInfo("Platform: %s\n", test64_platform.comment);
	err = cs_open(test64_platform.arch, test64_platform.mode, &handle);
	if (err) {
		PrintDebugInfo("Failed on cs_open() with error returned: %u\n", err);
		abort();
	}

	if (test64_platform.opt_type)
		cs_option(handle, test64_platform.opt_type, test64_platform.opt_value);

	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);

	// allocate memory for the cache to be used by cs_disasm_iter()
	insn = cs_malloc(handle);

	print_string_hex(test64_platform.code, test64_platform.size);
	PrintDebugInfo("Disasm:\n");

	address = 0x1000;
	code = test64_platform.code;
	size = test64_platform.size;
	while(cs_disasm_iter(handle, &code, &size, &address, insn)) {
		int n;

		PrintDebugInfo("0x%" PRIx64 ":\t%s\t\t%s // insn-ID: %u, insn-mnem: %s\n",
				insn->address, insn->mnemonic, insn->op_str,
				insn->id, cs_insn_name(handle, insn->id));

		// print implicit registers used by this instruction
		detail = insn->detail;

		if (detail->regs_read_count > 0) {
			PrintDebugInfo("\tImplicit registers read: ");
			for (n = 0; n < detail->regs_read_count; n++) {
				PrintDebugInfo("%s ", cs_reg_name(handle, detail->regs_read[n]));
			}
			PrintDebugInfo("\n");
		}

		// print implicit registers modified by this instruction
		if (detail->regs_write_count > 0) {
			PrintDebugInfo("\tImplicit registers modified: ");
			for (n = 0; n < detail->regs_write_count; n++) {
				PrintDebugInfo("%s ", cs_reg_name(handle, detail->regs_write[n]));
			}
			PrintDebugInfo("\n");
		}

		// print the groups this instruction belong to
		if (detail->groups_count > 0) {
			PrintDebugInfo("\tThis instruction belongs to groups: ");
			for (n = 0; n < detail->groups_count; n++) {
				PrintDebugInfo("%s ", cs_group_name(handle, detail->groups[n]));
			}
			PrintDebugInfo("\n");
		}
	}

	PrintDebugInfo("****************\n");
	// free memory allocated by cs_malloc()
	cs_free(insn, 1);
	cs_close(&handle);

}

void ecall_test_capstone_iter()
{
	test();
}
