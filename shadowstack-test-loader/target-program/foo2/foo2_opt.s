	.text
	.file	"foo2"
	.globl	CFICheck                # -- Begin function CFICheck
	.p2align	4, 0x90
	.type	CFICheck,@function
CFICheck:                               # @CFICheck
	.cfi_startproc
# %bb.0:                                # %entry
	movabsq	$131072, %r11           # imm = 0x20000
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
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
	.cfi_def_cfa %rsp, 8
	movabsq	$131072, %r11           # imm = 0x20000
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	cmpq	%r10, (%rsp)
	jne	.LBB0_13
	retq
.LBB0_6:                                # %if.else
                                        #   in Loop: Header=BB0_1 Depth=1
	.cfi_def_cfa %rbp, 16
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
	callq	abort
.LBB0_13:
	.cfi_def_cfa %rsp, 8
	movl	$60, %eax
	movl	$0, %edi
	syscall
.Lfunc_end0:
	.size	CFICheck, .Lfunc_end0-CFICheck
	.cfi_endproc
                                        # -- End function
	.globl	fun                     # -- Begin function fun
	.p2align	4, 0x90
	.type	fun,@function
fun:                                    # @fun
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rsp), %rcx
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	cmpq	%rcx, (%rsp)
	jne	.LBB1_1
	retq
.LBB1_1:
	movl	$60, %eax
	movl	$0, %edi
	syscall
.Lfunc_end1:
	.size	fun, .Lfunc_end1-fun
	.cfi_endproc
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -24
	movabsq	$fun, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movq	%rbx, %rdi
	callq	CFICheck
	callq	*%rbx
	movl	%eax, -20(%rbp)
	movabsq	$.L.str, %rdi
	callq	puts
	xorl	%edi, %edi
	callq	exit
.Lfunc_end2:
	.size	enclave_main, .Lfunc_end2-enclave_main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"success!"
	.size	.L.str, 9


	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git ea61fcc2e46adc99b39525b77c98b101708386f4)"
	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git ea61fcc2e46adc99b39525b77c98b101708386f4)"
	.section	".note.GNU-stack","",@progbits