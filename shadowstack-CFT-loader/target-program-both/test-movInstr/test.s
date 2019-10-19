	.text
	.file	"test.bc"
	.globl	getNumber               # -- Begin function getNumber
	.p2align	4, 0x90
	.type	getNumber,@function
getNumber:                              # @getNumber
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
                                        # kill: def $edi killed $edi def $rdi
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%edi, -4(%rbp)
	leal	(%rdi,%rdi), %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	getNumber, .Lfunc_end0-getNumber
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$24, %rsp
	leaq	-20(%rbp), %rax
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -16(%rbp)
	movl	$.L.str, %edi
	callq	puts
	movq	-16(%rbp), %rbx
	movl	$500000, %edi           # imm = 0x7A120
	callq	getNumber
	cltq
	leaq	(%rbx,%rax,4), %rcx
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rcx, -16(%rbp)
	leaq	(%rbx,%rax,4), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$5, (%rbx,%rax,4)
	xorl	%edi, %edi
	callq	exit
.Lfunc_end1:
	.size	enclave_main, .Lfunc_end1-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Fine\n"
	.size	.L.str, 6


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
