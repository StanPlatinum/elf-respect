	.text
	.file	"simple_loop.c"
	.globl	enclave_main
	.align	16, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Ltmp0:
	.cfi_def_cfa_offset 16
.Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Ltmp2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$10, -8(%rbp)
	jge	.LBB0_4
# BB#2:                                 #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
# BB#3:                                 #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	xorl	%edi, %edi
	callq	exit
.Lfunc_end0:
	.size	enclave_main, .Lfunc_end0-enclave_main
	.cfi_endproc


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
