	.text
	.file	"nw4test.c"
	.globl	max
	.p2align	4, 0x90
	.type	max,@function
max:                                    # @max
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movq	%rcx, -24(%rbp)
	movl	$0, -28(%rbp)
	movl	-4(%rbp), %edx
	cmpl	-8(%rbp), %edx
	jl	.LBB0_3
# BB#1:                                 # %land.lhs.true
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jl	.LBB0_3
# BB#2:                                 # %if.then
	movl	-4(%rbp), %eax
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rcx
	movb	$124, (%rcx)
	jmp	.LBB0_7
.LBB0_3:                                # %if.else
	movl	-8(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.LBB0_5
# BB#4:                                 # %if.then3
	movl	-8(%rbp), %eax
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rcx
	movb	$92, (%rcx)
	jmp	.LBB0_6
.LBB0_5:                                # %if.else4
	movl	-12(%rbp), %eax
	movl	%eax, -28(%rbp)
	movq	-24(%rbp), %rcx
	movb	$45, (%rcx)
.LBB0_6:                                # %if.end
	jmp	.LBB0_7
.LBB0_7:                                # %if.end5
	movl	-28(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end0:
	.size	max, .Lfunc_end0-max

	.globl	dpm_init
	.p2align	4, 0x90
	.type	dpm_init,@function
dpm_init:                               # @dpm_init
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movl	%ecx, -24(%rbp)
	movl	%r8d, -28(%rbp)
	movq	-8(%rbp), %rsi
	movq	(%rsi), %rsi
	movl	$0, (%rsi)
	movq	-16(%rbp), %rsi
	movq	(%rsi), %rsi
	movb	$110, (%rsi)
	movl	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movl	$1, -36(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jg	.LBB1_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	subl	-36(%rbp), %eax
	imull	-28(%rbp), %eax
	movq	-8(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-36(%rbp), %rdx
	movl	%eax, (%rcx,%rdx,4)
	movq	-16(%rbp), %rcx
	movq	(%rcx), %rcx
	movslq	-36(%rbp), %rdx
	movb	$45, (%rcx,%rdx)
# BB#3:                                 # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB1_1
.LBB1_4:                                # %for.end
	movl	$1, -32(%rbp)
.LBB1_5:                                # %for.cond9
                                        # =>This Inner Loop Header: Depth=1
	movl	-32(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jg	.LBB1_8
# BB#6:                                 # %for.body11
                                        #   in Loop: Header=BB1_5 Depth=1
	xorl	%eax, %eax
	subl	-32(%rbp), %eax
	imull	-28(%rbp), %eax
	movq	-8(%rbp), %rcx
	movslq	-32(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	movl	%eax, (%rcx)
	movq	-16(%rbp), %rcx
	movslq	-32(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rcx
	movb	$124, (%rcx)
# BB#7:                                 # %for.inc20
                                        #   in Loop: Header=BB1_5 Depth=1
	movl	-32(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -32(%rbp)
	jmp	.LBB1_5
.LBB1_8:                                # %for.end22
	popq	%rbp
	retq
.Lfunc_end1:
	.size	dpm_init, .Lfunc_end1-dpm_init

	.globl	my_strlen
	.p2align	4, 0x90
	.type	my_strlen,@function
my_strlen:                              # @my_strlen
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-16(%rbp), %rax
	cmpb	$0, (%rax)
	je	.LBB2_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_3
.LBB2_3:                                # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movq	-16(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.LBB2_1
.LBB2_4:                                # %for.end
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rcx
	subq	%rcx, %rax
	popq	%rbp
	retq
.Lfunc_end2:
	.size	my_strlen, .Lfunc_end2-my_strlen

	.globl	print_matrix
	.p2align	4, 0x90
	.type	print_matrix,@function
print_matrix:                           # @print_matrix
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	my_strlen@PLT
	movl	%eax, %ecx
	movl	%ecx, -28(%rbp)
	movq	-24(%rbp), %rdi
	callq	my_strlen@PLT
	movl	%eax, %ecx
	movl	%ecx, -32(%rbp)
	movl	$0, -36(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB3_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_3
.LBB3_3:                                # %for.inc
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB3_1
.LBB3_4:                                # %for.end
	movl	$0, -40(%rbp)
.LBB3_5:                                # %for.cond4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_9 Depth 2
	movl	-40(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jg	.LBB3_14
# BB#6:                                 # %for.body7
                                        #   in Loop: Header=BB3_5 Depth=1
	cmpl	$0, -40(%rbp)
	jle	.LBB3_8
# BB#7:                                 # %if.then
                                        #   in Loop: Header=BB3_5 Depth=1
	jmp	.LBB3_8
.LBB3_8:                                # %if.end
                                        #   in Loop: Header=BB3_5 Depth=1
	movl	$0, -44(%rbp)
.LBB3_9:                                # %for.cond11
                                        #   Parent Loop BB3_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-44(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jg	.LBB3_12
# BB#10:                                # %for.body14
                                        #   in Loop: Header=BB3_9 Depth=2
	jmp	.LBB3_11
.LBB3_11:                               # %for.inc15
                                        #   in Loop: Header=BB3_9 Depth=2
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB3_9
.LBB3_12:                               # %for.end17
                                        #   in Loop: Header=BB3_5 Depth=1
	jmp	.LBB3_13
.LBB3_13:                               # %for.inc18
                                        #   in Loop: Header=BB3_5 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB3_5
.LBB3_14:                               # %for.end20
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end3:
	.size	print_matrix, .Lfunc_end3-print_matrix

	.globl	print_traceback
	.p2align	4, 0x90
	.type	print_traceback,@function
print_traceback:                        # @print_traceback
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-16(%rbp), %rdi
	callq	my_strlen@PLT
	movl	%eax, %ecx
	movl	%ecx, -28(%rbp)
	movq	-24(%rbp), %rdi
	callq	my_strlen@PLT
	movl	%eax, %ecx
	movl	%ecx, -32(%rbp)
	movl	$0, -36(%rbp)
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.LBB4_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_3
.LBB4_3:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-36(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB4_1
.LBB4_4:                                # %for.end
	movl	$0, -40(%rbp)
.LBB4_5:                                # %for.cond4
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_9 Depth 2
	movl	-40(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jg	.LBB4_14
# BB#6:                                 # %for.body7
                                        #   in Loop: Header=BB4_5 Depth=1
	cmpl	$0, -40(%rbp)
	jle	.LBB4_8
# BB#7:                                 # %if.then
                                        #   in Loop: Header=BB4_5 Depth=1
	jmp	.LBB4_8
.LBB4_8:                                # %if.end
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	$0, -44(%rbp)
.LBB4_9:                                # %for.cond11
                                        #   Parent Loop BB4_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-44(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jg	.LBB4_12
# BB#10:                                # %for.body14
                                        #   in Loop: Header=BB4_9 Depth=2
	jmp	.LBB4_11
.LBB4_11:                               # %for.inc15
                                        #   in Loop: Header=BB4_9 Depth=2
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB4_9
.LBB4_12:                               # %for.end17
                                        #   in Loop: Header=BB4_5 Depth=1
	jmp	.LBB4_13
.LBB4_13:                               # %for.inc18
                                        #   in Loop: Header=BB4_5 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB4_5
.LBB4_14:                               # %for.end20
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end4:
	.size	print_traceback, .Lfunc_end4-print_traceback

	.globl	strrev
	.p2align	4, 0x90
	.type	strrev,@function
strrev:                                 # @strrev
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movq	%rdi, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.LBB5_2
# BB#1:                                 # %lor.lhs.false
	movq	-16(%rbp), %rax
	cmpb	$0, (%rax)
	jne	.LBB5_3
.LBB5_2:                                # %if.then
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.LBB5_8
.LBB5_3:                                # %if.end
	movq	-16(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	-16(%rbp), %rdi
	movq	%rax, -40(%rbp)         # 8-byte Spill
	callq	my_strlen@PLT
	movq	-40(%rbp), %rdi         # 8-byte Reload
	addq	%rax, %rdi
	addq	$-1, %rdi
	movq	%rdi, -32(%rbp)
.LBB5_4:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jbe	.LBB5_7
# BB#5:                                 # %for.body
                                        #   in Loop: Header=BB5_4 Depth=1
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movsbl	(%rax), %edx
	xorl	%ecx, %edx
	movb	%dl, %sil
	movb	%sil, (%rax)
	movq	-24(%rbp), %rax
	movsbl	(%rax), %ecx
	movq	-32(%rbp), %rax
	movsbl	(%rax), %edx
	xorl	%ecx, %edx
	movb	%dl, %sil
	movb	%sil, (%rax)
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	movq	-24(%rbp), %rax
	movsbl	(%rax), %edx
	xorl	%ecx, %edx
	movb	%dl, %sil
	movb	%sil, (%rax)
# BB#6:                                 # %for.inc
                                        #   in Loop: Header=BB5_4 Depth=1
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	movq	-32(%rbp), %rax
	addq	$-1, %rax
	movq	%rax, -32(%rbp)
	jmp	.LBB5_4
.LBB5_7:                                # %for.end
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
.LBB5_8:                                # %return
	movq	-8(%rbp), %rax
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end5:
	.size	strrev, .Lfunc_end5-strrev

	.globl	strncat
	.p2align	4, 0x90
	.type	strncat,@function
strncat:                                # @strncat
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.LBB6_10
# BB#1:                                 # %if.then
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -40(%rbp)
.LBB6_2:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movq	-32(%rbp), %rax
	movsbl	(%rax), %ecx
	cmpl	$0, %ecx
	je	.LBB6_4
# BB#3:                                 # %while.body
                                        #   in Loop: Header=BB6_2 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	jmp	.LBB6_2
.LBB6_4:                                # %while.end
	jmp	.LBB6_5
.LBB6_5:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	movq	-40(%rbp), %rax
	movq	%rax, %rcx
	addq	$1, %rcx
	movq	%rcx, -40(%rbp)
	movb	(%rax), %dl
	movq	-32(%rbp), %rax
	movb	%dl, (%rax)
	movsbl	%dl, %esi
	cmpl	$0, %esi
	jne	.LBB6_7
# BB#6:                                 # %if.then7
	jmp	.LBB6_9
.LBB6_7:                                # %if.end
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
# BB#8:                                 # %do.cond
                                        #   in Loop: Header=BB6_5 Depth=1
	movq	-24(%rbp), %rax
	addq	$-1, %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, %rax
	jne	.LBB6_5
.LBB6_9:                                # %do.end
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
.LBB6_10:                               # %if.end11
	movq	-8(%rbp), %rax
	popq	%rbp
	retq
.Lfunc_end6:
	.size	strncat, .Lfunc_end6-strncat

	.globl	nw_align
	.p2align	4, 0x90
	.type	nw_align,@function
nw_align:                               # @nw_align
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$240, %rsp
	movl	16(%rbp), %eax
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movl	%eax, -52(%rbp)
	movl	$0, -56(%rbp)
	movl	$0, -60(%rbp)
	movl	$0, -64(%rbp)
	movl	$0, -84(%rbp)
	movl	$0, -88(%rbp)
	movl	$2, -92(%rbp)
	movl	$-1, -96(%rbp)
	movq	-24(%rbp), %rdi
	callq	my_strlen@PLT
	movl	%eax, %r10d
	movl	%r10d, -100(%rbp)
	movq	-32(%rbp), %rdi
	callq	my_strlen@PLT
	movl	%eax, %r10d
	movl	%r10d, -104(%rbp)
	movl	$1, -84(%rbp)
.LBB7_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_3 Depth 2
	movl	-84(%rbp), %eax
	cmpl	-104(%rbp), %eax
	jg	.LBB7_18
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	$1, -88(%rbp)
.LBB7_3:                                # %for.cond4
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-88(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jg	.LBB7_16
# BB#4:                                 # %for.body7
                                        #   in Loop: Header=BB7_3 Depth=2
	movq	-24(%rbp), %rax
	movl	-88(%rbp), %ecx
	decl	%ecx
	movslq	%ecx, %rdx
	movb	(%rax,%rdx), %sil
	movb	%sil, -78(%rbp)
	movsbl	-78(%rbp), %ecx
	movl	%ecx, %edi
	subl	$65, %edi
	movl	%ecx, -132(%rbp)        # 4-byte Spill
	movl	%edi, -136(%rbp)        # 4-byte Spill
	je	.LBB7_5
	jmp	.LBB7_30
.LBB7_30:                               # %for.body7
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	-132(%rbp), %eax        # 4-byte Reload
	subl	$67, %eax
	movl	%eax, -140(%rbp)        # 4-byte Spill
	je	.LBB7_6
	jmp	.LBB7_31
.LBB7_31:                               # %for.body7
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	-132(%rbp), %eax        # 4-byte Reload
	subl	$71, %eax
	movl	%eax, -144(%rbp)        # 4-byte Spill
	je	.LBB7_7
	jmp	.LBB7_32
.LBB7_32:                               # %for.body7
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	-132(%rbp), %eax        # 4-byte Reload
	subl	$84, %eax
	movl	%eax, -148(%rbp)        # 4-byte Spill
	je	.LBB7_8
	jmp	.LBB7_9
.LBB7_5:                                # %sw.bb
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	$0, -60(%rbp)
	jmp	.LBB7_9
.LBB7_6:                                # %sw.bb9
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	$1, -60(%rbp)
	jmp	.LBB7_9
.LBB7_7:                                # %sw.bb10
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	$2, -60(%rbp)
	jmp	.LBB7_9
.LBB7_8:                                # %sw.bb11
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	$3, -60(%rbp)
.LBB7_9:                                # %sw.epilog
                                        #   in Loop: Header=BB7_3 Depth=2
	movq	-32(%rbp), %rax
	movl	-84(%rbp), %ecx
	decl	%ecx
	movslq	%ecx, %rdx
	movb	(%rax,%rdx), %sil
	movb	%sil, -78(%rbp)
	movsbl	-78(%rbp), %ecx
	movl	%ecx, %edi
	subl	$65, %edi
	movl	%ecx, -152(%rbp)        # 4-byte Spill
	movl	%edi, -156(%rbp)        # 4-byte Spill
	je	.LBB7_10
	jmp	.LBB7_33
.LBB7_33:                               # %sw.epilog
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	-152(%rbp), %eax        # 4-byte Reload
	subl	$67, %eax
	movl	%eax, -160(%rbp)        # 4-byte Spill
	je	.LBB7_11
	jmp	.LBB7_34
.LBB7_34:                               # %sw.epilog
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	-152(%rbp), %eax        # 4-byte Reload
	subl	$71, %eax
	movl	%eax, -164(%rbp)        # 4-byte Spill
	je	.LBB7_12
	jmp	.LBB7_35
.LBB7_35:                               # %sw.epilog
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	-152(%rbp), %eax        # 4-byte Reload
	subl	$84, %eax
	movl	%eax, -168(%rbp)        # 4-byte Spill
	je	.LBB7_13
	jmp	.LBB7_14
.LBB7_10:                               # %sw.bb16
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	$0, -64(%rbp)
	jmp	.LBB7_14
.LBB7_11:                               # %sw.bb17
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	$1, -64(%rbp)
	jmp	.LBB7_14
.LBB7_12:                               # %sw.bb18
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	$2, -64(%rbp)
	jmp	.LBB7_14
.LBB7_13:                               # %sw.bb19
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	$3, -64(%rbp)
.LBB7_14:                               # %sw.epilog20
                                        #   in Loop: Header=BB7_3 Depth=2
	leaq	-77(%rbp), %rcx
	leaq	nw_align.s(%rip), %rax
	movq	-8(%rbp), %rdx
	movl	-84(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdi
	movq	(%rdx,%rdi,8), %rdx
	movslq	-88(%rbp), %rdi
	movl	(%rdx,%rdi,4), %esi
	subl	-52(%rbp), %esi
	movl	%esi, -68(%rbp)
	movq	-8(%rbp), %rdx
	movl	-84(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdi
	movq	(%rdx,%rdi,8), %rdx
	movl	-88(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdi
	movl	(%rdx,%rdi,4), %esi
	movslq	-60(%rbp), %rdx
	shlq	$4, %rdx
	addq	%rdx, %rax
	movslq	-64(%rbp), %rdx
	addl	(%rax,%rdx,4), %esi
	movl	%esi, -72(%rbp)
	movq	-8(%rbp), %rax
	movslq	-84(%rbp), %rdx
	movq	(%rax,%rdx,8), %rax
	movl	-88(%rbp), %esi
	subl	$1, %esi
	movslq	%esi, %rdx
	movl	(%rax,%rdx,4), %esi
	subl	-52(%rbp), %esi
	movl	%esi, -76(%rbp)
	movl	-68(%rbp), %edi
	movl	-72(%rbp), %esi
	movl	-76(%rbp), %edx
	callq	max@PLT
	movq	-8(%rbp), %rcx
	movslq	-84(%rbp), %r8
	movq	(%rcx,%r8,8), %rcx
	movslq	-88(%rbp), %r8
	movl	%eax, (%rcx,%r8,4)
	movb	-77(%rbp), %r9b
	movq	-16(%rbp), %rcx
	movslq	-84(%rbp), %r8
	movq	(%rcx,%r8,8), %rcx
	movslq	-88(%rbp), %r8
	movb	%r9b, (%rcx,%r8)
# BB#15:                                # %for.inc
                                        #   in Loop: Header=BB7_3 Depth=2
	movl	-88(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -88(%rbp)
	jmp	.LBB7_3
.LBB7_16:                               # %for.end
                                        #   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_17
.LBB7_17:                               # %for.inc52
                                        #   in Loop: Header=BB7_1 Depth=1
	movl	-84(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -84(%rbp)
	jmp	.LBB7_1
.LBB7_18:                               # %for.end54
	movl	-84(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -84(%rbp)
	movl	-88(%rbp), %eax
	addl	$-1, %eax
	movl	%eax, -88(%rbp)
.LBB7_19:                               # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movb	$1, %al
	cmpl	$0, -84(%rbp)
	movb	%al, -169(%rbp)         # 1-byte Spill
	jg	.LBB7_21
# BB#20:                                # %lor.rhs
                                        #   in Loop: Header=BB7_19 Depth=1
	cmpl	$0, -88(%rbp)
	setg	%al
	movb	%al, -169(%rbp)         # 1-byte Spill
.LBB7_21:                               # %lor.end
                                        #   in Loop: Header=BB7_19 Depth=1
	movb	-169(%rbp), %al         # 1-byte Reload
	testb	$1, %al
	jne	.LBB7_22
	jmp	.LBB7_27
.LBB7_22:                               # %while.body
                                        #   in Loop: Header=BB7_19 Depth=1
	movq	-16(%rbp), %rax
	movslq	-84(%rbp), %rcx
	movq	(%rax,%rcx,8), %rax
	movslq	-88(%rbp), %rcx
	movsbl	(%rax,%rcx), %edx
	movl	%edx, %esi
	subl	$45, %esi
	movl	%edx, -176(%rbp)        # 4-byte Spill
	movl	%esi, -180(%rbp)        # 4-byte Spill
	je	.LBB7_25
	jmp	.LBB7_28
.LBB7_28:                               # %while.body
                                        #   in Loop: Header=BB7_19 Depth=1
	movl	-176(%rbp), %eax        # 4-byte Reload
	subl	$92, %eax
	movl	%eax, -184(%rbp)        # 4-byte Spill
	je	.LBB7_24
	jmp	.LBB7_29
.LBB7_29:                               # %while.body
                                        #   in Loop: Header=BB7_19 Depth=1
	movl	-176(%rbp), %eax        # 4-byte Reload
	subl	$124, %eax
	movl	%eax, -188(%rbp)        # 4-byte Spill
	jne	.LBB7_26
	jmp	.LBB7_23
.LBB7_23:                               # %sw.bb65
                                        #   in Loop: Header=BB7_19 Depth=1
	leaq	.L.str(%rip), %rsi
	movl	$1, %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rdi
	callq	strncat@PLT
	movl	$1, %ecx
	movl	%ecx, %edx
	leaq	-106(%rbp), %rsi
	movq	-32(%rbp), %rdi
	movl	-84(%rbp), %ecx
	subl	$1, %ecx
	movslq	%ecx, %r8
	movb	(%rdi,%r8), %r9b
	movb	%r9b, -106(%rbp)
	movb	$0, -105(%rbp)
	movq	-48(%rbp), %rdi
	movq	%rax, -200(%rbp)        # 8-byte Spill
	callq	strncat@PLT
	movl	-84(%rbp), %ecx
	addl	$-1, %ecx
	movl	%ecx, -84(%rbp)
	movq	%rax, -208(%rbp)        # 8-byte Spill
	jmp	.LBB7_26
.LBB7_24:                               # %sw.bb74
                                        #   in Loop: Header=BB7_19 Depth=1
	movl	$1, %eax
	movl	%eax, %edx
	leaq	-106(%rbp), %rsi
	movq	-24(%rbp), %rcx
	movl	-88(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdi
	movb	(%rcx,%rdi), %r8b
	movb	%r8b, -106(%rbp)
	movb	$0, -105(%rbp)
	movq	-40(%rbp), %rdi
	callq	strncat@PLT
	movl	$1, %r9d
	movl	%r9d, %edx
	leaq	-106(%rbp), %rsi
	movq	-32(%rbp), %rcx
	movl	-84(%rbp), %r9d
	subl	$1, %r9d
	movslq	%r9d, %rdi
	movb	(%rcx,%rdi), %r8b
	movb	%r8b, -106(%rbp)
	movb	$0, -105(%rbp)
	movq	-48(%rbp), %rdi
	movq	%rax, -216(%rbp)        # 8-byte Spill
	callq	strncat@PLT
	movl	-84(%rbp), %r9d
	addl	$-1, %r9d
	movl	%r9d, -84(%rbp)
	movl	-88(%rbp), %r9d
	addl	$-1, %r9d
	movl	%r9d, -88(%rbp)
	movq	%rax, -224(%rbp)        # 8-byte Spill
	jmp	.LBB7_26
.LBB7_25:                               # %sw.bb91
                                        #   in Loop: Header=BB7_19 Depth=1
	movl	$1, %eax
	movl	%eax, %edx
	leaq	-106(%rbp), %rsi
	movq	-24(%rbp), %rcx
	movl	-88(%rbp), %eax
	subl	$1, %eax
	movslq	%eax, %rdi
	movb	(%rcx,%rdi), %r8b
	movb	%r8b, -106(%rbp)
	movb	$0, -105(%rbp)
	movq	-40(%rbp), %rdi
	callq	strncat@PLT
	leaq	.L.str(%rip), %rsi
	movl	$1, %r9d
	movl	%r9d, %edx
	movq	-48(%rbp), %rdi
	movq	%rax, -232(%rbp)        # 8-byte Spill
	callq	strncat@PLT
	movl	-88(%rbp), %r9d
	addl	$-1, %r9d
	movl	%r9d, -88(%rbp)
	movq	%rax, -240(%rbp)        # 8-byte Spill
.LBB7_26:                               # %sw.epilog101
                                        #   in Loop: Header=BB7_19 Depth=1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB7_19
.LBB7_27:                               # %while.end
	movq	-40(%rbp), %rdi
	callq	strrev@PLT
	movq	%rax, -120(%rbp)
	movq	-48(%rbp), %rdi
	callq	strrev@PLT
	xorl	%ecx, %ecx
	movq	%rax, -128(%rbp)
	movl	%ecx, %eax
	addq	$240, %rsp
	popq	%rbp
	retq
.Lfunc_end7:
	.size	nw_align, .Lfunc_end7-nw_align

	.globl	Ecall_nw
	.p2align	4, 0x90
	.type	Ecall_nw,@function
Ecall_nw:                               # @Ecall_nw
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$96, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movl	$2, -36(%rbp)
	movq	-8(%rbp), %rdi
	callq	my_strlen@PLT
	movl	%eax, %r8d
	movl	%r8d, -40(%rbp)
	movq	-16(%rbp), %rdi
	callq	my_strlen@PLT
	movl	%eax, %r8d
	movl	%r8d, -44(%rbp)
	movl	-44(%rbp), %r8d
	addl	$1, %r8d
	movslq	%r8d, %rax
	shlq	$3, %rax
	movq	%rax, %rdi
	callq	malloc@PLT
	movq	%rax, -56(%rbp)
	movl	$0, -60(%rbp)
.LBB8_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-60(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jg	.LBB8_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB8_1 Depth=1
	movslq	-40(%rbp), %rax
	shlq	$2, %rax
	movq	%rax, %rdi
	callq	malloc@PLT
	movq	-56(%rbp), %rdi
	movslq	-60(%rbp), %rcx
	movq	%rax, (%rdi,%rcx,8)
# BB#3:                                 # %for.inc
                                        #   in Loop: Header=BB8_1 Depth=1
	movl	-60(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -60(%rbp)
	jmp	.LBB8_1
.LBB8_4:                                # %for.end
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rcx
	shlq	$3, %rcx
	movq	%rcx, %rdi
	callq	malloc@PLT
	movq	%rax, -72(%rbp)
	movl	$0, -76(%rbp)
.LBB8_5:                                # %for.cond14
                                        # =>This Inner Loop Header: Depth=1
	movl	-76(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jg	.LBB8_8
# BB#6:                                 # %for.body17
                                        #   in Loop: Header=BB8_5 Depth=1
	movslq	-40(%rbp), %rax
	shlq	$0, %rax
	movq	%rax, %rdi
	callq	malloc@PLT
	movq	-72(%rbp), %rdi
	movslq	-76(%rbp), %rcx
	movq	%rax, (%rdi,%rcx,8)
# BB#7:                                 # %for.inc23
                                        #   in Loop: Header=BB8_5 Depth=1
	movl	-76(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	jmp	.LBB8_5
.LBB8_8:                                # %for.end25
	movq	-56(%rbp), %rdi
	movq	-72(%rbp), %rsi
	movl	-40(%rbp), %edx
	movl	-44(%rbp), %ecx
	movl	-36(%rbp), %r8d
	callq	dpm_init@PLT
	movq	-24(%rbp), %rsi
	movb	$0, (%rsi)
	movq	-32(%rbp), %rsi
	movb	$0, (%rsi)
	movq	-56(%rbp), %rdi
	movq	-72(%rbp), %rsi
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-24(%rbp), %r8
	movq	-32(%rbp), %r9
	movl	-36(%rbp), %eax
	movl	%eax, (%rsp)
	callq	nw_align@PLT
	movl	%eax, -80(%rbp)
	cmpl	$0, -80(%rbp)
	jne	.LBB8_10
# BB#9:                                 # %if.then
	movq	-56(%rbp), %rdi
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdx
	callq	print_matrix@PLT
	movq	-72(%rbp), %rdi
	movq	-8(%rbp), %rsi
	movq	-16(%rbp), %rdx
	callq	print_traceback@PLT
.LBB8_10:                               # %if.end
	addq	$96, %rsp
	popq	%rbp
	retq
.Lfunc_end8:
	.size	Ecall_nw, .Lfunc_end8-Ecall_nw

	.globl	enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$144, %rsp
	leaq	-144(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	leaq	-17(%rbp), %rsi
	leaq	-9(%rbp), %rdi
	movq	.Lenclave_main.seq_1(%rip), %rax
	movq	%rax, -9(%rbp)
	movb	.Lenclave_main.seq_1+8(%rip), %r8b
	movb	%r8b, -1(%rbp)
	movq	.Lenclave_main.seq_2(%rip), %rax
	movq	%rax, -17(%rbp)
	callq	Ecall_nw@PLT
	xorl	%edi, %edi
	callq	exit@PLT
.Lfunc_end9:
	.size	enclave_main, .Lfunc_end9-enclave_main

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


	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
