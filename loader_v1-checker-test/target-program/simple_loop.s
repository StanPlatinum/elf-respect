	.text
	.file	"simple_loop.bc"
	.globl	enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
.Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	cmpl	$9, -4(%rbp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %for.body
                                        # =>This Inner Loop Header: Depth=1
	incl	-8(%rbp)
	incl	-4(%rbp)
	cmpl	$9, -4(%rbp)
	jle	.LBB0_2
.LBB0_3:                                # %for.end
	xorl	%edi, %edi
	callq	exit
.Lfunc_end0:
	.size	enclave_main, .Lfunc_end0-enclave_main
	.cfi_endproc


	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits