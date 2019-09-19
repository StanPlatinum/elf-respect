	.text
	.file	"enclave_main.bc"
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$32768, %edi            # imm = 0x8000
	callq	malloc
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -8(%rbp)
	testq	%rax, %rax
	je	.LBB0_2
# %bb.1:
	movq	-8(%rbp), %rdi
	movabsq	$81985529206280466, %r8 # imm = 0x123456789101112
	movl	$.L.str, %esi
	movl	$.L.str.1, %ecx
	movl	$137, %edx
	xorl	%eax, %eax
	callq	sprintf
	movq	-8(%rbp), %rdi
	callq	puts
	movq	-8(%rbp), %rdi
	callq	free
	xorl	%edi, %edi
	callq	exit
.LBB0_2:
	movl	$.L.str.2, %edi
	callq	puts
	xorl	%edi, %edi
	callq	exit
.Lfunc_end0:
	.size	enclave_main, .Lfunc_end0-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata,"a",@progbits
.L.str:
	.asciz	"The number is %d, the string is %s, another number is 0x%llx\n\000"
	.size	.L.str, 63

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"\"A long long long string\"\000"
	.size	.L.str.1, 27

	.type	.L.str.2,@object        # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"buf is NULL"
	.size	.L.str.2, 12


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
