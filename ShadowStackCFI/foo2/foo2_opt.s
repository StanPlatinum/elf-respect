	.text
	.file	"foo2"
	.globl	CFICheck                # -- Begin function CFICheck
	.p2align	4, 0x90
	.type	CFICheck,@function
CFICheck:                               # @CFICheck
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movq	%rdi, -32(%rbp)
	movabsq	$2305843009213693951, %rax # imm = 0x1FFFFFFFFFFFFFFF
	movq	%rax, -24(%rbp)
	movl	$536870911, -16(%rbp)   # imm = 0x1FFFFFFF
	movl	$0, -12(%rbp)
	movl	-16(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
.LBB0_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jg	.LBB0_11
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-12(%rbp), %ecx
	movl	-8(%rbp), %eax
	subl	-12(%rbp), %eax
	cltd
	movl	$2, %esi
	idivl	%esi
	addl	%eax, %ecx
	movl	%ecx, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.LBB0_4
# %bb.3:                                # %if.then
	jmp	.LBB0_12
.LBB0_4:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	-32(%rbp), %rax
	jne	.LBB0_6
# %bb.5:                                # %if.then4
	addq	$32, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	cmpq	%r10, (%rsp)
	jne	.LBB0_13
	retq
.LBB0_6:                                # %if.else
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	-32(%rbp), %rax
	jle	.LBB0_8
# %bb.7:                                # %if.then8
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_9
.LBB0_8:                                # %if.else10
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
.LBB0_9:                                # %if.end12
                                        #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_10
.LBB0_10:                               # %if.end13
                                        #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_1
.LBB0_11:                               # %while.end.loopexit
	jmp	.LBB0_12
.LBB0_12:                               # %while.end
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB0_13:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end0:
	.size	CFICheck, .Lfunc_end0-CFICheck
                                        # -- End function
	.globl	fun                     # -- Begin function fun
	.p2align	4, 0x90
	.type	fun,@function
fun:                                    # @fun
# %bb.0:                                # %entry
	movq	(%rsp), %rcx
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$1, %eax
	popq	%rbp
	cmpq	%rcx, (%rsp)
	jne	.LBB1_1
	retq
.LBB1_1:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end1:
	.size	fun, .Lfunc_end1-fun
                                        # -- End function
	.globl	my_itoa                 # -- Begin function my_itoa
	.p2align	4, 0x90
	.type	my_itoa,@function
my_itoa:                                # @my_itoa
# %bb.0:                                # %entry
	movq	(%rsp), %r8
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -36(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, -16(%rbp)
	cmpl	$0, -4(%rbp)
	jge	.LBB2_2
# %bb.1:                                # %if.then
	xorl	%eax, %eax
	movq	-16(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movb	$45, (%rcx)
	movslq	-4(%rbp), %rcx
	subq	%rcx, %rax
	movl	%eax, -4(%rbp)
.LBB2_2:                                # %if.end
	movq	-16(%rbp), %rax
	movq	%rax, -32(%rbp)
.LBB2_3:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	xorl	%edx, %edx
	divl	-36(%rbp)
	movl	%edx, -20(%rbp)
	movl	-36(%rbp), %ecx
	movl	-4(%rbp), %eax
	xorl	%edx, %edx
	divl	%ecx
	movl	%eax, -4(%rbp)
	cmpl	$9, -20(%rbp)
	jbe	.LBB2_5
# %bb.4:                                # %if.then4
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	-20(%rbp), %eax
	subl	$10, %eax
	addl	$97, %eax
	movq	-16(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movb	%al, (%rcx)
	jmp	.LBB2_6
.LBB2_5:                                # %if.else
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	-20(%rbp), %eax
	addl	$48, %eax
	movq	-16(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movb	%al, (%rcx)
.LBB2_6:                                # %if.end11
                                        #   in Loop: Header=BB2_3 Depth=1
	jmp	.LBB2_7
.LBB2_7:                                # %do.cond
                                        #   in Loop: Header=BB2_3 Depth=1
	cmpl	$0, -4(%rbp)
	jg	.LBB2_3
# %bb.8:                                # %do.end
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	addq	$-1, %rcx
	movq	%rcx, -16(%rbp)
	movb	$32, (%rax)
.LBB2_9:                                # %do.body15
                                        # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movb	(%rax), %al
	movb	%al, -5(%rbp)
	movq	-32(%rbp), %rax
	movb	(%rax), %al
	movq	-16(%rbp), %rcx
	movb	%al, (%rcx)
	movb	-5(%rbp), %al
	movq	-32(%rbp), %rcx
	movb	%al, (%rcx)
	movq	-16(%rbp), %rax
	addq	$-1, %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
# %bb.10:                               # %do.cond18
                                        #   in Loop: Header=BB2_9 Depth=1
	movq	-32(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jb	.LBB2_9
# %bb.11:                               # %do.end21
	movq	-48(%rbp), %rax
	popq	%rbp
	cmpq	%r8, (%rsp)
	jne	.LBB2_12
	retq
.LBB2_12:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end2:
	.size	my_itoa, .Lfunc_end2-my_itoa
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	movabsq	$fun, %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rbx
	movq	%rbx, %rdi
	callq	CFICheck
	callq	*%rbx
	movl	%eax, -20(%rbp)
	leaq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movl	-20(%rbp), %edi
	movq	-16(%rbp), %rsi
	movl	$10, %edx
	callq	my_itoa
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	puts
	movabsq	$.L.str, %rdi
	callq	puts
	xorl	%edi, %edi
	callq	exit
.Lfunc_end3:
	.size	enclave_main, .Lfunc_end3-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"success!"
	.size	.L.str, 9


	.ident	"clang version 9.0.0 "
	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 0df2fb224f009079f2d73c426d3658d32c18af95)"
	.section	".note.GNU-stack","",@progbits
