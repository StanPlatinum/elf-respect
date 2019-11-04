	.text
	.file	"bmmas"
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
	.globl	sort                    # -- Begin function sort
	.p2align	4, 0x90
	.type	sort,@function
sort:                                   # @sort
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rdi, -24(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rsi, -32(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movl	%edx, -8(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-44(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movl	%ecx, -44(%rbp)
	movl	-8(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.LBB1_2
# %bb.1:                                # %if.then
	jmp	.LBB1_9
.LBB1_2:                                # %if.end
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-56(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, -56(%rbp)
	movl	-8(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
.LBB1_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-44(%rbp), %eax
	ja	.LBB1_8
# %bb.4:                                # %for.body
                                        #   in Loop: Header=BB1_3 Depth=1
	movq	-24(%rbp), %rax
	movl	-12(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	cmpq	-56(%rbp), %rax
	jae	.LBB1_6
# %bb.5:                                # %if.then5
                                        #   in Loop: Header=BB1_3 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	-12(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	movq	-24(%rbp), %rcx
	movl	-12(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	movl	-4(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
	movq	-32(%rbp), %rax
	movl	-12(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movl	-4(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	movq	-32(%rbp), %rcx
	movl	-12(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	movl	-4(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
.LBB1_6:                                # %if.end22
                                        #   in Loop: Header=BB1_3 Depth=1
	jmp	.LBB1_7
.LBB1_7:                                # %for.inc
                                        #   in Loop: Header=BB1_3 Depth=1
	movl	-12(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	jmp	.LBB1_3
.LBB1_8:                                # %for.end
	movq	-24(%rbp), %rax
	movl	-8(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	movq	-24(%rbp), %rcx
	movl	-8(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rcx
	movl	-4(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
	movq	-32(%rbp), %rax
	movl	-8(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-40(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movl	-4(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	movq	-32(%rbp), %rcx
	movl	-8(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	movl	-4(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_10
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %ecx
	subl	$1, %ecx
	callq	sort
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movl	-4(%rbp), %edx
	addl	$1, %edx
	movl	-44(%rbp), %ecx
	callq	sort
.LBB1_9:                                # %return
	addq	$64, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB1_11
	retq
.LBB1_10:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB1_11:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end1:
	.size	sort, .Lfunc_end1-sort
                                        # -- End function
	.globl	check_overlap           # -- Begin function check_overlap
	.p2align	4, 0x90
	.type	check_overlap,@function
check_overlap:                          # @check_overlap
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
	ja	.LBB2_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_8
	popq	%rax
	popq	%rbx
	movq	%rdi, -32(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_8
	popq	%rax
	popq	%rbx
	movq	%rsi, -24(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_8
	popq	%rax
	popq	%rbx
	movl	$0, -8(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_8
	popq	%rax
	popq	%rbx
	movl	$1, -4(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4096, -4(%rbp)         # imm = 0x1000
	jae	.LBB2_6
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %ecx
	subl	$1, %ecx
	movl	%ecx, %ecx
	movq	(%rax,%rcx,8), %rax
	movq	-32(%rbp), %rcx
	movl	-4(%rbp), %edx
	cmpq	(%rcx,%rdx,8), %rax
	jbe	.LBB2_4
# %bb.3:                                # %if.then
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_8
	popq	%rax
	popq	%rbx
	movl	$1, -12(%rbp)
	jmp	.LBB2_7
.LBB2_4:                                # %if.end
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_8
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
# %bb.5:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_8
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	jmp	.LBB2_1
.LBB2_6:                                # %for.end
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_8
	popq	%rax
	popq	%rbx
	movl	$0, -12(%rbp)
.LBB2_7:                                # %return
	movl	-12(%rbp), %eax
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB2_9
	retq
.LBB2_8:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB2_9:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end2:
	.size	check_overlap, .Lfunc_end2-check_overlap
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	$32768, %edi            # imm = 0x8000
	callq	malloc
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_12
	popq	%rax
	popq	%rbx
	movq	%rax, -16(%rbp)
	movl	$32768, %edi            # imm = 0x8000
	callq	malloc
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_12
	popq	%rax
	popq	%rbx
	movq	%rax, -24(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_12
	popq	%rax
	popq	%rbx
	movl	$0, -4(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4096, -4(%rbp)         # imm = 0x1000
	jae	.LBB3_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-4(%rbp), %eax
	xorl	%edx, %edx
	movl	$5, %ecx
	divl	%ecx
	addl	$5, %edx
	movl	%edx, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_12
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rdi
	callq	malloc
	movq	-16(%rbp), %rcx
	movl	-4(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_12
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
	movq	-16(%rbp), %rax
	movl	-4(%rbp), %ecx
	movq	(%rax,%rcx,8), %rax
	addq	-32(%rbp), %rax
	movq	-24(%rbp), %rcx
	movl	-4(%rbp), %edx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx,%rdx,8), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_12
	popq	%rax
	popq	%rbx
	movq	%rax, (%rcx,%rdx,8)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_12
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	jmp	.LBB3_1
.LBB3_4:                                # %for.end
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	xorl	%edx, %edx
	movl	$4095, %ecx             # imm = 0xFFF
	callq	sort
	movq	-16(%rbp), %rdi
	movq	-24(%rbp), %rsi
	callq	check_overlap
	cmpl	$0, %eax
	je	.LBB3_6
# %bb.5:                                # %if.then
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	puts
	jmp	.LBB3_7
.LBB3_6:                                # %if.else
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	puts
.LBB3_7:                                # %if.end
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_12
	popq	%rax
	popq	%rbx
	movl	$0, -4(%rbp)
.LBB3_8:                                # %for.cond11
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4096, -4(%rbp)         # imm = 0x1000
	jae	.LBB3_11
# %bb.9:                                # %for.body14
                                        #   in Loop: Header=BB3_8 Depth=1
	movq	-16(%rbp), %rax
	movl	-4(%rbp), %ecx
	movq	(%rax,%rcx,8), %rdi
	callq	free
# %bb.10:                               # %for.inc17
                                        #   in Loop: Header=BB3_8 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_12
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_12
	popq	%rax
	popq	%rbx
	movl	%eax, -4(%rbp)
	jmp	.LBB3_8
.LBB3_11:                               # %for.end19
	xorl	%edi, %edi
	callq	exit
.LBB3_12:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end3:
	.size	enclave_main, .Lfunc_end3-enclave_main
                                        # -- End function
	.type	__tmp,@object           # @__tmp
	.bss
	.globl	__tmp
	.p2align	4
__tmp:
	.zero	64
	.size	__tmp, 64

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"overlap exist"
	.size	.L.str, 14

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"no overlap"
	.size	.L.str.1, 11


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 3a49d86ed12106d3767eefb5ff6d90f98867f42f)"
	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 3a49d86ed12106d3767eefb5ff6d90f98867f42f)"
	.section	".note.GNU-stack","",@progbits
