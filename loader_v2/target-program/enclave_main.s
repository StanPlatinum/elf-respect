	.text
	.file	"foo2.c"
	.globl	fun
	.p2align	4, 0x90
	.type	fun,@function
fun:                                    # @fun
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$1, %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	fun, .Lfunc_end0-fun

	.globl	enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	fun@GOTPCREL(%rip), %rax
	movq	%rax, -8(%rbp)
	callq	*-8(%rbp)
	leaq	.L.str(%rip), %rdi
	movl	%eax, -12(%rbp)
	movb	$0, %al
	callq	puts@PLT
	xorl	%edi, %edi
	movl	%eax, -16(%rbp)         # 4-byte Spill
	callq	exit@PLT
.Lfunc_end1:
	.size	enclave_main, .Lfunc_end1-enclave_main

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"success!"
	.size	.L.str, 9


	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
