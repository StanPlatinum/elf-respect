	.text
	.file	"nw4test.bc"
	.globl	max                     # -- Begin function max
	.p2align	4, 0x90
	.type	max,@function
max:                                    # @max
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%edi, -16(%rbp)
	leaq	-12(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%esi, -12(%rbp)
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%edx, -8(%rbp)
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rcx, -24(%rbp)
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -4(%rbp)
	cmpl	%esi, %edi
	jl	.LBB0_3
# %bb.1:
	movl	-16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.LBB0_3
# %bb.2:
	movl	-16(%rbp), %eax
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	leaq	(%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$124, (%rax)
	jmp	.LBB0_6
.LBB0_3:
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.LBB0_5
# %bb.4:
	movl	-12(%rbp), %eax
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	leaq	(%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$92, (%rax)
	jmp	.LBB0_6
.LBB0_5:
	movl	-8(%rbp), %eax
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	leaq	(%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$45, (%rax)
.LBB0_6:
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	max, .Lfunc_end0-max
                                        # -- End function
	.globl	dpm_init                # -- Begin function dpm_init
	.p2align	4, 0x90
	.type	dpm_init,@function
dpm_init:                               # @dpm_init
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdi, -40(%rbp)
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rsi, -24(%rbp)
	leaq	-32(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%edx, -32(%rbp)
	leaq	-28(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%ecx, -28(%rbp)
	leaq	-12(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%r8d, -12(%rbp)
	movq	(%rdi), %rax
	leaq	(%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, (%rax)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	leaq	(%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$110, (%rax)
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -4(%rbp)
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$1, -8(%rbp)
	.p2align	4, 0x90
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jg	.LBB1_3
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movslq	-8(%rbp), %rax
	movl	%eax, %ecx
	negl	%ecx
	imull	-12(%rbp), %ecx
	movq	-40(%rbp), %rdx
	movq	(%rdx), %rdx
	leaq	(%rdx,%rax,4), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%ecx, (%rdx,%rax,4)
	movslq	-8(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	(%rcx), %rcx
	leaq	(%rcx,%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$45, (%rcx,%rax)
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -8(%rbp)
	jmp	.LBB1_1
.LBB1_3:
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$1, -4(%rbp)
	.p2align	4, 0x90
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jg	.LBB1_6
# %bb.5:                                #   in Loop: Header=BB1_4 Depth=1
	movslq	-4(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	(%rcx,%rax,8), %rcx
                                        # kill: def $eax killed $eax killed $rax
	negl	%eax
	imull	-12(%rbp), %eax
	leaq	(%rcx), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, (%rcx)
	movslq	-4(%rbp), %rax
	movq	-24(%rbp), %rcx
	movq	(%rcx,%rax,8), %rax
	leaq	(%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$124, (%rax)
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -4(%rbp)
	jmp	.LBB1_4
.LBB1_6:
	popq	%rbp
	retq
.Lfunc_end1:
	.size	dpm_init, .Lfunc_end1-dpm_init
                                        # -- End function
	.globl	my_strlen               # -- Begin function my_strlen
	.p2align	4, 0x90
	.type	my_strlen,@function
my_strlen:                              # @my_strlen
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdi, -16(%rbp)
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdi, -8(%rbp)
	.p2align	4, 0x90
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB2_3
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addq	$1, -8(%rbp)
	jmp	.LBB2_1
.LBB2_3:
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end2:
	.size	my_strlen, .Lfunc_end2-my_strlen
                                        # -- End function
	.globl	print_matrix            # -- Begin function print_matrix
	.p2align	4, 0x90
	.type	print_matrix,@function
print_matrix:                           # @print_matrix
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	leaq	-48(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdi, -48(%rbp)
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rsi, -40(%rbp)
	leaq	-32(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdx, -32(%rbp)
	movq	%rsi, %rdi
	callq	my_strlen
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -16(%rbp)
	movq	-32(%rbp), %rdi
	callq	my_strlen
	leaq	-20(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -20(%rbp)
	leaq	-12(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -12(%rbp)
	.p2align	4, 0x90
.LBB3_1:                                # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB3_3
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	leaq	-12(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -12(%rbp)
	jmp	.LBB3_1
.LBB3_3:
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -8(%rbp)
	jmp	.LBB3_4
	.p2align	4, 0x90
.LBB3_8:                                #   in Loop: Header=BB3_4 Depth=1
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -8(%rbp)
.LBB3_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_6 Depth 2
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.LBB3_9
# %bb.5:                                #   in Loop: Header=BB3_4 Depth=1
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB3_6:                                #   Parent Loop BB3_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB3_8
# %bb.7:                                #   in Loop: Header=BB3_6 Depth=2
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -4(%rbp)
	jmp	.LBB3_6
.LBB3_9:
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end3:
	.size	print_matrix, .Lfunc_end3-print_matrix
                                        # -- End function
	.globl	print_traceback         # -- Begin function print_traceback
	.p2align	4, 0x90
	.type	print_traceback,@function
print_traceback:                        # @print_traceback
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	leaq	-48(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdi, -48(%rbp)
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rsi, -40(%rbp)
	leaq	-32(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdx, -32(%rbp)
	movq	%rsi, %rdi
	callq	my_strlen
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -16(%rbp)
	movq	-32(%rbp), %rdi
	callq	my_strlen
	leaq	-20(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -20(%rbp)
	leaq	-12(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -12(%rbp)
	.p2align	4, 0x90
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB4_3
# %bb.2:                                #   in Loop: Header=BB4_1 Depth=1
	leaq	-12(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -12(%rbp)
	jmp	.LBB4_1
.LBB4_3:
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -8(%rbp)
	jmp	.LBB4_4
	.p2align	4, 0x90
.LBB4_8:                                #   in Loop: Header=BB4_4 Depth=1
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -8(%rbp)
.LBB4_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.LBB4_9
# %bb.5:                                #   in Loop: Header=BB4_4 Depth=1
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -4(%rbp)
	.p2align	4, 0x90
.LBB4_6:                                #   Parent Loop BB4_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jg	.LBB4_8
# %bb.7:                                #   in Loop: Header=BB4_6 Depth=2
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -4(%rbp)
	jmp	.LBB4_6
.LBB4_9:
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end4:
	.size	print_traceback, .Lfunc_end4-print_traceback
                                        # -- End function
	.globl	strrev                  # -- Begin function strrev
	.p2align	4, 0x90
	.type	strrev,@function
strrev:                                 # @strrev
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	subq	$40, %rsp
	leaq	-32(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdi, -32(%rbp)
	testq	%rdi, %rdi
	je	.LBB5_5
# %bb.1:
	movq	-32(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB5_5
# %bb.2:
	movq	-32(%rbp), %rbx
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rbx, -24(%rbp)
	movq	%rbx, %rdi
	callq	my_strlen
	addq	%rbx, %rax
	addq	$-1, %rax
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -16(%rbp)
	.p2align	4, 0x90
.LBB5_3:                                # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jbe	.LBB5_5
# %bb.4:                                #   in Loop: Header=BB5_3 Depth=1
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-24(%rbp), %rcx
	movzbl	(%rcx), %edx
	xorl	%eax, %edx
	leaq	(%rcx), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%dl, (%rcx)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-16(%rbp), %rcx
	movzbl	(%rcx), %edx
	xorl	%eax, %edx
	leaq	(%rcx), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%dl, (%rcx)
	movq	-16(%rbp), %rax
	movzbl	(%rax), %eax
	movq	-24(%rbp), %rcx
	movzbl	(%rcx), %edx
	xorl	%eax, %edx
	leaq	(%rcx), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%dl, (%rcx)
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addq	$1, -24(%rbp)
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addq	$-1, -16(%rbp)
	jmp	.LBB5_3
.LBB5_5:
	movq	-32(%rbp), %rax
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end5:
	.size	strrev, .Lfunc_end5-strrev
                                        # -- End function
	.globl	strncat                 # -- Begin function strncat
	.p2align	4, 0x90
	.type	strncat,@function
strncat:                                # @strncat
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdi, -24(%rbp)
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rsi, -40(%rbp)
	leaq	-32(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdx, -32(%rbp)
	testq	%rdx, %rdx
	je	.LBB6_7
# %bb.1:
	movq	-24(%rbp), %rax
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -16(%rbp)
	.p2align	4, 0x90
.LBB6_2:                                # =>This Inner Loop Header: Depth=1
	movq	-8(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB6_4
# %bb.3:                                #   in Loop: Header=BB6_2 Depth=1
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addq	$1, -8(%rbp)
	jmp	.LBB6_2
	.p2align	4, 0x90
.LBB6_5:                                #   in Loop: Header=BB6_4 Depth=1
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addq	$1, -8(%rbp)
	leaq	-32(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addq	$-1, -32(%rbp)
	je	.LBB6_6
.LBB6_4:                                # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	leaq	1(%rax), %rcx
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rcx, -16(%rbp)
	movzbl	(%rax), %eax
	movq	-8(%rbp), %rcx
	leaq	(%rcx), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%al, (%rcx)
	testb	%al, %al
	jne	.LBB6_5
.LBB6_6:
	movq	-8(%rbp), %rax
	leaq	(%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$0, (%rax)
.LBB6_7:
	movq	-24(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end6:
	.size	strncat, .Lfunc_end6-strncat
                                        # -- End function
	.globl	nw_align                # -- Begin function nw_align
	.p2align	4, 0x90
	.type	nw_align,@function
nw_align:                               # @nw_align
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	subq	$128, %rsp
	leaq	-104(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdi, -104(%rbp)
	leaq	-96(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rsi, -96(%rbp)
	leaq	-72(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdx, -72(%rbp)
	leaq	-64(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rcx, -64(%rbp)
	leaq	-56(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%r8, -56(%rbp)
	leaq	-48(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%r9, -48(%rbp)
	leaq	-84(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -84(%rbp)
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -40(%rbp)
	leaq	-36(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -36(%rbp)
	leaq	-28(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -28(%rbp)
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -24(%rbp)
	leaq	-112(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$2, -112(%rbp)
	leaq	-108(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$-1, -108(%rbp)
	movq	%rdx, %rdi
	callq	my_strlen
	leaq	-80(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -80(%rbp)
	movq	-64(%rbp), %rdi
	callq	my_strlen
	leaq	-76(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -76(%rbp)
	leaq	-28(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$1, -28(%rbp)
	leaq	-30(%rbp), %r14
	jmp	.LBB7_1
	.p2align	4, 0x90
.LBB7_17:                               #   in Loop: Header=BB7_1 Depth=1
	leaq	-28(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -28(%rbp)
.LBB7_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_3 Depth 2
	movl	-28(%rbp), %eax
	cmpl	-76(%rbp), %eax
	jg	.LBB7_18
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$1, -24(%rbp)
	jmp	.LBB7_3
.LBB7_15:                               #   in Loop: Header=BB7_3 Depth=2
	leaq	-36(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$3, -36(%rbp)
	.p2align	4, 0x90
.LBB7_16:                               #   in Loop: Header=BB7_3 Depth=2
	movq	-104(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	-8(%rax,%rcx,8), %rdx
	movslq	-24(%rbp), %rbx
	movl	(%rdx,%rbx,4), %edi
	movl	16(%rbp), %r8d
	subl	%r8d, %edi
	leaq	-124(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%edi, -124(%rbp)
	movq	-8(%rax,%rcx,8), %rdx
	movl	-4(%rdx,%rbx,4), %esi
	movslq	-36(%rbp), %r9
	movslq	-40(%rbp), %rdx
	shlq	$4, %rdx
	addl	nw_align.s(%rdx,%r9,4), %esi
	leaq	-120(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%esi, -120(%rbp)
	movq	(%rax,%rcx,8), %rax
	movl	-4(%rax,%rbx,4), %edx
	subl	%r8d, %edx
	leaq	-116(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%edx, -116(%rbp)
	movq	%r14, %rcx
	callq	max
	movslq	-24(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	movq	-104(%rbp), %rsi
	movq	(%rsi,%rdx,8), %rdx
	leaq	(%rdx,%rcx,4), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, (%rdx,%rcx,4)
	movzbl	-30(%rbp), %eax
	movslq	-24(%rbp), %rcx
	movslq	-28(%rbp), %rdx
	movq	-96(%rbp), %rsi
	movq	(%rsi,%rdx,8), %rdx
	leaq	(%rdx,%rcx), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%al, (%rdx,%rcx)
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -24(%rbp)
.LBB7_3:                                #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-24(%rbp), %eax
	cmpl	-80(%rbp), %eax
	jg	.LBB7_17
# %bb.4:                                #   in Loop: Header=BB7_3 Depth=2
	movslq	-24(%rbp), %rax
	movq	-72(%rbp), %rcx
	movsbl	-1(%rax,%rcx), %eax
	leaq	-29(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%al, -29(%rbp)
	addl	$-65, %eax
	cmpl	$19, %eax
	ja	.LBB7_10
# %bb.5:                                #   in Loop: Header=BB7_3 Depth=2
	jmpq	*.LJTI7_0(,%rax,8)
.LBB7_6:                                #   in Loop: Header=BB7_3 Depth=2
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -40(%rbp)
	jmp	.LBB7_10
.LBB7_7:                                #   in Loop: Header=BB7_3 Depth=2
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$1, -40(%rbp)
	jmp	.LBB7_10
.LBB7_8:                                #   in Loop: Header=BB7_3 Depth=2
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$2, -40(%rbp)
	jmp	.LBB7_10
.LBB7_9:                                #   in Loop: Header=BB7_3 Depth=2
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$3, -40(%rbp)
	.p2align	4, 0x90
.LBB7_10:                               #   in Loop: Header=BB7_3 Depth=2
	movslq	-28(%rbp), %rax
	movq	-64(%rbp), %rcx
	movsbl	-1(%rax,%rcx), %eax
	leaq	-29(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%al, -29(%rbp)
	addl	$-65, %eax
	cmpl	$19, %eax
	ja	.LBB7_16
# %bb.11:                               #   in Loop: Header=BB7_3 Depth=2
	jmpq	*.LJTI7_1(,%rax,8)
.LBB7_12:                               #   in Loop: Header=BB7_3 Depth=2
	leaq	-36(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -36(%rbp)
	jmp	.LBB7_16
.LBB7_13:                               #   in Loop: Header=BB7_3 Depth=2
	leaq	-36(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$1, -36(%rbp)
	jmp	.LBB7_16
.LBB7_14:                               #   in Loop: Header=BB7_3 Depth=2
	leaq	-36(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$2, -36(%rbp)
	jmp	.LBB7_16
.LBB7_18:
	leaq	-28(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$-1, -28(%rbp)
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$-1, -24(%rbp)
	leaq	-18(%rbp), %rbx
	jmp	.LBB7_19
	.p2align	4, 0x90
.LBB7_27:                               #   in Loop: Header=BB7_19 Depth=1
	movslq	-24(%rbp), %rax
	movq	-72(%rbp), %rcx
	movzbl	-1(%rax,%rcx), %eax
	leaq	-18(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%al, -18(%rbp)
	leaq	-17(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$0, -17(%rbp)
	movq	-56(%rbp), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	callq	strncat
	movq	-48(%rbp), %rdi
	movl	$.L.str, %esi
	movl	$1, %edx
	callq	strncat
.LBB7_28:                               #   in Loop: Header=BB7_19 Depth=1
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$-1, -24(%rbp)
.LBB7_29:                               #   in Loop: Header=BB7_19 Depth=1
	leaq	-84(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -84(%rbp)
.LBB7_19:                               # =>This Inner Loop Header: Depth=1
	movb	$1, %al
	cmpl	$0, -28(%rbp)
	jg	.LBB7_21
# %bb.20:                               #   in Loop: Header=BB7_19 Depth=1
	cmpl	$0, -24(%rbp)
	setg	%al
.LBB7_21:                               #   in Loop: Header=BB7_19 Depth=1
	testb	%al, %al
	je	.LBB7_30
# %bb.22:                               #   in Loop: Header=BB7_19 Depth=1
	movslq	-24(%rbp), %rax
	movslq	-28(%rbp), %rcx
	movq	-96(%rbp), %rdx
	movq	(%rdx,%rcx,8), %rcx
	movsbl	(%rcx,%rax), %eax
	cmpl	$45, %eax
	je	.LBB7_27
# %bb.23:                               #   in Loop: Header=BB7_19 Depth=1
	cmpl	$92, %eax
	je	.LBB7_26
# %bb.24:                               #   in Loop: Header=BB7_19 Depth=1
	cmpl	$124, %eax
	jne	.LBB7_29
# %bb.25:                               #   in Loop: Header=BB7_19 Depth=1
	movq	-56(%rbp), %rdi
	movl	$.L.str, %esi
	movl	$1, %edx
	callq	strncat
	movslq	-28(%rbp), %rax
	movq	-64(%rbp), %rcx
	movzbl	-1(%rax,%rcx), %eax
	leaq	-18(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%al, -18(%rbp)
	leaq	-17(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$0, -17(%rbp)
	movq	-48(%rbp), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	callq	strncat
	leaq	-28(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$-1, -28(%rbp)
	leaq	-84(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -84(%rbp)
	jmp	.LBB7_19
	.p2align	4, 0x90
.LBB7_26:                               #   in Loop: Header=BB7_19 Depth=1
	movslq	-24(%rbp), %rax
	movq	-72(%rbp), %rcx
	movzbl	-1(%rax,%rcx), %eax
	leaq	-18(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%al, -18(%rbp)
	leaq	-17(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$0, -17(%rbp)
	movq	-56(%rbp), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	callq	strncat
	movslq	-28(%rbp), %rax
	movq	-64(%rbp), %rcx
	movzbl	-1(%rax,%rcx), %eax
	leaq	-18(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	%al, -18(%rbp)
	leaq	-17(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$0, -17(%rbp)
	movq	-48(%rbp), %rdi
	movl	$1, %edx
	movq	%rbx, %rsi
	callq	strncat
	leaq	-28(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$-1, -28(%rbp)
	jmp	.LBB7_28
.LBB7_30:
	movq	-56(%rbp), %rdi
	callq	strrev
	leaq	-144(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -144(%rbp)
	movq	-48(%rbp), %rdi
	callq	strrev
	leaq	-136(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -136(%rbp)
	xorl	%eax, %eax
	addq	$128, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end7:
	.size	nw_align, .Lfunc_end7-nw_align
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI7_0:
	.quad	.LBB7_6
	.quad	.LBB7_10
	.quad	.LBB7_7
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_8
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_10
	.quad	.LBB7_9
.LJTI7_1:
	.quad	.LBB7_12
	.quad	.LBB7_16
	.quad	.LBB7_13
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_14
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_16
	.quad	.LBB7_15
                                        # -- End function
	.text
	.globl	Ecall_nw                # -- Begin function Ecall_nw
	.p2align	4, 0x90
	.type	Ecall_nw,@function
Ecall_nw:                               # @Ecall_nw
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	leaq	-56(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdi, -56(%rbp)
	leaq	-48(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rsi, -48(%rbp)
	leaq	-72(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rdx, -72(%rbp)
	leaq	-64(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rcx, -64(%rbp)
	leaq	-20(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$2, -20(%rbp)
	callq	my_strlen
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -16(%rbp)
	movq	-48(%rbp), %rdi
	callq	my_strlen
	leaq	-4(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -4(%rbp)
	cltq
	leaq	8(,%rax,8), %rdi
	callq	malloc
	leaq	-40(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -40(%rbp)
	leaq	-12(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -12(%rbp)
	.p2align	4, 0x90
.LBB8_1:                                # =>This Inner Loop Header: Depth=1
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.LBB8_3
# %bb.2:                                #   in Loop: Header=BB8_1 Depth=1
	movslq	-16(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc
	movslq	-12(%rbp), %rcx
	movq	-40(%rbp), %rdx
	leaq	(%rdx,%rcx,8), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, (%rdx,%rcx,8)
	leaq	-12(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -12(%rbp)
	jmp	.LBB8_1
.LBB8_3:
	movslq	-4(%rbp), %rax
	leaq	8(,%rax,8), %rdi
	callq	malloc
	leaq	-32(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -32(%rbp)
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	$0, -8(%rbp)
	.p2align	4, 0x90
.LBB8_4:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.LBB8_6
# %bb.5:                                #   in Loop: Header=BB8_4 Depth=1
	movslq	-16(%rbp), %rdi
	callq	malloc
	movslq	-8(%rbp), %rcx
	movq	-32(%rbp), %rdx
	leaq	(%rdx,%rcx,8), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, (%rdx,%rcx,8)
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	addl	$1, -8(%rbp)
	jmp	.LBB8_4
.LBB8_6:
	movq	-40(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movl	-16(%rbp), %edx
	movl	-4(%rbp), %ecx
	movl	-20(%rbp), %r8d
	callq	dpm_init
	movq	-72(%rbp), %rax
	leaq	(%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$0, (%rax)
	movq	-64(%rbp), %rax
	leaq	(%rax), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$0, (%rax)
	movq	-40(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	-72(%rbp), %r8
	movq	-64(%rbp), %r9
	movl	-20(%rbp), %eax
	leaq	(%rsp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, (%rsp)
	callq	nw_align
	leaq	-76(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movl	%eax, -76(%rbp)
	testl	%eax, %eax
	jne	.LBB8_8
# %bb.7:
	movq	-40(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rdx
	callq	print_matrix
	movq	-32(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	-48(%rbp), %rdx
	callq	print_traceback
.LBB8_8:
	addq	$96, %rsp
	popq	%rbp
	retq
.Lfunc_end8:
	.size	Ecall_nw, .Lfunc_end8-Ecall_nw
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$144, %rsp
	movabsq	$4851581052769290049, %rax # imm = 0x4354474341544741
	leaq	-16(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -16(%rbp)
	leaq	-8(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movb	$0, -8(%rbp)
	movabsq	$23722252546032449, %rax # imm = 0x54474354474341
	leaq	-24(%rbp), %rax
	cmpq	$12121, %rax            # imm = 0x2F59
	cmpq	$12121, %rax            # imm = 0x2F59
	movq	%rax, -24(%rbp)
	leaq	-16(%rbp), %rdi
	leaq	-24(%rbp), %rsi
	leaq	-144(%rbp), %rdx
	leaq	-80(%rbp), %rcx
	callq	Ecall_nw
	xorl	%edi, %edi
	callq	exit
.Lfunc_end9:
	.size	enclave_main, .Lfunc_end9-enclave_main
                                        # -- End function
	.type	nw_align.s,@object      # @nw_align.s
	.section	.rodata,"a",@progbits
	.p2align	4
nw_align.s:
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
	.size	nw_align.s, 64

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"-"
	.size	.L.str, 2

	.type	.Lenclave_main.seq_1,@object # @enclave_main.seq_1
.Lenclave_main.seq_1:
	.asciz	"AGTACGTC"
	.size	.Lenclave_main.seq_1, 9

	.type	.Lenclave_main.seq_2,@object # @enclave_main.seq_2
.Lenclave_main.seq_2:
	.asciz	"ACGTCGT"
	.size	.Lenclave_main.seq_2, 8


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
