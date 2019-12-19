#include <capstone/platform.h>
#include <capstone/capstone.h>

#define X86_CODE64 "\x55\x48\x8b\x05\xb8\x13\x00\x00\x55\x48\x8b\x05\xb8\x13\x00\x00\x55\x48\x8b\x05\xb8\x13\x00\x00\xe9\xea\xbe\xad\xde\xff\x25\x23\x01\x00\x00\xe8\xdf\xbe\xad\xde\x74\xff\x55\x48\x8b\x05\xb8\x13\x00\x00\x55\x48\x8b\x05\xb8\x13\x00\x00\x55\x48\x8b\x05\xb8\x13\x00\x00\xe9\xea\xbe\xad\xde\xff\x25\x23\x01\x00\x00\xe8\xdf\xbe\xad\xde\x74\xff"

/******************************** linklist operations ********************************/

#define OK            0
#define ERROR        -1
#define MALLOC_ERROR -2 

typedef cs_insn ElementType;
typedef struct s_node
{
	ElementType data;
	struct s_node* pNext;
}Node;

Node* create_list_head();
Node* create_new_node(int node_data);
int add_node_head(Node* head, Node* new_node);
void display_list(Node* head);
void free_list(Node* head);
Node* revert_list(Node* head);


Node* create_list_head()
{
	Node* head = (Node*)malloc(sizeof(Node));
	if(NULL != head)
	{
		head->data= -1;
		head->pNext= NULL;	
	}
	return head;
} 
 
Node* create_new_node(ElementType node_data)
{
	Node* new_node = (Node*)malloc(sizeof(Node));
	if(NULL != new_node)
	{
		new_node->data= node_data;
		new_node->pNext= NULL;	
	}	
	return new_node;
}
 
int add_node_head(Node* head, Node* new_node)
{
	if(NULL == head || NULL == new_node)
		return -1;
 	new_node->pNext = head->pNext;
	head->pNext = new_node;
	return 0; 
} 
 
void display_list(Node* head)
{
	if(NULL == head)
		return;
	Node* tmp = head;
	printf("list data:");
	while(NULL !=(tmp=tmp->pNext))
	{
		printf("%d  ", tmp->data);
	}
	printf("\n");
}
 
void free_list(Node* head)
{
	if(NULL == head) 
		return;
	Node* p = head;
	while(p = p->pNext)
	{
		head->pNext = p->pNext;
		//printf("free:%d\n", p->data);
		free(p);
		p = head;
	}
	free(head);
} 
 
Node* revert_list(Node* head)
{
	if(NULL == head)
		return;
 
	Node* p = head->pNext;
	head->pNext= NULL;
	Node* tmp = NULL;
	while(p)
	{
		tmp = p->pNext;
		add_node_head(head, p); 
		p = tmp;	
	}
	
	return head;
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

	//Weijie: create forward list
	Node* head = create_list_head();
	if(NULL == head)
	{
		printf("create forward list head failed!\n");
		return -1;
	}

	
	cs_option(handle, CS_OPT_DETAIL, CS_OPT_ON);
	// allocate memory for the cache to be used by cs_disasm_iter()
	insn = cs_malloc(handle);

	code = (unsigned char *)X86_CODE64;
	size = sizeof(X86_CODE64) - 1;
	address = 0x1000;
	PrintDebugInfo("Disasm:\n");

	while(cs_disasm_iter(handle, &code, &size, &address, insn)) {

		//Weijie: add &insn to forward list
		add_node_head(head, create_new_node(&insn));
		PrintDebugInfo("befor reverse"); 
		display_list(head);
	
		head = revert_list(head); 
		PrintDebugInfo("after reverse"); 
		display_list(head);
	
		free_list(head);
		
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
