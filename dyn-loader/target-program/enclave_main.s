	.text
	.file	"simple_loop.c"
	.globl	enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$10, -8(%rbp)
	jge	.LBB0_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
# BB#3:                                 # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_4:                                # %for.end
	xorl	%edi, %edi
	callq	exit@PLT
.Lfunc_end0:
	.size	enclave_main, .Lfunc_end0-enclave_main


	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
