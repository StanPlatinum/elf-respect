	.text
	.file	"simple_loop.bc"
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
	subq	$16, %rsp
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	cmpl	$9, -4(%rbp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	addl	$1, -8(%rbp)
	addl	$1, -4(%rbp)
	cmpl	$9, -4(%rbp)
	jle	.LBB0_2
.LBB0_3:
	xorl	%edi, %edi
	callq	exit
.Lfunc_end0:
	.size	enclave_main, .Lfunc_end0-enclave_main
	.cfi_endproc
                                        # -- End function

	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
