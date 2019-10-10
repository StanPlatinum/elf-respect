	.text
	.file	"test.bc"
	.globl	getNumber               # -- Begin function getNumber
	.p2align	4, 0x90
	.type	getNumber,@function
getNumber:                              # @getNumber
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
                                        # kill: def $edi killed $edi def $rdi
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%edi, -4(%rbp)
	leal	(%rdi,%rdi), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	getNumber, .Lfunc_end0-getNumber
	.cfi_endproc
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -24
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
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Fine\n"
	.size	.L.str, 6


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
