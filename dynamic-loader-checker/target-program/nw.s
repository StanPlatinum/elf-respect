	.text
	.file	"nw.c"
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
	subq	$48, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movq	%rdi, -8(%rbp)
	movabsq	$2305843009213693951, %rax # imm = 0x1FFFFFFFFFFFFFFF
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movq	%rax, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	$536870911, -20(%rbp)   # imm = 0x1FFFFFFF
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	$0, -24(%rbp)
	movl	-20(%rbp), %ecx
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%ecx, -28(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	$0, -32(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.LBB0_2
# %bb.1:                                # %if.then
	jmp	.LBB0_14
.LBB0_2:                                # %if.end
	jmp	.LBB0_3
.LBB0_3:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jg	.LBB0_13
# %bb.4:                                # %while.body
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	-24(%rbp), %eax
	movl	-28(%rbp), %ecx
	subl	-24(%rbp), %ecx
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%eax, -36(%rbp)         # 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	$2, %ecx
	idivl	%ecx
	movl	-36(%rbp), %ecx         # 4-byte Reload
	addl	%eax, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%ecx, -32(%rbp)
	movl	-32(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jle	.LBB0_6
# %bb.5:                                # %if.then3
	jmp	.LBB0_13
.LBB0_6:                                # %if.end4
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	-8(%rbp), %rax
	jbe	.LBB0_8
# %bb.7:                                # %if.then6
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	-32(%rbp), %eax
	subl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%eax, -28(%rbp)
	jmp	.LBB0_12
.LBB0_8:                                # %if.else
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	-16(%rbp), %rax
	movslq	-32(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	-8(%rbp), %rax
	jae	.LBB0_10
# %bb.9:                                # %if.then11
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%eax, -24(%rbp)
	jmp	.LBB0_11
.LBB0_10:                               # %if.else13
	jmp	.LBB0_14
.LBB0_11:                               # %if.end14
                                        #   in Loop: Header=BB0_3 Depth=1
	jmp	.LBB0_12
.LBB0_12:                               # %if.end15
                                        #   in Loop: Header=BB0_3 Depth=1
	jmp	.LBB0_3
.LBB0_13:                               # %while.end
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit@PLT
.LBB0_14:                               # %return
	addq	$48, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB0_16
	retq
.LBB0_15:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB0_16:
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
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%edi, -4(%rbp)
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
	movl	%esi, -8(%rbp)
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
	movl	%edx, -12(%rbp)
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
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	$0, -28(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.LBB1_3
# %bb.1:                                # %land.lhs.true
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.LBB1_3
# %bb.2:                                # %if.then
	movl	-4(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rcx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movb	$124, (%rcx)
	jmp	.LBB1_7
.LBB1_3:                                # %if.else
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.LBB1_5
# %bb.4:                                # %if.then3
	movl	-8(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rcx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movb	$92, (%rcx)
	jmp	.LBB1_6
.LBB1_5:                                # %if.else4
	movl	-12(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rcx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_8
	popq	%rax
	popq	%rbx
	movb	$45, (%rcx)
.LBB1_6:                                # %if.end
	jmp	.LBB1_7
.LBB1_7:                                # %if.end5
	movl	-28(%rbp), %eax
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
	subq	$48, %rsp
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
	movq	%rdi, -8(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movq	%rsi, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	%edx, -20(%rbp)
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
	movl	%ecx, -24(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movl	%r8d, -28(%rbp)
	movq	-8(%rbp), %rax
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
	movq	-16(%rbp), %rax
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
	leaq	.L.str(%rip), %rdi
	callq	puts@PLT
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
	movl	$0, -32(%rbp)
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
	movl	$0, -36(%rbp)
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
	movl	$1, -36(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.LBB2_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	xorl	%eax, %eax
	subl	-36(%rbp), %eax
	imull	-28(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-36(%rbp), %rdx
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
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-36(%rbp), %rdx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_9
	popq	%rax
	popq	%rbx
	movb	$45, (%rcx,%rdx)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
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
	movl	%eax, -36(%rbp)
	jmp	.LBB2_1
.LBB2_4:                                # %for.end
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
	movl	$1, -32(%rbp)
.LBB2_5:                                # %for.cond9
                                        # =>This Inner Loop Header: Depth=1
	movl	-32(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.LBB2_8
# %bb.6:                                # %for.body11
                                        #   in Loop: Header=BB2_5 Depth=1
	xorl	%eax, %eax
	subl	-32(%rbp), %eax
	imull	-28(%rbp), %eax
	movq	-8(%rbp), %rcx
	movslq	-32(%rbp), %rdx
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
	movq	-16(%rbp), %rcx
	movslq	-32(%rbp), %rdx
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
	movb	$124, (%rcx)
# %bb.7:                                # %for.inc20
                                        #   in Loop: Header=BB2_5 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
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
	movl	%eax, -32(%rbp)
	jmp	.LBB2_5
.LBB2_8:                                # %for.end22
	addq	$48, %rsp
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
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_5
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_5
	popq	%rax
	popq	%rbx
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
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
	movq	%rax, -16(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB3_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_3
.LBB3_3:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	-16(%rbp), %rax
	addq	$1, %rax
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
	movq	%rax, -16(%rbp)
	jmp	.LBB3_1
.LBB3_4:                                # %for.end
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
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
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movq	%rdi, -8(%rbp)
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
	movq	%rsi, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	my_strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rdi
	callq	my_strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
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
	movl	%eax, -32(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	$0, -36(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB4_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_3
.LBB4_3:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	%eax, -36(%rbp)
	jmp	.LBB4_1
.LBB4_4:                                # %for.end
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
	movl	$0, -40(%rbp)
.LBB4_5:                                # %for.cond4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_9 Depth 2
	movl	-40(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jg	.LBB4_14
# %bb.6:                                # %for.body7
                                        #   in Loop: Header=BB4_5 Depth=1
	cmpl	$0, -40(%rbp)
	jle	.LBB4_8
# %bb.7:                                # %if.then
                                        #   in Loop: Header=BB4_5 Depth=1
	jmp	.LBB4_8
.LBB4_8:                                # %if.end
                                        #   in Loop: Header=BB4_5 Depth=1
	pushq	%rbx
	pushq	%rax
	leaq	-44(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	$0, -44(%rbp)
.LBB4_9:                                # %for.cond11
                                        #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-44(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jg	.LBB4_12
# %bb.10:                               # %for.body14
                                        #   in Loop: Header=BB4_9 Depth=2
	jmp	.LBB4_11
.LBB4_11:                               # %for.inc15
                                        #   in Loop: Header=BB4_9 Depth=2
	movl	-44(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-44(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_15
	popq	%rax
	popq	%rbx
	movl	%eax, -44(%rbp)
	jmp	.LBB4_9
.LBB4_12:                               # %for.end17
                                        #   in Loop: Header=BB4_5 Depth=1
	jmp	.LBB4_13
.LBB4_13:                               # %for.inc18
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
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
	movl	%eax, -40(%rbp)
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
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movq	%rdi, -8(%rbp)
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
	movq	%rsi, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	my_strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
	pushq	%rbx
	pushq	%rax
	leaq	-28(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rdi
	callq	my_strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
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
	movl	%eax, -32(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	$0, -36(%rbp)
.LBB5_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB5_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB5_1 Depth=1
	jmp	.LBB5_3
.LBB5_3:                                # %for.inc
                                        #   in Loop: Header=BB5_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	%eax, -36(%rbp)
	jmp	.LBB5_1
.LBB5_4:                                # %for.end
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
	movl	$0, -40(%rbp)
.LBB5_5:                                # %for.cond4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_9 Depth 2
	movl	-40(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jg	.LBB5_14
# %bb.6:                                # %for.body7
                                        #   in Loop: Header=BB5_5 Depth=1
	cmpl	$0, -40(%rbp)
	jle	.LBB5_8
# %bb.7:                                # %if.then
                                        #   in Loop: Header=BB5_5 Depth=1
	jmp	.LBB5_8
.LBB5_8:                                # %if.end
                                        #   in Loop: Header=BB5_5 Depth=1
	pushq	%rbx
	pushq	%rax
	leaq	-44(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	$0, -44(%rbp)
.LBB5_9:                                # %for.cond11
                                        #   Parent Loop BB5_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-44(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jg	.LBB5_12
# %bb.10:                               # %for.body14
                                        #   in Loop: Header=BB5_9 Depth=2
	jmp	.LBB5_11
.LBB5_11:                               # %for.inc15
                                        #   in Loop: Header=BB5_9 Depth=2
	movl	-44(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-44(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB5_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB5_15
	popq	%rax
	popq	%rbx
	movl	%eax, -44(%rbp)
	jmp	.LBB5_9
.LBB5_12:                               # %for.end17
                                        #   in Loop: Header=BB5_5 Depth=1
	jmp	.LBB5_13
.LBB5_13:                               # %for.inc18
                                        #   in Loop: Header=BB5_5 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
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
	movl	%eax, -40(%rbp)
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
	.globl	my_strrev               # -- Begin function my_strrev
	.p2align	4, 0x90
	.type	my_strrev,@function
my_strrev:                              # @my_strrev
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
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movq	%rax, -8(%rbp)
	jmp	.LBB6_8
.LBB6_3:                                # %if.end
	movq	-16(%rbp), %rax
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
	movq	-16(%rbp), %rax
	movq	-16(%rbp), %rdi
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
	movq	%rax, -40(%rbp)         # 8-byte Spill
	callq	my_strlen@PLT
	movq	-40(%rbp), %rcx         # 8-byte Reload
	addq	%rax, %rcx
	addq	$-1, %rcx
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
	movq	%rcx, -32(%rbp)
.LBB6_4:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jbe	.LBB6_7
# %bb.5:                                # %for.body
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movsbl	(%rax), %edx
	xorl	%ecx, %edx
                                        # kill: def $dl killed $dl killed $edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movb	%dl, (%rax)
	movq	-24(%rbp), %rax
	movsbl	(%rax), %ecx
	movq	-32(%rbp), %rax
	movsbl	(%rax), %esi
	xorl	%ecx, %esi
                                        # kill: def $sil killed $sil killed $esi
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movb	%sil, (%rax)
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movsbl	(%rax), %edi
	xorl	%ecx, %edi
                                        # kill: def $dil killed $dil killed $edi
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movb	%dil, (%rax)
# %bb.6:                                # %for.inc
                                        #   in Loop: Header=BB6_4 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
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
	movq	-32(%rbp), %rax
	addq	$-1, %rax
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
	jmp	.LBB6_4
.LBB6_7:                                # %for.end
	movq	-16(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB6_9
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB6_9
	popq	%rax
	popq	%rbx
	movq	%rax, -8(%rbp)
.LBB6_8:                                # %return
	movq	-8(%rbp), %rax
	addq	$48, %rsp
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
	.size	my_strrev, .Lfunc_end6-my_strrev
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
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movq	%rdi, -8(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movq	%rsi, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movq	%rdx, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB7_10
# %bb.1:                                # %if.then
	movq	-8(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movq	%rax, -40(%rbp)
.LBB7_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	je	.LBB7_4
# %bb.3:                                # %while.body
                                        #   in Loop: Header=BB7_2 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	jmp	.LBB7_2
.LBB7_4:                                # %while.end
	jmp	.LBB7_5
.LBB7_5:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movq	%rcx, -40(%rbp)
	movb	(%rax), %dl
	movq	-32(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movb	%dl, (%rax)
	movsbl	%dl, %esi
	cmpl	$0, %esi
	jne	.LBB7_7
# %bb.6:                                # %if.then7
	jmp	.LBB7_9
.LBB7_7:                                # %if.end
                                        #   in Loop: Header=BB7_5 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
# %bb.8:                                # %do.cond
                                        #   in Loop: Header=BB7_5 Depth=1
	movq	-24(%rbp), %rax
	addq	$-1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movq	%rax, -24(%rbp)
	cmpq	$0, %rax
	jne	.LBB7_5
.LBB7_9:                                # %do.end
	movq	-32(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB7_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB7_11
	popq	%rax
	popq	%rbx
	movb	$0, (%rax)
.LBB7_10:                               # %if.end11
	movq	-8(%rbp), %rax
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB7_12
	retq
.LBB7_11:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB7_12:
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
	subq	$256, %rsp              # imm = 0x100
	movl	16(%rbp), %eax
	leaq	.L__const.nw_align.s(%rip), %r10
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
	movq	%rdi, -8(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rsi, -16(%rbp)
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
	movq	%rdx, -24(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rcx, -32(%rbp)
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
	movq	%r8, -40(%rbp)
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
	movq	%r9, -48(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-52(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -52(%rbp)
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
	movl	$0, -56(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-60(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -60(%rbp)
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
	movl	$0, -80(%rbp)
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
	movl	$0, -84(%rbp)
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
	movl	$2, -88(%rbp)
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
	movl	$-1, -92(%rbp)
	leaq	-160(%rbp), %rcx
	movq	%rcx, %rdi
	movq	%r10, %rsi
	movl	$64, %edx
	pushq	%rbx
	pushq	%rax
	leaq	-196(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -196(%rbp)        # 4-byte Spill
	callq	memcpy@PLT
	movq	-24(%rbp), %rdi
	callq	my_strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
	pushq	%rbx
	pushq	%rax
	leaq	-164(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -164(%rbp)
	movq	-32(%rbp), %rdi
	callq	my_strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
	pushq	%rbx
	pushq	%rax
	leaq	-168(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -168(%rbp)
	leaq	.L.str.1(%rip), %rdi
	callq	puts@PLT
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
	movl	$1, -80(%rbp)
.LBB8_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB8_3 Depth 2
	movl	-80(%rbp), %eax
	cmpl	-168(%rbp), %eax
	jg	.LBB8_18
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB8_1 Depth=1
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
	movl	$1, -84(%rbp)
.LBB8_3:                                # %for.cond5
                                        #   Parent Loop BB8_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-84(%rbp), %eax
	cmpl	-164(%rbp), %eax
	jg	.LBB8_16
# %bb.4:                                # %for.body8
                                        #   in Loop: Header=BB8_3 Depth=2
	movq	-24(%rbp), %rax
	movl	-84(%rbp), %ecx
	addl	$-1, %ecx
	movslq	%ecx, %rdx
	movb	(%rax,%rdx), %sil
	pushq	%rbx
	pushq	%rax
	leaq	-74(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%sil, -74(%rbp)
	movsbl	-74(%rbp), %ecx
	addl	$-65, %ecx
	movl	%ecx, %eax
	subl	$19, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	-208(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rax, -208(%rbp)        # 8-byte Spill
	ja	.LBB8_9
# %bb.30:                               # %for.body8
                                        #   in Loop: Header=BB8_3 Depth=2
	leaq	.LJTI8_0(%rip), %rax
	movq	-208(%rbp), %rcx        # 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
.LBB8_5:                                # %sw.bb
                                        #   in Loop: Header=BB8_3 Depth=2
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
	movl	$0, -56(%rbp)
	jmp	.LBB8_9
.LBB8_6:                                # %sw.bb10
                                        #   in Loop: Header=BB8_3 Depth=2
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
	movl	$1, -56(%rbp)
	jmp	.LBB8_9
.LBB8_7:                                # %sw.bb11
                                        #   in Loop: Header=BB8_3 Depth=2
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
	movl	$2, -56(%rbp)
	jmp	.LBB8_9
.LBB8_8:                                # %sw.bb12
                                        #   in Loop: Header=BB8_3 Depth=2
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
	movl	$3, -56(%rbp)
.LBB8_9:                                # %sw.epilog
                                        #   in Loop: Header=BB8_3 Depth=2
	movq	-32(%rbp), %rax
	movl	-80(%rbp), %ecx
	addl	$-1, %ecx
	movslq	%ecx, %rdx
	movb	(%rax,%rdx), %sil
	pushq	%rbx
	pushq	%rax
	leaq	-74(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%sil, -74(%rbp)
	movsbl	-74(%rbp), %ecx
	addl	$-65, %ecx
	movl	%ecx, %eax
	subl	$19, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	-216(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rax, -216(%rbp)        # 8-byte Spill
	ja	.LBB8_14
# %bb.31:                               # %sw.epilog
                                        #   in Loop: Header=BB8_3 Depth=2
	leaq	.LJTI8_1(%rip), %rax
	movq	-216(%rbp), %rcx        # 8-byte Reload
	movslq	(%rax,%rcx,4), %rdx
	addq	%rax, %rdx
	jmpq	*%rdx
.LBB8_10:                               # %sw.bb17
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-60(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$0, -60(%rbp)
	jmp	.LBB8_14
.LBB8_11:                               # %sw.bb18
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-60(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$1, -60(%rbp)
	jmp	.LBB8_14
.LBB8_12:                               # %sw.bb19
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-60(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$2, -60(%rbp)
	jmp	.LBB8_14
.LBB8_13:                               # %sw.bb20
                                        #   in Loop: Header=BB8_3 Depth=2
	pushq	%rbx
	pushq	%rax
	leaq	-60(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	$3, -60(%rbp)
.LBB8_14:                               # %sw.epilog21
                                        #   in Loop: Header=BB8_3 Depth=2
	movq	-8(%rbp), %rax
	movl	-80(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rax
	movslq	-84(%rbp), %rdx
	movl	(%rax,%rdx,4), %ecx
	subl	16(%rbp), %ecx
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
	movl	%ecx, -64(%rbp)
	movq	-8(%rbp), %rax
	movl	-80(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movq	(%rax,%rdx,8), %rax
	movl	-84(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movl	(%rax,%rdx,4), %ecx
	movslq	-56(%rbp), %rax
	shlq	$4, %rax
	leaq	-160(%rbp), %rdx
	addq	%rax, %rdx
	movslq	-60(%rbp), %rax
	addl	(%rdx,%rax,4), %ecx
	pushq	%rbx
	pushq	%rax
	leaq	-68(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%ecx, -68(%rbp)
	movq	-8(%rbp), %rax
	movslq	-80(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	movl	-84(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movl	(%rax,%rdx,4), %ecx
	subl	16(%rbp), %ecx
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
	movl	%ecx, -72(%rbp)
	movl	-64(%rbp), %edi
	movl	-68(%rbp), %esi
	movl	-72(%rbp), %edx
	leaq	-73(%rbp), %rcx
	callq	max@PLT
	movq	-8(%rbp), %rcx
	movslq	-80(%rbp), %r8
	movq	(%rcx,%r8,8), %rcx
	movslq	-84(%rbp), %r8
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%r8,4), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, (%rcx,%r8,4)
	movb	-73(%rbp), %r9b
	movq	-16(%rbp), %rcx
	movslq	-80(%rbp), %r8
	movq	(%rcx,%r8,8), %rcx
	movslq	-84(%rbp), %r8
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%r8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%r9b, (%rcx,%r8)
# %bb.15:                               # %for.inc
                                        #   in Loop: Header=BB8_3 Depth=2
	movl	-84(%rbp), %eax
	addl	$1, %eax
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
	jmp	.LBB8_3
.LBB8_16:                               # %for.end
                                        #   in Loop: Header=BB8_1 Depth=1
	jmp	.LBB8_17
.LBB8_17:                               # %for.inc53
                                        #   in Loop: Header=BB8_1 Depth=1
	movl	-80(%rbp), %eax
	addl	$1, %eax
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
	jmp	.LBB8_1
.LBB8_18:                               # %for.end55
	movl	-80(%rbp), %eax
	addl	$-1, %eax
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
	movl	-84(%rbp), %eax
	addl	$-1, %eax
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
.LBB8_19:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$0, -80(%rbp)
	movb	$1, %al
	pushq	%rbx
	pushq	%rax
	leaq	-217(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%al, -217(%rbp)         # 1-byte Spill
	jg	.LBB8_21
# %bb.20:                               # %lor.rhs
                                        #   in Loop: Header=BB8_19 Depth=1
	cmpl	$0, -84(%rbp)
	setg	%al
	pushq	%rbx
	pushq	%rax
	leaq	-217(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%al, -217(%rbp)         # 1-byte Spill
.LBB8_21:                               # %lor.end
                                        #   in Loop: Header=BB8_19 Depth=1
	movb	-217(%rbp), %al         # 1-byte Reload
	testb	$1, %al
	jne	.LBB8_22
	jmp	.LBB8_27
.LBB8_22:                               # %while.body
                                        #   in Loop: Header=BB8_19 Depth=1
	movq	-16(%rbp), %rax
	movslq	-80(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-84(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	movl	%edx, %esi
	subl	$45, %esi
	pushq	%rbx
	pushq	%rax
	leaq	-224(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%edx, -224(%rbp)        # 4-byte Spill
	je	.LBB8_25
	jmp	.LBB8_28
.LBB8_28:                               # %while.body
                                        #   in Loop: Header=BB8_19 Depth=1
	movl	-224(%rbp), %eax        # 4-byte Reload
	subl	$92, %eax
	je	.LBB8_24
	jmp	.LBB8_29
.LBB8_29:                               # %while.body
                                        #   in Loop: Header=BB8_19 Depth=1
	movl	-224(%rbp), %eax        # 4-byte Reload
	subl	$124, %eax
	jne	.LBB8_26
	jmp	.LBB8_23
.LBB8_23:                               # %sw.bb66
                                        #   in Loop: Header=BB8_19 Depth=1
	movq	-40(%rbp), %rdi
	leaq	.L.str.2(%rip), %rsi
	movl	$1, %edx
	callq	strncat@PLT
	leaq	-170(%rbp), %rsi
	movq	-32(%rbp), %rcx
	movl	-80(%rbp), %r8d
	subl	$1, %r8d
	movslq	%r8d, %rdx
	movb	(%rcx,%rdx), %r9b
	pushq	%rbx
	pushq	%rax
	leaq	-170(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%r9b, -170(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-169(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	$0, -169(%rbp)
	movq	-48(%rbp), %rdi
	movl	$1, %edx
	pushq	%rbx
	pushq	%rax
	leaq	-232(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rax, -232(%rbp)        # 8-byte Spill
	callq	strncat@PLT
	movl	-80(%rbp), %r8d
	addl	$-1, %r8d
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
	movl	%r8d, -80(%rbp)
	jmp	.LBB8_26
.LBB8_24:                               # %sw.bb75
                                        #   in Loop: Header=BB8_19 Depth=1
	leaq	-170(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	-84(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movb	(%rax,%rdx), %dil
	pushq	%rbx
	pushq	%rax
	leaq	-170(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%dil, -170(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-169(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	$0, -169(%rbp)
	movq	-40(%rbp), %rdi
	movl	$1, %edx
	callq	strncat@PLT
	leaq	-170(%rbp), %rsi
	movq	-32(%rbp), %rdx
	movl	-80(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdi
	movb	(%rdx,%rdi), %r8b
	pushq	%rbx
	pushq	%rax
	leaq	-170(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%r8b, -170(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-169(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	$0, -169(%rbp)
	movq	-48(%rbp), %rdi
	movl	$1, %edx
	pushq	%rbx
	pushq	%rax
	leaq	-240(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rax, -240(%rbp)        # 8-byte Spill
	callq	strncat@PLT
	movl	-80(%rbp), %ecx
	addl	$-1, %ecx
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
	movl	%ecx, -80(%rbp)
	movl	-84(%rbp), %ecx
	addl	$-1, %ecx
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
	movl	%ecx, -84(%rbp)
	jmp	.LBB8_26
.LBB8_25:                               # %sw.bb92
                                        #   in Loop: Header=BB8_19 Depth=1
	leaq	-170(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	-84(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %rdx
	movb	(%rax,%rdx), %dil
	pushq	%rbx
	pushq	%rax
	leaq	-170(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	%dil, -170(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-169(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movb	$0, -169(%rbp)
	movq	-40(%rbp), %rdi
	movl	$1, %edx
	callq	strncat@PLT
	movq	-48(%rbp), %rdi
	leaq	.L.str.2(%rip), %rsi
	movl	$1, %edx
	pushq	%rbx
	pushq	%rax
	leaq	-248(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rax, -248(%rbp)        # 8-byte Spill
	callq	strncat@PLT
	movl	-84(%rbp), %ecx
	addl	$-1, %ecx
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
	movl	%ecx, -84(%rbp)
.LBB8_26:                               # %sw.epilog102
                                        #   in Loop: Header=BB8_19 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-52(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movl	%eax, -52(%rbp)
	jmp	.LBB8_19
.LBB8_27:                               # %while.end
	movq	-40(%rbp), %rdi
	callq	my_strrev@PLT
	pushq	%rbx
	pushq	%rax
	leaq	-184(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rax, -184(%rbp)
	movq	-48(%rbp), %rdi
	callq	my_strrev@PLT
	xorl	%ecx, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	-192(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB8_32
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB8_32
	popq	%rax
	popq	%rbx
	movq	%rax, -192(%rbp)
	movl	%ecx, %eax
	addq	$256, %rsp              # imm = 0x100
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
	.p2align	2
.LJTI8_0:
	.long	.LBB8_5-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_6-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_7-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_9-.LJTI8_0
	.long	.LBB8_8-.LJTI8_0
.LJTI8_1:
	.long	.LBB8_10-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_11-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_12-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_14-.LJTI8_1
	.long	.LBB8_13-.LJTI8_1
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
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rdi, -8(%rbp)
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
	movq	%rsi, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movq	%rdx, -24(%rbp)
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
	movq	%rcx, -32(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	$2, -36(%rbp)
	movq	-8(%rbp), %rdi
	callq	my_strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
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
	movl	%eax, -40(%rbp)
	movq	-16(%rbp), %rdi
	callq	my_strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
	pushq	%rbx
	pushq	%rax
	leaq	-44(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, -44(%rbp)
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rcx
	shlq	$3, %rcx
	movq	%rcx, %rdi
	callq	malloc@PLT
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
	movq	%rax, -56(%rbp)
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
	movl	$0, -60(%rbp)
.LBB9_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-60(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jg	.LBB9_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB9_1 Depth=1
	movslq	-40(%rbp), %rax
	shlq	$2, %rax
	movq	%rax, %rdi
	callq	malloc@PLT
	movq	-56(%rbp), %rcx
	movslq	-60(%rbp), %rdx
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
	movl	-60(%rbp), %eax
	addl	$1, %eax
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
	jmp	.LBB9_1
.LBB9_4:                                # %for.end
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rcx
	shlq	$3, %rcx
	movq	%rcx, %rdi
	callq	malloc@PLT
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
	movq	%rax, -72(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-76(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	$0, -76(%rbp)
.LBB9_5:                                # %for.cond14
                                        # =>This Inner Loop Header: Depth=1
	movl	-76(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jg	.LBB9_8
# %bb.6:                                # %for.body17
                                        #   in Loop: Header=BB9_5 Depth=1
	movslq	-40(%rbp), %rax
	shlq	$0, %rax
	movq	%rax, %rdi
	callq	malloc@PLT
	movq	-72(%rbp), %rcx
	movslq	-76(%rbp), %rdx
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
	movl	-76(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-76(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, -76(%rbp)
	jmp	.LBB9_5
.LBB9_8:                                # %for.end25
	leaq	.L.str.3(%rip), %rdi
	callq	puts@PLT
	movq	-56(%rbp), %rdi
	movq	-72(%rbp), %rsi
	movl	-40(%rbp), %edx
	movl	-44(%rbp), %ecx
	movl	-36(%rbp), %r8d
	pushq	%rbx
	pushq	%rax
	leaq	-84(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, -84(%rbp)         # 4-byte Spill
	callq	dpm_init@PLT
	movq	-24(%rbp), %rsi
	pushq	%rbx
	pushq	%rax
	leaq	(%rsi), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movb	$0, (%rsi)
	movq	-32(%rbp), %rsi
	pushq	%rbx
	pushq	%rax
	leaq	(%rsi), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movb	$0, (%rsi)
	leaq	.L.str.4(%rip), %rdi
	callq	puts@PLT
	movq	-56(%rbp), %rdi
	movq	-72(%rbp), %rsi
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %r8
	movq	-32(%rbp), %r9
	movl	-36(%rbp), %r10d
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
	movl	%r10d, (%rsp)
	pushq	%rbx
	pushq	%rax
	leaq	-88(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB9_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB9_11
	popq	%rax
	popq	%rbx
	movl	%eax, -88(%rbp)         # 4-byte Spill
	callq	nw_align@PLT
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
	movl	%eax, -80(%rbp)
	leaq	.L.str.5(%rip), %rdi
	callq	puts@PLT
	cmpl	$0, -80(%rbp)
	jne	.LBB9_10
# %bb.9:                                # %if.then
	movq	-56(%rbp), %rdi
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdx
	callq	print_matrix@PLT
	movq	-72(%rbp), %rdi
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdx
	callq	print_traceback@PLT
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
	subq	$160, %rsp
	movq	.L__const.enclave_main.seq_1(%rip), %rax
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
	movb	.L__const.enclave_main.seq_1+8(%rip), %cl
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
	movb	%cl, -1(%rbp)
	movq	.L__const.enclave_main.seq_2(%rip), %rax
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
	leaq	.L.str.6(%rip), %rdi
	callq	puts@PLT
	leaq	-144(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	leaq	-17(%rbp), %rsi
	leaq	-9(%rbp), %rdi
	pushq	%rbx
	pushq	%rax
	leaq	-148(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB10_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB10_1
	popq	%rax
	popq	%rbx
	movl	%eax, -148(%rbp)        # 4-byte Spill
	callq	Ecall_nw@PLT
	leaq	.L.str.7(%rip), %rdi
	callq	puts@PLT
	xorl	%edi, %edi
	pushq	%rbx
	pushq	%rax
	leaq	-152(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB10_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB10_1
	popq	%rax
	popq	%rbx
	movl	%eax, -152(%rbp)        # 4-byte Spill
	callq	exit@PLT
.LBB10_1:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end10:
	.size	enclave_main, .Lfunc_end10-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"test2"
	.size	.L.str, 6

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

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"test4"
	.size	.L.str.1, 6

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"-"
	.size	.L.str.2, 2

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"test1"
	.size	.L.str.3, 6

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"test3"
	.size	.L.str.4, 6

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"test5"
	.size	.L.str.5, 6

	.type	.L__const.enclave_main.seq_1,@object # @__const.enclave_main.seq_1
.L__const.enclave_main.seq_1:
	.asciz	"AGTACGTC"
	.size	.L__const.enclave_main.seq_1, 9

	.type	.L__const.enclave_main.seq_2,@object # @__const.enclave_main.seq_2
.L__const.enclave_main.seq_2:
	.asciz	"ACGTCGT"
	.size	.L__const.enclave_main.seq_2, 8

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"running NW algorithm..."
	.size	.L.str.6, 24

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"exiting..."
	.size	.L.str.7, 11


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/proofGen.git f5c9d4caaea835e9e3397ac4904096d0588615da)"
	.section	".note.GNU-stack","",@progbits
