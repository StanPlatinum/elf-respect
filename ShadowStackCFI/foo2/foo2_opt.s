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
	subq	$64, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	-48(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movq	%rdi, -48(%rbp)
	movabsq	$2305843009213693951, %rax # imm = 0x1FFFFFFFFFFFFFFF
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
	movq	%rax, -32(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_13
	popq	%rax
	popq	%rbx
	movl	$536870911, -36(%rbp)   # imm = 0x1FFFFFFF
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
	movl	-36(%rbp), %eax
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
	movabsq	$.L.str, %rdi
	callq	puts
	leaq	-56(%rbp), %rax
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
	movabsq	$.L.str.1, %rdi
	callq	puts
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-24(%rbp), %rsi
	movl	$10, %edx
	movb	$0, %al
	callq	itoa
	cltq
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
	movq	-24(%rbp), %rdi
	callq	puts
	movabsq	$.L.str.2, %rdi
	callq	puts
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.LBB0_4
# %bb.3:                                # %if.then
	jmp	.LBB0_12
.LBB0_4:                                # %if.end
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	-48(%rbp), %rax
	jne	.LBB0_6
# %bb.5:                                # %if.then12
	movabsq	$.L.str.3, %rdi
	callq	puts
	addq	$64, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB0_14
	retq
.LBB0_6:                                # %if.else
                                        #   in Loop: Header=BB0_1 Depth=1
	movq	-32(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	-48(%rbp), %rax
	jle	.LBB0_8
# %bb.7:                                # %if.then18
                                        #   in Loop: Header=BB0_1 Depth=1
	movabsq	$.L.str.4, %rdi
	callq	puts
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
	jmp	.LBB0_9
.LBB0_8:                                # %if.else21
                                        #   in Loop: Header=BB0_1 Depth=1
	movabsq	$.L.str.5, %rdi
	callq	puts
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
.LBB0_9:                                # %if.end24
                                        #   in Loop: Header=BB0_1 Depth=1
	jmp	.LBB0_10
.LBB0_10:                               # %if.end25
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
	.globl	fun                     # -- Begin function fun
	.p2align	4, 0x90
	.type	fun,@function
fun:                                    # @fun
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	movabsq	$.L.str.6, %rdi
	callq	puts
	movl	$1, %eax
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB1_2
	retq
# %bb.1:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB1_2:
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
	leaq	-48(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rdi, -48(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-56(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rsi, -56(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%edx, -36(%rbp)
	movabsq	$.L.str.1.7, %rdi
	callq	puts
	movq	-56(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	movabsq	$.L.str.2.8, %rdi
	callq	puts
.LBB2_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rax
	movl	-36(%rbp), %ecx
	xorl	%edx, %edx
	divq	%rcx
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%edx, -20(%rbp)
	movl	-36(%rbp), %ecx
	movq	-48(%rbp), %rax
	xorl	%edx, %edx
	divq	%rcx
	pushq	%rbx
	pushq	%rax
	leaq	-48(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rax, -48(%rbp)
	cmpl	$9, -20(%rbp)
	jbe	.LBB2_3
# %bb.2:                                # %if.then
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %eax
	subl	$10, %eax
	addl	$97, %eax
	movq	-16(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rdx, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movb	%al, (%rcx)
	jmp	.LBB2_4
.LBB2_3:                                # %if.else
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$48, %eax
	movq	-16(%rbp), %rcx
	movq	%rcx, %rdx
	addq	$1, %rdx
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rdx, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movb	%al, (%rcx)
.LBB2_4:                                # %if.end
                                        #   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_5
.LBB2_5:                                # %do.cond
                                        #   in Loop: Header=BB2_1 Depth=1
	cmpq	$0, -48(%rbp)
	ja	.LBB2_1
# %bb.6:                                # %do.end
	movabsq	$.L.str.3.9, %rdi
	callq	puts
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	addq	$-1, %rcx
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rcx, -16(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	(%rax), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movb	$32, (%rax)
.LBB2_7:                                # %do.body13
                                        # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	movb	(%rax), %al
	pushq	%rbx
	pushq	%rax
	leaq	-1(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movb	%al, -1(%rbp)
	movq	-32(%rbp), %rax
	movb	(%rax), %al
	movq	-16(%rbp), %rcx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movb	%al, (%rcx)
	movb	-1(%rbp), %al
	movq	-32(%rbp), %rcx
	pushq	%rbx
	pushq	%rax
	leaq	(%rcx), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movb	%al, (%rcx)
	movq	-16(%rbp), %rax
	addq	$-1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	addq	$1, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
# %bb.8:                                # %do.cond16
                                        #   in Loop: Header=BB2_7 Depth=1
	movq	-32(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jb	.LBB2_7
# %bb.9:                                # %do.end19
	movabsq	$.L.str.4.10, %rdi
	callq	puts
	movq	-56(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB2_11
	retq
.LBB2_10:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB2_11:
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
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_1
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	movabsq	$.L.str.5.11, %rdi
	callq	puts
	movq	-32(%rbp), %rbx
	movq	%rbx, %rdi
	callq	CFICheck
	callq	*%rbx
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_1
	popq	%rax
	popq	%rbx
	movl	%eax, -20(%rbp)
	movabsq	$.L.str.6.12, %rdi
	callq	puts
	leaq	-40(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_1
	popq	%rax
	popq	%rbx
	movq	%rax, -16(%rbp)
	movabsq	$.L.str.7, %rdi
	callq	puts
	movslq	-20(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movl	$10, %edx
	callq	my_itoa
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_1
	popq	%rax
	popq	%rbx
	movq	%rax, -16(%rbp)
	movabsq	$.L.str.8, %rdi
	callq	puts
	movq	-16(%rbp), %rdi
	callq	puts
	movabsq	$.L.str.9, %rdi
	callq	puts
	xorl	%edi, %edi
	callq	exit
.LBB3_1:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end3:
	.size	enclave_main, .Lfunc_end3-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"checking next indirect call...\n"
	.size	.L.str, 32

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"Matching CFICheckAddressPtr[mid]: "
	.size	.L.str.1, 35

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"\n"
	.size	.L.str.2, 2

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"found it!\n"
	.size	.L.str.3, 11

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"larger!\n"
	.size	.L.str.4, 9

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"smaller!\n"
	.size	.L.str.5, 10

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"----------1 in fun----------"
	.size	.L.str.6, 29

	.type	.L.str.1.7,@object      # @.str.1.7
.L.str.1.7:
	.asciz	"----------1 in my_itoa----------"
	.size	.L.str.1.7, 33

	.type	.L.str.2.8,@object      # @.str.2.8
.L.str.2.8:
	.asciz	"----------2 in my_itoa----------"
	.size	.L.str.2.8, 33

	.type	.L.str.3.9,@object      # @.str.3.9
.L.str.3.9:
	.asciz	"----------3 in my_itoa----------"
	.size	.L.str.3.9, 33

	.type	.L.str.4.10,@object     # @.str.4.10
.L.str.4.10:
	.asciz	"----------4 in my_itoa----------"
	.size	.L.str.4.10, 33

	.type	.L.str.5.11,@object     # @.str.5.11
.L.str.5.11:
	.asciz	"----------1----------"
	.size	.L.str.5.11, 22

	.type	.L.str.6.12,@object     # @.str.6.12
.L.str.6.12:
	.asciz	"----------2----------"
	.size	.L.str.6.12, 22

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"----------3----------"
	.size	.L.str.7, 22

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"----------4----------"
	.size	.L.str.8, 22

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"success!"
	.size	.L.str.9, 9


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 444daba1eecc30b5a70de95e7a4016b5b8d4ce27)"
	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 444daba1eecc30b5a70de95e7a4016b5b8d4ce27)"
	.section	".note.GNU-stack","",@progbits
