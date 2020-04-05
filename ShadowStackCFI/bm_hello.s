	.text
	.file	"bm_hello.c"
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	subq	$16, %rsp
	movq	shadow_rip_addr@GOTPCREL(%rip), %rax
	movq	main_rip_addr@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	(%rax), %rax
	movq	(%rcx), %rcx
	orq	(%rax), %rcx
	cmpq	$0, %rcx
	je	.LBB0_2
# %bb.1:                                # %newbasicblock2
	callq	instrument_function_get_time@PLT
.LBB0_2:                                # %newbasicblock3
	leaq	.L.str(%rip), %rdi
	callq	puts@PLT
	xorl	%edi, %edi
	movl	%eax, 12(%rsp)          # 4-byte Spill
	callq	exit@PLT
.Lfunc_end0:
	.size	enclave_main, .Lfunc_end0-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"hello"
	.size	.L.str, 6


	.ident	"clang version 9.0.0 (tags/RELEASE_900/final)"
	.section	".note.GNU-stack","",@progbits
