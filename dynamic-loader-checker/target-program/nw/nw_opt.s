	.text
	.file	"nw"
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
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movq	%rdi, -32(%rbp)
	movabsq	$2305843009213693951, %rax # imm = 0x1FFFFFFFFFFFFFFF
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movq	%rax, -24(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movl	$536870911, -16(%rbp)   # imm = 0x1FFFFFFF
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movl	$0, -12(%rbp)
	movl	-16(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movl	$0, -4(%rbp)
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
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movl	%ecx, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.LBB0_4
# %bb.3:                                # %if.then
	jmp	.LBB0_12
.LBB0_4:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	-32(%rbp), %rax
	jbe	.LBB0_6
# %bb.5:                                # %if.then3
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	subl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
	jmp	.LBB0_10
.LBB0_6:                                # %if.else
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	-32(%rbp), %rax
	jae	.LBB0_8
# %bb.7:                                # %if.then8
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	jmp	.LBB0_9
.LBB0_8:                                # %if.else10
	addq	$32, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB0_14
	retq
.LBB0_9:                                # %if.end11
                                        #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_10
.LBB0_10:                               # %if.end12
                                        #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_1
.LBB0_11:                               # %while.end.loopexit
	jmp	.LBB0_12
.LBB0_12:                               # %while.end
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB0_13:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB0_14:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end0:
	.size	CFICheck, .Lfunc_end0-CFICheck
                                        # -- End function
	.globl	max                     # -- Begin function max
	.p2align	4, 0x90
	.type	max,@function
max:                                    # @max
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%edi, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%esi, -12(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%edx, -8(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movq	%rcx, -24(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	$0, -4(%rbp)
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.LBB1_3
# %bb.1:                                # %land.lhs.true
	movl	-16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.LBB1_3
# %bb.2:                                # %if.then
	movl	-16(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movb	$124, (%rax)
	jmp	.LBB1_7
.LBB1_3:                                # %if.else
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.LBB1_5
# %bb.4:                                # %if.then3
	movl	-12(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movb	$92, (%rax)
	jmp	.LBB1_6
.LBB1_5:                                # %if.else4
	movl	-8(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movb	$45, (%rax)
.LBB1_6:                                # %if.end
	jmp	.LBB1_7
.LBB1_7:                                # %if.end5
	movl	-4(%rbp), %eax
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB1_9
	retq
.LBB1_8:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB1_9:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end1:
	.size	max, .Lfunc_end1-max
                                        # -- End function
	.globl	dpm_init                # -- Begin function dpm_init
	.p2align	4, 0x90
	.type	dpm_init,@function
dpm_init:                               # @dpm_init
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movq	%rdi, -32(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movq	%rsi, -24(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	%edx, -40(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	%ecx, -36(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	%r8d, -12(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	$0, (%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movb	$110, (%rax)
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	$0, -8(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	$0, -4(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	$1, -4(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jg	.LBB2_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	xorl	%eax, %eax
	subl	-4(%rbp), %eax
	imull	-12(%rbp), %eax
	movq	-32(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-4(%rbp), %rdx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,4), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	%eax, (%rcx,%rdx,4)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movslq	-4(%rbp), %rcx
	pushq	%rbx
	pushq	%rax
	leaq	(%rax,%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movb	$45, (%rax,%rcx)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	jmp	.LBB2_1
.LBB2_4:                                # %for.end
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	$1, -8(%rbp)
.LBB2_5:                                # %for.cond9
                                        # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jg	.LBB2_8
# %bb.6:                                # %for.body11
                                        #   in Loop: Header=BB2_5 Depth=1
	xorl	%eax, %eax
	subl	-8(%rbp), %eax
	imull	-12(%rbp), %eax
	movq	-32(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	%eax, (%rcx)
	movq	-24(%rbp), %rax
	movslq	-8(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movb	$124, (%rax)
# %bb.7:                                # %for.inc20
                                        #   in Loop: Header=BB2_5 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
	jmp	.LBB2_5
.LBB2_8:                                # %for.end22
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB2_10
	retq
.LBB2_9:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB2_10:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end2:
	.size	dpm_init, .Lfunc_end2-dpm_init
                                        # -- End function
	.globl	my_strlen               # -- Begin function my_strlen
	.p2align	4, 0x90
	.type	my_strlen,@function
my_strlen:                              # @my_strlen
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_5
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_5
	popq	%rax
	popq	%rbx
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_5
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_5
	popq	%rax
	popq	%rbx
	movq	%rax, -8(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB3_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_3
.LBB3_3:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	-8(%rbp), %rax
	addq	$1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_5
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_5
	popq	%rax
	popq	%rbx
	movq	%rax, -8(%rbp)
	jmp	.LBB3_1
.LBB3_4:                                # %for.end
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rcx
	subq	%rcx, %rax
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB3_6
	retq
.LBB3_5:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB3_6:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end3:
	.size	my_strlen, .Lfunc_end3-my_strlen
                                        # -- End function
	.globl	print_matrix            # -- Begin function print_matrix
	.p2align	4, 0x90
	.type	print_matrix,@function
print_matrix:                           # @print_matrix
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	-48(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movq	%rdi, -48(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movq	%rsi, -40(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movq	%rdx, -32(%rbp)
	movq	-40(%rbp), %rdi
	callq	my_strlen
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	%eax, -16(%rbp)
	movq	-32(%rbp), %rdi
	callq	my_strlen
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	%eax, -20(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	$0, -12(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB4_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_3
.LBB4_3:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	jmp	.LBB4_1
.LBB4_4:                                # %for.end
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	$0, -4(%rbp)
.LBB4_5:                                # %for.cond4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_9 Depth 2
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.LBB4_14
# %bb.6:                                # %for.body7
                                        #   in Loop: Header=BB4_5 Depth=1
	cmpl	$0, -4(%rbp)
	jle	.LBB4_8
# %bb.7:                                # %if.then
                                        #   in Loop: Header=BB4_5 Depth=1
	jmp	.LBB4_8
.LBB4_8:                                # %if.end
                                        #   in Loop: Header=BB4_5 Depth=1
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	$0, -8(%rbp)
.LBB4_9:                                # %for.cond11
                                        #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB4_12
# %bb.10:                               # %for.body14
                                        #   in Loop: Header=BB4_9 Depth=2
	jmp	.LBB4_11
.LBB4_11:                               # %for.inc15
                                        #   in Loop: Header=BB4_9 Depth=2
	movl	-8(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
	jmp	.LBB4_9
.LBB4_12:                               # %for.end17
                                        #   in Loop: Header=BB4_5 Depth=1
	jmp	.LBB4_13
.LBB4_13:                               # %for.inc18
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	jmp	.LBB4_5
.LBB4_14:                               # %for.end20
	addq	$48, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB4_16
	retq
.LBB4_15:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB4_16:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end4:
	.size	print_matrix, .Lfunc_end4-print_matrix
                                        # -- End function
	.globl	print_traceback         # -- Begin function print_traceback
	.p2align	4, 0x90
	.type	print_traceback,@function
print_traceback:                        # @print_traceback
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	-48(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movq	%rdi, -48(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movq	%rsi, -40(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movq	%rdx, -32(%rbp)
	movq	-40(%rbp), %rdi
	callq	my_strlen
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	%eax, -16(%rbp)
	movq	-32(%rbp), %rdi
	callq	my_strlen
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	%eax, -20(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	$0, -12(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB5_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_3
.LBB5_3:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	jmp	.LBB5_1
.LBB5_4:                                # %for.end
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	$0, -4(%rbp)
.LBB5_5:                                # %for.cond4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_9 Depth 2
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.LBB5_14
# %bb.6:                                # %for.body7
                                        #   in Loop: Header=BB5_5 Depth=1
	cmpl	$0, -4(%rbp)
	jle	.LBB5_8
# %bb.7:                                # %if.then
                                        #   in Loop: Header=BB5_5 Depth=1
	jmp	.LBB5_8
.LBB5_8:                                # %if.end
                                        #   in Loop: Header=BB5_5 Depth=1
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	$0, -8(%rbp)
.LBB5_9:                                # %for.cond11
                                        #   Parent Loop BB5_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB5_12
# %bb.10:                               # %for.body14
                                        #   in Loop: Header=BB5_9 Depth=2
	jmp	.LBB5_11
.LBB5_11:                               # %for.inc15
                                        #   in Loop: Header=BB5_9 Depth=2
	movl	-8(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
	jmp	.LBB5_9
.LBB5_12:                               # %for.end17
                                        #   in Loop: Header=BB5_5 Depth=1
	jmp	.LBB5_13
.LBB5_13:                               # %for.inc18
                                        #   in Loop: Header=BB5_5 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	jmp	.LBB5_5
.LBB5_14:                               # %for.end20
	addq	$48, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB5_16
	retq
.LBB5_15:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB5_16:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end5:
	.size	print_traceback, .Lfunc_end5-print_traceback
                                        # -- End function
	.globl	strrev                  # -- Begin function strrev
	.p2align	4, 0x90
	.type	strrev,@function
strrev:                                 # @strrev
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movq	%rdi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.LBB6_2
# %bb.1:                                # %lor.lhs.false
	movq	-16(%rbp), %rax
	cmpb	$0, (%rax)
	jne	.LBB6_3
.LBB6_2:                                # %if.then
	movq	-16(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movq	%rax, -40(%rbp)
	jmp	.LBB6_8
.LBB6_3:                                # %if.end
	movq	-16(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rbx
	movq	-16(%rbp), %rdi
	callq	my_strlen
	addq	%rax, %rbx
	addq	$-1, %rbx
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movq	%rbx, -24(%rbp)
.LBB6_4:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jbe	.LBB6_7
# %bb.5:                                # %for.body
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	-24(%rbp), %rax
	movsbl	(%rax), %eax
	movq	-32(%rbp), %rcx
	movsbl	(%rcx), %edx
	xorl	%eax, %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movb	%dl, (%rcx)
	movq	-32(%rbp), %rax
	movsbl	(%rax), %eax
	movq	-24(%rbp), %rcx
	movsbl	(%rcx), %edx
	xorl	%eax, %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movb	%dl, (%rcx)
	movq	-24(%rbp), %rax
	movsbl	(%rax), %eax
	movq	-32(%rbp), %rcx
	movsbl	(%rcx), %edx
	xorl	%eax, %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movb	%dl, (%rcx)
# %bb.6:                                # %for.inc
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	addq	$-1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movq	%rax, -24(%rbp)
	jmp	.LBB6_4
.LBB6_7:                                # %for.end
	movq	-16(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movq	%rax, -40(%rbp)
.LBB6_8:                                # %return
	movq	-40(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB6_10
	retq
.LBB6_9:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB6_10:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end6:
	.size	strrev, .Lfunc_end6-strrev
                                        # -- End function
	.globl	strncat                 # -- Begin function strncat
	.p2align	4, 0x90
	.type	strncat,@function
strncat:                                # @strncat
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movq	%rdi, -32(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movq	%rsi, -40(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movq	%rdx, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.LBB7_11
# %bb.1:                                # %if.then
	movq	-32(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movq	%rax, -24(%rbp)
.LBB7_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	movsbl	(%rax), %eax
	cmpl	$0, %eax
	je	.LBB7_4
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB7_2 Depth=1
	movq	-8(%rbp), %rax
	addq	$1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movq	%rax, -8(%rbp)
	jmp	.LBB7_2
.LBB7_4:                                # %while.end
	jmp	.LBB7_5
.LBB7_5:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movq	%rcx, -24(%rbp)
	movb	(%rax), %al
	movq	-8(%rbp), %rcx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movb	%al, (%rcx)
	movsbl	%al, %eax
	cmpl	$0, %eax
	jne	.LBB7_7
# %bb.6:                                # %if.then7
	jmp	.LBB7_10
.LBB7_7:                                # %if.end
                                        #   in Loop: Header=BB7_5 Depth=1
	movq	-8(%rbp), %rax
	addq	$1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movq	%rax, -8(%rbp)
# %bb.8:                                # %do.cond
                                        #   in Loop: Header=BB7_5 Depth=1
	movq	-16(%rbp), %rax
	addq	$-1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movq	%rax, -16(%rbp)
	cmpq	$0, %rax
	jne	.LBB7_5
# %bb.9:                                # %do.end.loopexit
	jmp	.LBB7_10
.LBB7_10:                               # %do.end
	movq	-8(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_12
	popq	%rax
	popq	%rbx
	movb	$0, (%rax)
.LBB7_11:                               # %if.end11
	movq	-32(%rbp), %rax
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB7_13
	retq
.LBB7_12:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB7_13:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end7:
	.size	strncat, .Lfunc_end7-strncat
                                        # -- End function
	.globl	nw_align                # -- Begin function nw_align
	.p2align	4, 0x90
	.type	nw_align,@function
nw_align:                               # @nw_align
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$192, %rsp
	movl	16(%rbp), %eax
	movabsq	$.L__const.nw_align.s, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-72(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rdi, -72(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-104(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rsi, -104(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-64(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rdx, -64(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-56(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rcx, -56(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-48(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%r8, -48(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%r9, -40(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -28(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -24(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -20(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -12(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -8(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-112(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$2, -112(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-108(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$-1, -108(%rbp)
	leaq	-192(%rbp), %rdi
	movq	%rax, %rsi
	movl	$64, %edx
	callq	memcpy
	movq	-64(%rbp), %rdi
	callq	my_strlen
	pushq	%rbx
	pushq	%rax
	leaq	-80(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -80(%rbp)
	movq	-56(%rbp), %rdi
	callq	my_strlen
	pushq	%rbx
	pushq	%rax
	leaq	-76(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -76(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$1, -12(%rbp)
.LBB8_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_3 Depth 2
	movl	-12(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jg	.LBB8_20
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB8_1 Depth=1
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$1, -8(%rbp)
.LBB8_3:                                # %for.cond4
                                        #   Parent Loop BB8_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-8(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jg	.LBB8_18
# %bb.4:                                # %for.body7
                                        #   in Loop: Header=BB8_3 Depth=2
	movq	-64(%rbp), %rax
	movl	-8(%rbp), %ecx
	addl	$-1, %ecx
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %al
	pushq	%rbx
	pushq	%rax
	leaq	-13(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%al, -13(%rbp)
	movsbl	-13(%rbp), %eax
	addl	$-65, %eax
	movl	%eax, %ecx
	subl	$19, %ecx
	ja	.LBB8_10
# %bb.5:                                # %for.body7
                                        #   in Loop: Header=BB8_3 Depth=2
	movq	.LJTI8_0(,%rax,8), %rax
	jmpq	*%rax
.LBB8_6:                                # %sw.bb
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -24(%rbp)
	jmp	.LBB8_10
.LBB8_7:                                # %sw.bb9
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$1, -24(%rbp)
	jmp	.LBB8_10
.LBB8_8:                                # %sw.bb10
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$2, -24(%rbp)
	jmp	.LBB8_10
.LBB8_9:                                # %sw.bb11
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$3, -24(%rbp)
.LBB8_10:                               # %sw.epilog
                                        #   in Loop: Header=BB8_3 Depth=2
	movq	-56(%rbp), %rax
	movl	-12(%rbp), %ecx
	addl	$-1, %ecx
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %al
	pushq	%rbx
	pushq	%rax
	leaq	-13(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%al, -13(%rbp)
	movsbl	-13(%rbp), %eax
	addl	$-65, %eax
	movl	%eax, %ecx
	subl	$19, %ecx
	ja	.LBB8_16
# %bb.11:                               # %sw.epilog
                                        #   in Loop: Header=BB8_3 Depth=2
	movq	.LJTI8_1(,%rax,8), %rax
	jmpq	*%rax
.LBB8_12:                               # %sw.bb16
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -20(%rbp)
	jmp	.LBB8_16
.LBB8_13:                               # %sw.bb17
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$1, -20(%rbp)
	jmp	.LBB8_16
.LBB8_14:                               # %sw.bb18
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$2, -20(%rbp)
	jmp	.LBB8_16
.LBB8_15:                               # %sw.bb19
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$3, -20(%rbp)
.LBB8_16:                               # %sw.epilog20
                                        #   in Loop: Header=BB8_3 Depth=2
	movq	-72(%rbp), %rax
	movl	-12(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-8(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	subl	16(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-92(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -92(%rbp)
	movq	-72(%rbp), %rax
	movl	-12(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	-8(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movslq	-24(%rbp), %rcx
	shlq	$4, %rcx
	leaq	-192(%rbp), %rdx
	addq	%rcx, %rdx
	movslq	-20(%rbp), %rcx
	addl	(%rdx,%rcx,4), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-88(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -88(%rbp)
	movq	-72(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movl	-8(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	subl	16(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-84(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -84(%rbp)
	movl	-92(%rbp), %edi
	movl	-88(%rbp), %esi
	movl	-84(%rbp), %edx
	leaq	-14(%rbp), %rcx
	callq	max
	movq	-72(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	movslq	-8(%rbp), %rdx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,4), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, (%rcx,%rdx,4)
	movb	-14(%rbp), %al
	movq	-104(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	movslq	-8(%rbp), %rdx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%al, (%rcx,%rdx)
# %bb.17:                               # %for.inc
                                        #   in Loop: Header=BB8_3 Depth=2
	movl	-8(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
	jmp	.LBB8_3
.LBB8_18:                               # %for.end
                                        #   in Loop: Header=BB8_1 Depth=1
	jmp	.LBB8_19
.LBB8_19:                               # %for.inc52
                                        #   in Loop: Header=BB8_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	jmp	.LBB8_1
.LBB8_20:                               # %for.end54
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
.LBB8_21:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, -12(%rbp)
	movb	$1, %al
	jg	.LBB8_23
# %bb.22:                               # %lor.rhs
                                        #   in Loop: Header=BB8_21 Depth=1
	cmpl	$0, -8(%rbp)
	setg	%al
.LBB8_23:                               # %lor.end
                                        #   in Loop: Header=BB8_21 Depth=1
	testb	$1, %al
	jne	.LBB8_24
	jmp	.LBB8_31
.LBB8_24:                               # %while.body
                                        #   in Loop: Header=BB8_21 Depth=1
	movq	-104(%rbp), %rax
	movslq	-12(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-8(%rbp), %rcx
	movsbl	(%rax,%rcx), %eax
	movl	%eax, %ecx
	subl	$45, %ecx
	je	.LBB8_29
	jmp	.LBB8_25
.LBB8_25:                               # %while.body
                                        #   in Loop: Header=BB8_21 Depth=1
	movl	%eax, %ecx
	subl	$92, %ecx
	je	.LBB8_28
	jmp	.LBB8_26
.LBB8_26:                               # %while.body
                                        #   in Loop: Header=BB8_21 Depth=1
	subl	$124, %eax
	jne	.LBB8_30
	jmp	.LBB8_27
.LBB8_27:                               # %sw.bb65
                                        #   in Loop: Header=BB8_21 Depth=1
	movq	-48(%rbp), %rdi
	movabsq	$.L.str, %rsi
	movl	$1, %edx
	callq	strncat
	leaq	-2(%rbp), %rsi
	movq	-56(%rbp), %rax
	movl	-12(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %al
	pushq	%rbx
	pushq	%rax
	leaq	-2(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%al, -2(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-1(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	$0, -1(%rbp)
	movq	-40(%rbp), %rdi
	movl	$1, %edx
	callq	strncat
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	jmp	.LBB8_30
.LBB8_28:                               # %sw.bb74
                                        #   in Loop: Header=BB8_21 Depth=1
	leaq	-2(%rbp), %rsi
	movq	-64(%rbp), %rax
	movl	-8(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %al
	pushq	%rbx
	pushq	%rax
	leaq	-2(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%al, -2(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-1(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	$0, -1(%rbp)
	movq	-48(%rbp), %rdi
	movl	$1, %edx
	callq	strncat
	leaq	-2(%rbp), %rsi
	movq	-56(%rbp), %rax
	movl	-12(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %al
	pushq	%rbx
	pushq	%rax
	leaq	-2(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%al, -2(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-1(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	$0, -1(%rbp)
	movq	-40(%rbp), %rdi
	movl	$1, %edx
	callq	strncat
	movl	-12(%rbp), %eax
	addl	$-1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	addl	$-1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
	jmp	.LBB8_30
.LBB8_29:                               # %sw.bb91
                                        #   in Loop: Header=BB8_21 Depth=1
	leaq	-2(%rbp), %rsi
	movq	-64(%rbp), %rax
	movl	-8(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rcx
	movb	(%rax,%rcx), %al
	pushq	%rbx
	pushq	%rax
	leaq	-2(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%al, -2(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-1(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	$0, -1(%rbp)
	movq	-48(%rbp), %rdi
	movl	$1, %edx
	callq	strncat
	movq	-40(%rbp), %rdi
	movabsq	$.L.str, %rsi
	movl	$1, %edx
	callq	strncat
	movl	-8(%rbp), %eax
	addl	$-1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
.LBB8_30:                               # %sw.epilog101
                                        #   in Loop: Header=BB8_21 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -28(%rbp)
	jmp	.LBB8_21
.LBB8_31:                               # %while.end
	movq	-48(%rbp), %rdi
	callq	strrev
	pushq	%rbx
	pushq	%rax
	leaq	-128(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rax, -128(%rbp)
	movq	-40(%rbp), %rdi
	callq	strrev
	pushq	%rbx
	pushq	%rax
	leaq	-120(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rax, -120(%rbp)
	xorl	%eax, %eax
	addq	$192, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB8_33
	retq
.LBB8_32:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB8_33:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end8:
	.size	nw_align, .Lfunc_end8-nw_align
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI8_0:
	.quad	.LBB8_6
	.quad	.LBB8_10
	.quad	.LBB8_7
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_8
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_10
	.quad	.LBB8_9
.LJTI8_1:
	.quad	.LBB8_12
	.quad	.LBB8_16
	.quad	.LBB8_13
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_14
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_16
	.quad	.LBB8_15
                                        # -- End function
	.text
	.globl	Ecall_nw                # -- Begin function Ecall_nw
	.p2align	4, 0x90
	.type	Ecall_nw,@function
Ecall_nw:                               # @Ecall_nw
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	-56(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rdi, -56(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-48(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rsi, -48(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-80(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rdx, -80(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-72(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rcx, -72(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	$2, -20(%rbp)
	movq	-56(%rbp), %rdi
	callq	my_strlen
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, -16(%rbp)
	movq	-48(%rbp), %rdi
	callq	my_strlen
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdi
	shlq	$3, %rdi
	callq	malloc
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rax, -40(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	$0, -12(%rbp)
.LBB9_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.LBB9_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB9_1 Depth=1
	movslq	-16(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movq	-40(%rbp), %rcx
	movslq	-12(%rbp), %rdx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB9_1 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	jmp	.LBB9_1
.LBB9_4:                                # %for.end
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdi
	shlq	$3, %rdi
	callq	malloc
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	$0, -8(%rbp)
.LBB9_5:                                # %for.cond14
                                        # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.LBB9_8
# %bb.6:                                # %for.body17
                                        #   in Loop: Header=BB9_5 Depth=1
	movslq	-16(%rbp), %rdi
	shlq	$0, %rdi
	callq	malloc
	movq	-32(%rbp), %rcx
	movslq	-8(%rbp), %rdx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
# %bb.7:                                # %for.inc23
                                        #   in Loop: Header=BB9_5 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
	jmp	.LBB9_5
.LBB9_8:                                # %for.end25
	movq	-40(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movl	-16(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	-20(%rbp), %r8d
	callq	dpm_init
	movq	-80(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movb	$0, (%rax)
	movq	-72(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movb	$0, (%rax)
	movq	-40(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-80(%rbp), %r8
	movq	-72(%rbp), %r9
	movl	-20(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, (%rsp)
	callq	nw_align
	pushq	%rbx
	pushq	%rax
	leaq	-60(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, -60(%rbp)
	cmpl	$0, -60(%rbp)
	jne	.LBB9_10
# %bb.9:                                # %if.then
	movq	-40(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rdx
	callq	print_matrix
	movq	-32(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rdx
	callq	print_traceback
.LBB9_10:                               # %if.end
	addq	$96, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB9_12
	retq
.LBB9_11:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB9_12:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end9:
	.size	Ecall_nw, .Lfunc_end9-Ecall_nw
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$144, %rsp
	movq	.L__const.enclave_main.seq_1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-9(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB10_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB10_1
	popq	%rax
	popq	%rbx
	movq	%rax, -9(%rbp)
	movb	.L__const.enclave_main.seq_1+8, %al
	pushq	%rbx
	pushq	%rax
	leaq	-1(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB10_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB10_1
	popq	%rax
	popq	%rbx
	movb	%al, -1(%rbp)
	movq	.L__const.enclave_main.seq_2, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-17(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB10_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB10_1
	popq	%rax
	popq	%rbx
	movq	%rax, -17(%rbp)
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	puts
	leaq	-80(%rbp), %rcx
	leaq	-144(%rbp), %rdx
	leaq	-17(%rbp), %rsi
	leaq	-9(%rbp), %rdi
	callq	Ecall_nw
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	puts
	xorl	%edi, %edi
	callq	exit
.LBB10_1:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end10:
	.size	enclave_main, .Lfunc_end10-enclave_main
                                        # -- End function
	.type	.L__const.nw_align.s,@object # @__const.nw_align.s
	.section	.rodata,"a",@progbits
	.p2align	4
.L__const.nw_align.s:
	.long	2                       # 0x2
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	2                       # 0x2
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	2                       # 0x2
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	4294967295              # 0xffffffff
	.long	2                       # 0x2
	.size	.L__const.nw_align.s, 64

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"-"
	.size	.L.str, 2

	.type	.L__const.enclave_main.seq_1,@object # @__const.enclave_main.seq_1
.L__const.enclave_main.seq_1:
	.asciz	"AGTACGTC"
	.size	.L__const.enclave_main.seq_1, 9

	.type	.L__const.enclave_main.seq_2,@object # @__const.enclave_main.seq_2
.L__const.enclave_main.seq_2:
	.asciz	"ACGTCGT"
	.size	.L__const.enclave_main.seq_2, 8

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"running NW algorithm..."
	.size	.L.str.1, 24

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"exiting..."
	.size	.L.str.2, 11


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 3a49d86ed12106d3767eefb5ff6d90f98867f42f)"
	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 3a49d86ed12106d3767eefb5ff6d90f98867f42f)"
	.section	".note.GNU-stack","",@progbits
