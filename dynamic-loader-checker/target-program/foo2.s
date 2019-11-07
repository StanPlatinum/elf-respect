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
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$24, %rsp
	movabsq	$fun, %rax
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popq	%rax
	popq	%rbx
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movq	%rbx, %rdi
	callq	CFICheck
	callq	*%rbx
	pushq	%rbx
	pushq	%rax
	leaq	-20(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popq	%rax
	popq	%rbx
	movl	%eax, -20(%rbp)
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	puts
	xorl	%edi, %edi
	callq	exit
.LBB2_1:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end2:
	.size	enclave_main, .Lfunc_end2-enclave_main
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"success!"
	.size	.L.str, 9


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git a4f4db9447980bbac19917a6ddb3c6501bb9ebc1)"
	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git a4f4db9447980bbac19917a6ddb3c6501bb9ebc1)"
	.section	".note.GNU-stack","",@progbits
