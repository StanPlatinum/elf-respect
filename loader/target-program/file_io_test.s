	.text
	.file	"file_io_test.c"
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	xorl	%esi, %esi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	open@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.LBB0_2
# %bb.1:                                # %if.then
	leaq	.L.str.1(%rip), %rdi
	callq	puts@PLT
.LBB0_2:                                # %if.end
	xorl	%edi, %edi
	callq	exit@PLT
.Lfunc_end0:
	.size	enclave_main, .Lfunc_end0-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"./target-program/foo2.c"
	.size	.L.str, 24

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"PARAM file cannot be opened!\n"
	.size	.L.str.1, 30


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-mc.git 4849ae354b8e083c81068f07b1b37ee6da0c117b)"
	.section	".note.GNU-stack","",@progbits
