#include <capstone/platform.h>
#include <capstone/capstone.h>

#define X86_CODE64 "\x55\x48\x8b\x05\xb8\x13\x00\x00"
static void test()
{
	csh handle;
	uint64_t address;
	cs_insn *insn;
	cs_detail *detail;
	int i;
	cs_err err;
	const uint8_t *code;
	size_t size;

	PrintDebugInfo("****************\n");
	err = cs_open(CS_ARCH_X86, CS_MODE_64, &handle);
	if (err) {
		PrintDebugInfo("Failed on cs_open() with error returned: %u\n", err);
		abort();
	}

	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);
	// allocate memory for the cache to be used by cs_disasm_iter()
	insn = cs_malloc(handle);

	code = (unsigned char *)X86_CODE64;
	size = sizeof(X86_CODE64) - 1;
	address = 0x1000;
	PrintDebugInfo("Disasm:\n");

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
