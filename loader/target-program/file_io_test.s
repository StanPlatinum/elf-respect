	.text
	.file	"file_io_test.c"
	.globl	readline                # -- Begin function readline
	.p2align	4, 0x90
	.type	readline,@function
readline:                               # @readline
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	$0, -28(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movslq	-28(%rbp), %rax
	movq	-24(%rbp), %rcx
	subq	$1, %rcx
	cmpq	%rcx, %rax
	jae	.LBB0_9
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	-29(%rbp), %rsi
	movl	-8(%rbp), %edi
	movl	$1, %edx
	movb	$0, %al
	callq	read@PLT
	movslq	%eax, %rcx
	cmpq	$0, %rcx
	je	.LBB0_6
# %bb.3:                                # %if.then
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	-29(%rbp), %rsi
	movq	-16(%rbp), %rdi
	callq	strcat@PLT
	movsbl	-29(%rbp), %ecx
	cmpl	$10, %ecx
	jne	.LBB0_5
# %bb.4:                                # %if.then10
	movq	-16(%rbp), %rdi
	leaq	.L.str(%rip), %rsi
	callq	strcat@PLT
	movl	-28(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -4(%rbp)
	jmp	.LBB0_10
.LBB0_5:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_7
.LBB0_6:                                # %if.else
	movq	-16(%rbp), %rdi
	leaq	.L.str(%rip), %rsi
	callq	strcat@PLT
	movl	-28(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -4(%rbp)
	jmp	.LBB0_10
.LBB0_7:                                # %if.end14
                                        #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_8
.LBB0_8:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB0_1
.LBB0_9:                                # %for.end
	movq	-16(%rbp), %rdi
	leaq	.L.str(%rip), %rsi
	callq	strcat@PLT
	movq	-24(%rbp), %rcx
                                        # kill: def $ecx killed $ecx killed $rcx
	movl	%ecx, -4(%rbp)
.LBB0_10:                               # %return
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	readline, .Lfunc_end0-readline
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	xorl	%esi, %esi
	leaq	.L.str.1(%rip), %rdi
	movl	$256, %edx              # imm = 0x100
	movb	$0, %al
	callq	open@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.LBB1_2
# %bb.1:                                # %if.then
	leaq	.L.str.2(%rip), %rdi
	callq	puts@PLT
.LBB1_2:                                # %if.end
	leaq	-112(%rbp), %rsi
	movl	-4(%rbp), %edi
	movl	$100, %edx
	callq	readline@PLT
	cmpl	$0, %eax
	jle	.LBB1_4
# %bb.3:                                # %if.then4
	leaq	-112(%rbp), %rdi
	callq	puts@PLT
.LBB1_4:                                # %if.end7
	xorl	%edi, %edi
	callq	exit@PLT
.Lfunc_end1:
	.size	enclave_main, .Lfunc_end1-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata,"a",@progbits
.L.str:
	.zero	2
	.size	.L.str, 2

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"./target-program/foo2.c"
	.size	.L.str.1, 24

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"PARAM file cannot be opened!\n"
	.size	.L.str.2, 30


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-mc.git 4849ae354b8e083c81068f07b1b37ee6da0c117b)"
	.section	".note.GNU-stack","",@progbits
