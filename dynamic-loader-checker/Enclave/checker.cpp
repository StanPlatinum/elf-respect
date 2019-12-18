#include <capstone/platform.h>
#include <capstone/capstone.h>

#define X86_CODE64 "\x55\x48\x8b\x05\xb8\x13\x00\x00\x55\x48\x8b\x05\xb8\x13\x00\x00"
#define X86_CODE64_2 "\x55\x48\x8b\x05\xb8\x13\x00\x00\xe9\xea\xbe\xad\xde\xff\x25\x23\x01\x00\x00\xe8\xdf\xbe\xad\xde\x74\xff"

/******************************** linklist operations ********************************/

typedef cs_insn ElementType;
typedef struct node
{
	ElementType data;    // 结点的数据
	struct node *next;   // 结点指针
}Node;
typedef Node *PNode;     // 重命名结点指针类型

// 头插法创建链表
//int Create_List_Head(struct node ** head, ElementType data)
int Create_List_Head(PNode *h, ElementType data)
{
	// 创建一个新的结点
	//struct node * node = (struct node *)malloc(sizeof(Node)/sizeof(char));
	PNode p = (PNode)malloc(sizeof(Node)/sizeof(char));
	if (p == NULL)
	{
		return MALLOC_ERROR;
	}
	
	// 将新数据赋给新结点
	p->data = data;
	p->next = *h;
	*h = p;
}

// 尾插法创建链表
int Create_List_Tail(PNode *h, ElementType data)
{
	PNode node = (PNode)malloc(sizeof(Node)/sizeof(char));
	if (node == NULL)
	{
		return MALLOC_ERROR;
	}
	node->data = data;
	node->next = NULL;
	
	// 将node加入到链表最后，此处要考虑是否非空表
  	if (*h == NULL)   // 空表
	{
		*h = node;
	} 
	else              // 非空表
	{
		PNode temp = *h;
		
		// 找最后一个结点
		while (temp->next)
		{
			temp = temp->next;
		}
		temp->next = node;
	}
	
	return OK;
}

void DisPlay(PNode head)
{
	if (head == NULL)
	{
		printf ("该链表是空表!\n");
		return;
	}
	PNode temp = head;
	while (temp)
	{
		printf ("%4d", temp->data);
		temp = temp->next;
	}
	
	printf ("\n");
}

/******************************** test ********************************/
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
