	.text
	.file	"bm_hello.c"
	.globl	useless                 # -- Begin function useless
	.p2align	4, 0x90
	.type	useless,@function
useless:                                # @useless
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	subq	$16, %rsp
	callq	instrument_function_get_time@PLT
	movl	$0, 12(%rsp)
	movl	$1, 8(%rsp)
	movl	12(%rsp), %eax
	cmpl	8(%rsp), %eax
	jge	.LBB0_2
# %bb.1:                                # %if.then
	callq	instrument_function_get_time@PLT
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	CFICheck@PLT
	jmp	.LBB0_3
.LBB0_2:                                # %if.else
	callq	instrument_function_get_time@PLT
	xorl	%edi, %edi
	callq	exit@PLT
.LBB0_3:                                # %if.end
	callq	instrument_function_get_time@PLT
	movq	%rbp, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	useless, .Lfunc_end0-useless
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	subq	$16, %rsp
	callq	instrument_function_get_time@PLT
	leaq	.L.str(%rip), %rdi
	callq	puts@PLT
	xorl	%edi, %edi
	movl	%eax, 12(%rsp)          # 4-byte Spill
	callq	exit@PLT
.Lfunc_end1:
	.size	enclave_main, .Lfunc_end1-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"hello"
	.size	.L.str, 6


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/proofGen.git de6c4fc1f3ca547fdde74752555ad6bb477f1757)"
	.section	".note.GNU-stack","",@progbits
