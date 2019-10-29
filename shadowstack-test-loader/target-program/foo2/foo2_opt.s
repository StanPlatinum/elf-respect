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
	subq	$112, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	-72(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rdi, -72(%rbp)
	movabsq	$2305843009213693951, %rax # imm = 0x1FFFFFFFFFFFFFFF
	pushq	%rbx
	pushq	%rax
	leaq	-64(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rax, -64(%rbp)
	pushq	%rbx
	pushq	%rax
	leaq	-36(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movl	$536870911, -36(%rbp)   # imm = 0x1FFFFFFF
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movl	$0, -16(%rbp)
	movl	-36(%rbp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	movabsq	$.L.str, %rdi
	callq	puts
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movl	$0, -8(%rbp)
.LBB0_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jge	.LBB0_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB0_1 Depth=1
	leaq	-104(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-56(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rax, -56(%rbp)
	movq	-64(%rbp), %rax
	movslq	-8(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-56(%rbp), %rsi
	movl	$16, %edx
	callq	my_itoa
	pushq	%rbx
	pushq	%rax
	leaq	-56(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rdi
	callq	puts
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-8(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_4:                                # %for.end
	movabsq	$.L.str.1, %rdi
	callq	puts
	leaq	-96(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	movq	-72(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movl	$16, %edx
	callq	my_itoa
	pushq	%rbx
	pushq	%rax
	leaq	-32(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	movabsq	$.L.str.2, %rdi
	callq	puts
	movq	-32(%rbp), %rdi
	callq	puts
.LBB0_5:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jg	.LBB0_15
# %bb.6:                                # %while.body
                                        #   in Loop: Header=BB0_5 Depth=1
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %eax
	subl	-16(%rbp), %eax
	cltd
	movl	$2, %esi
	idivl	%esi
	addl	%eax, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	-4(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movl	%ecx, -4(%rbp)
	leaq	-88(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-48(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rax, -48(%rbp)
	movabsq	$.L.str.3, %rdi
	callq	puts
	movslq	-4(%rbp), %rdi
	movq	-48(%rbp), %rsi
	movl	$16, %edx
	callq	my_itoa
	pushq	%rbx
	pushq	%rax
	leaq	-48(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rdi
	callq	puts
	leaq	-80(%rbp), %rax
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rax, -24(%rbp)
	movabsq	$.L.str.4, %rdi
	callq	puts
	movq	-64(%rbp), %rax
	movslq	-4(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	movq	-24(%rbp), %rsi
	movl	$16, %edx
	callq	my_itoa
	pushq	%rbx
	pushq	%rax
	leaq	-24(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	callq	puts
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.LBB0_8
# %bb.7:                                # %if.then
	jmp	.LBB0_16
.LBB0_8:                                # %if.end
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movl	$12, %edx
	callq	strncmp
	cmpl	$0, %eax
	jle	.LBB0_10
# %bb.9:                                # %if.then21
                                        #   in Loop: Header=BB0_5 Depth=1
	movabsq	$.L.str.5, %rdi
	callq	puts
	movl	-4(%rbp), %eax
	subl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-12(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movl	%eax, -12(%rbp)
	jmp	.LBB0_14
.LBB0_10:                               # %if.else
                                        #   in Loop: Header=BB0_5 Depth=1
	movq	-24(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movl	$12, %edx
	callq	strncmp
	cmpl	$0, %eax
	jge	.LBB0_12
# %bb.11:                               # %if.then27
                                        #   in Loop: Header=BB0_5 Depth=1
	movabsq	$.L.str.6, %rdi
	callq	puts
	movl	-4(%rbp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	-16(%rbp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_17
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_17
	popq	%rax
	popq	%rbx
	movl	%eax, -16(%rbp)
	jmp	.LBB0_13
.LBB0_12:                               # %if.else30
	movabsq	$.L.str.7, %rdi
	callq	puts
	addq	$112, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB0_18
	retq
.LBB0_13:                               # %if.end32
                                        #   in Loop: Header=BB0_5 Depth=1
	jmp	.LBB0_14
.LBB0_14:                               # %if.end33
                                        #   in Loop: Header=BB0_5 Depth=1
	movabsq	$.L.str.8, %rdi
	callq	puts
	jmp	.LBB0_5
.LBB0_15:                               # %while.end.loopexit
	jmp	.LBB0_16
.LBB0_16:                               # %while.end
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB0_17:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB0_18:
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
	movabsq	$.L.str.9, %rdi
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
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popq	%rax
	popq	%rbx
	movq	%rax, -32(%rbp)
	movabsq	$.L.str.1.10, %rdi
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
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popq	%rax
	popq	%rbx
	movl	%eax, -20(%rbp)
	movabsq	$.L.str.2.11, %rdi
	callq	puts
	leaq	-40(%rbp), %rax
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
	movabsq	$.L.str.3.12, %rdi
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
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popq	%rax
	popq	%rbx
	movq	%rax, -16(%rbp)
	movabsq	$.L.str.4.13, %rdi
	callq	puts
	movq	-16(%rbp), %rdi
	callq	puts
	movabsq	$.L.str.5.14, %rdi
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
	.asciz	"traverse all targets:"
	.size	.L.str, 22

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"checking next indirect call..."
	.size	.L.str.1, 31

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"target: "
	.size	.L.str.2, 9

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"mid: "
	.size	.L.str.3, 6

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"CFICheckAddressPtr[mid]: "
	.size	.L.str.4, 26

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"target is smaller than [mid]"
	.size	.L.str.5, 29

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"target is larger than [mid]"
	.size	.L.str.6, 28

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"found it!"
	.size	.L.str.7, 10

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"."
	.size	.L.str.8, 2

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"----------1 in fun----------"
	.size	.L.str.9, 29

	.type	.L.str.1.10,@object     # @.str.1.10
.L.str.1.10:
	.asciz	"----------1----------"
	.size	.L.str.1.10, 22

	.type	.L.str.2.11,@object     # @.str.2.11
.L.str.2.11:
	.asciz	"----------2----------"
	.size	.L.str.2.11, 22

	.type	.L.str.3.12,@object     # @.str.3.12
.L.str.3.12:
	.asciz	"----------3----------"
	.size	.L.str.3.12, 22

	.type	.L.str.4.13,@object     # @.str.4.13
.L.str.4.13:
	.asciz	"----------4----------"
	.size	.L.str.4.13, 22

	.type	.L.str.5.14,@object     # @.str.5.14
.L.str.5.14:
	.asciz	"success!"
	.size	.L.str.5.14, 9


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 444daba1eecc30b5a70de95e7a4016b5b8d4ce27)"
	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 444daba1eecc30b5a70de95e7a4016b5b8d4ce27)"
	.section	".note.GNU-stack","",@progbits
