	.text
	.file	"bm_hello.c"
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	leaq	.L.str(%rip), %rdi
	callq	puts@PLT
	xorl	%edi, %edi
	movl	%eax, -4(%rbp)          # 4-byte Spill
	callq	exit@PLT
.Lfunc_end0:
	.size	enclave_main, .Lfunc_end0-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"hello"
	.size	.L.str, 6


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-mc.git 4849ae354b8e083c81068f07b1b37ee6da0c117b)"
	.section	".note.GNU-stack","",@progbits
