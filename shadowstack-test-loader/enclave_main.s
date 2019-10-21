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

	.globl	my_itoa
	.p2align	4, 0x90
	.type	my_itoa,@function
my_itoa:                                # @my_itoa
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-16(%rbp), %rsi
	movq	%rsi, -32(%rbp)
	cmpl	$0, -4(%rbp)
	jge	.LBB1_2
# BB#1:                                 # %if.then
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -32(%rbp)
	movb	$45, (%rdx)
	movslq	-4(%rbp), %rdx
	subq	%rdx, %rcx
	movl	%ecx, %eax
	movl	%eax, -4(%rbp)
.LBB1_2:                                # %if.end
	movq	-32(%rbp), %rax
	movq	%rax, -40(%rbp)
.LBB1_3:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	xorl	%edx, %edx
	divl	-20(%rbp)
	movl	%edx, -48(%rbp)
	movl	-20(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	%ecx, %eax
	xorl	%ecx, %ecx
	movl	%edx, -52(%rbp)         # 4-byte Spill
	movl	%ecx, %edx
	movl	-52(%rbp), %ecx         # 4-byte Reload
	divl	%ecx
	movl	%eax, -4(%rbp)
	cmpl	$9, -48(%rbp)
	jbe	.LBB1_5
# BB#4:                                 # %if.then4
                                        #   in Loop: Header=BB1_3 Depth=1
	movl	-48(%rbp), %eax
	subl	$10, %eax
	addl	$97, %eax
	movb	%al, %cl
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -32(%rbp)
	movb	%cl, (%rdx)
	jmp	.LBB1_6
.LBB1_5:                                # %if.else
                                        #   in Loop: Header=BB1_3 Depth=1
	movl	-48(%rbp), %eax
	addl	$48, %eax
	movb	%al, %cl
	movq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	addq	$1, %rsi
	movq	%rsi, -32(%rbp)
	movb	%cl, (%rdx)
.LBB1_6:                                # %if.end11
                                        #   in Loop: Header=BB1_3 Depth=1
	jmp	.LBB1_7
.LBB1_7:                                # %do.cond
                                        #   in Loop: Header=BB1_3 Depth=1
	cmpl	$0, -4(%rbp)
	jg	.LBB1_3
# BB#8:                                 # %do.end
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	addq	$-1, %rcx
	movq	%rcx, -32(%rbp)
	movb	$32, (%rax)
.LBB1_9:                                # %do.body15
                                        # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	movb	(%rax), %cl
	movb	%cl, -41(%rbp)
	movq	-40(%rbp), %rax
	movb	(%rax), %cl
	movq	-32(%rbp), %rax
	movb	%cl, (%rax)
	movb	-41(%rbp), %cl
	movq	-40(%rbp), %rax
	movb	%cl, (%rax)
	movq	-32(%rbp), %rax
	addq	$-1, %rax
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
# BB#10:                                # %do.cond18
                                        #   in Loop: Header=BB1_9 Depth=1
	movq	-40(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.LBB1_9
# BB#11:                                # %do.end21
	movq	-16(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end1:
	.size	my_itoa, .Lfunc_end1-my_itoa

	.globl	enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	leaq	.L.str(%rip), %rdi
	movq	fun@GOTPCREL(%rip), %rax
	movq	%rax, -8(%rbp)
	callq	puts@PLT
	movl	%eax, -36(%rbp)         # 4-byte Spill
	callq	*-8(%rbp)
	leaq	.L.str.1(%rip), %rdi
	movl	%eax, -12(%rbp)
	callq	puts@PLT
	leaq	.L.str.2(%rip), %rdi
	leaq	-20(%rbp), %rcx
	movq	%rcx, -32(%rbp)
	movl	%eax, -40(%rbp)         # 4-byte Spill
	callq	puts@PLT
	movl	$10, %edx
	movl	-12(%rbp), %edi
	movq	-32(%rbp), %rsi
	movl	%eax, -44(%rbp)         # 4-byte Spill
	callq	my_itoa@PLT
	leaq	.L.str.3(%rip), %rdi
	movq	%rax, -32(%rbp)
	callq	puts@PLT
	movq	-32(%rbp), %rdi
	movl	%eax, -48(%rbp)         # 4-byte Spill
	callq	puts@PLT
	leaq	.L.str.4(%rip), %rdi
	movl	%eax, -52(%rbp)         # 4-byte Spill
	callq	puts@PLT
	xorl	%edi, %edi
	movl	%eax, -56(%rbp)         # 4-byte Spill
	callq	exit@PLT
.Lfunc_end2:
	.size	enclave_main, .Lfunc_end2-enclave_main

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"----------1----------"
	.size	.L.str, 22

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"----------2----------"
	.size	.L.str.1, 22

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"----------3----------"
	.size	.L.str.2, 22

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"----------4----------"
	.size	.L.str.3, 22

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"success!"
	.size	.L.str.4, 9


	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
