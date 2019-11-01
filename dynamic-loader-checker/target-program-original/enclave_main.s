	.text
	.file	"bm_malloc_and_sort.c"
	.globl	sort
	.p2align	4, 0x90
	.type	sort,@function
sort:                                   # @sort
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %esi
	cmpl	-8(%rbp), %esi
	jl	.LBB0_2
# BB#1:                                 # %if.then
	jmp	.LBB0_9
.LBB0_2:                                # %if.end
	movq	objs@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, %edx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -24(%rbp)
	movl	-4(%rbp), %ecx
	movl	%ecx, -12(%rbp)
	movl	-4(%rbp), %ecx
	addl	$1, %ecx
	movl	%ecx, -16(%rbp)
.LBB0_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-16(%rbp), %eax
	cmpl	-8(%rbp), %eax
	ja	.LBB0_8
# BB#4:                                 # %for.body
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	objs@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %ecx
	movl	%ecx, %edx
	movq	(%rax,%rdx,8), %rax
	cmpq	-24(%rbp), %rax
	jae	.LBB0_6
# BB#5:                                 # %if.then5
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	objs_end@GOTPCREL(%rip), %rax
	movq	objs@GOTPCREL(%rip), %rcx
	movl	-12(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -12(%rbp)
	movq	(%rcx), %rsi
	movl	-16(%rbp), %edx
	movl	%edx, %edi
	movq	(%rsi,%rdi,8), %rsi
	movq	%rsi, -32(%rbp)
	movq	(%rcx), %rsi
	movl	-12(%rbp), %edx
	movl	%edx, %edi
	movq	(%rsi,%rdi,8), %rsi
	movq	(%rcx), %rdi
	movl	-16(%rbp), %edx
	movl	%edx, %r8d
	movq	%rsi, (%rdi,%r8,8)
	movq	-32(%rbp), %rsi
	movq	(%rcx), %rcx
	movl	-12(%rbp), %edx
	movl	%edx, %edi
	movq	%rsi, (%rcx,%rdi,8)
	movq	(%rax), %rcx
	movl	-16(%rbp), %edx
	movl	%edx, %esi
	movq	(%rcx,%rsi,8), %rcx
	movq	%rcx, -32(%rbp)
	movq	(%rax), %rcx
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movq	(%rcx,%rsi,8), %rcx
	movq	(%rax), %rsi
	movl	-16(%rbp), %edx
	movl	%edx, %edi
	movq	%rcx, (%rsi,%rdi,8)
	movq	-32(%rbp), %rcx
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movl	%edx, %esi
	movq	%rcx, (%rax,%rsi,8)
.LBB0_6:                                # %if.end22
                                        #   in Loop: Header=BB0_3 Depth=1
	jmp	.LBB0_7
.LBB0_7:                                # %for.inc
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	-16(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -16(%rbp)
	jmp	.LBB0_3
.LBB0_8:                                # %for.end
	movq	objs_end@GOTPCREL(%rip), %rax
	movq	objs@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rdx
	movl	-4(%rbp), %esi
	movl	%esi, %edi
	movq	(%rdx,%rdi,8), %rdx
	movq	%rdx, -32(%rbp)
	movq	(%rcx), %rdx
	movl	-12(%rbp), %esi
	movl	%esi, %edi
	movq	(%rdx,%rdi,8), %rdx
	movq	(%rcx), %rdi
	movl	-4(%rbp), %esi
	movl	%esi, %r8d
	movq	%rdx, (%rdi,%r8,8)
	movq	-32(%rbp), %rdx
	movq	(%rcx), %rcx
	movl	-12(%rbp), %esi
	movl	%esi, %edi
	movq	%rdx, (%rcx,%rdi,8)
	movq	(%rax), %rcx
	movl	-4(%rbp), %esi
	movl	%esi, %edx
	movq	(%rcx,%rdx,8), %rcx
	movq	%rcx, -32(%rbp)
	movq	(%rax), %rcx
	movl	-12(%rbp), %esi
	movl	%esi, %edx
	movq	(%rcx,%rdx,8), %rcx
	movq	(%rax), %rdx
	movl	-4(%rbp), %esi
	movl	%esi, %edi
	movq	%rcx, (%rdx,%rdi,8)
	movq	-32(%rbp), %rcx
	movq	(%rax), %rax
	movl	-12(%rbp), %esi
	movl	%esi, %edx
	movq	%rcx, (%rax,%rdx,8)
	movl	-4(%rbp), %edi
	movl	-12(%rbp), %esi
	subl	$1, %esi
	callq	sort@PLT
	movl	-12(%rbp), %esi
	addl	$1, %esi
	movl	-8(%rbp), %edi
	movl	%edi, -36(%rbp)         # 4-byte Spill
	movl	%esi, %edi
	movl	-36(%rbp), %esi         # 4-byte Reload
	callq	sort@PLT
.LBB0_9:                                # %return
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	sort, .Lfunc_end0-sort

	.globl	check_overlap
	.p2align	4, 0x90
	.type	check_overlap,@function
check_overlap:                          # @check_overlap
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$1, -8(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4096, -8(%rbp)         # imm = 0x1000
	jae	.LBB1_6
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	objs@GOTPCREL(%rip), %rax
	movq	objs_end@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movl	-8(%rbp), %edx
	subl	$1, %edx
	movl	%edx, %edx
	movl	%edx, %esi
	movq	(%rcx,%rsi,8), %rcx
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movl	%edx, %esi
	cmpq	(%rax,%rsi,8), %rcx
	jbe	.LBB1_4
# BB#3:                                 # %if.then
	movl	$1, -4(%rbp)
	jmp	.LBB1_7
.LBB1_4:                                # %if.end
                                        #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_5
.LBB1_5:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_1
.LBB1_6:                                # %for.end
	movl	$0, -4(%rbp)
.LBB1_7:                                # %return
	movl	-4(%rbp), %eax
	popq	%rbp
	retq
.Lfunc_end1:
	.size	check_overlap, .Lfunc_end1-check_overlap

	.globl	enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	movl	$32768, %eax            # imm = 0x8000
	movl	%eax, %edi
	callq	malloc@PLT
	movl	$32768, %ecx            # imm = 0x8000
	movl	%ecx, %edi
	movq	objs@GOTPCREL(%rip), %rdx
	movq	%rax, (%rdx)
	callq	malloc@PLT
	movq	objs_end@GOTPCREL(%rip), %rdx
	movq	%rax, (%rdx)
	movl	$0, -4(%rbp)
.LBB2_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4096, -4(%rbp)         # imm = 0x1000
	jae	.LBB2_4
# BB#2:                                 # %for.body
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	$5, %eax
	movl	-4(%rbp), %ecx
	movl	%eax, -20(%rbp)         # 4-byte Spill
	movl	%ecx, %eax
	xorl	%edx, %edx
	movl	-20(%rbp), %ecx         # 4-byte Reload
	divl	%ecx
	addl	$5, %edx
	movl	%edx, %edx
	movl	%edx, %esi
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdi
	callq	malloc@PLT
	movq	objs_end@GOTPCREL(%rip), %rsi
	movq	objs@GOTPCREL(%rip), %rdi
	movq	(%rdi), %r8
	movl	-4(%rbp), %ecx
	movl	%ecx, %r9d
	movq	%rax, (%r8,%r9,8)
	movq	(%rdi), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, %edi
	movq	(%rax,%rdi,8), %rax
	addq	-16(%rbp), %rax
	movq	(%rsi), %rsi
	movl	-4(%rbp), %ecx
	movl	%ecx, %edi
	movq	%rax, (%rsi,%rdi,8)
# BB#3:                                 # %for.inc
                                        #   in Loop: Header=BB2_1 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB2_1
.LBB2_4:                                # %for.end
	xorl	%edi, %edi
	movl	$4095, %esi             # imm = 0xFFF
	callq	sort@PLT
	callq	check_overlap@PLT
	cmpl	$0, %eax
	je	.LBB2_6
# BB#5:                                 # %if.then
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	puts@PLT
	movl	%eax, -24(%rbp)         # 4-byte Spill
	jmp	.LBB2_7
.LBB2_6:                                # %if.else
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	puts@PLT
	movl	%eax, -28(%rbp)         # 4-byte Spill
.LBB2_7:                                # %if.end
	movl	$0, -4(%rbp)
.LBB2_8:                                # %for.cond11
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4096, -4(%rbp)         # imm = 0x1000
	jae	.LBB2_11
# BB#9:                                 # %for.body14
                                        #   in Loop: Header=BB2_8 Depth=1
	movq	objs@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %ecx
	movl	%ecx, %edx
	movq	(%rax,%rdx,8), %rdi
	callq	free@PLT
# BB#10:                                # %for.inc17
                                        #   in Loop: Header=BB2_8 Depth=1
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB2_8
.LBB2_11:                               # %for.end19
	xorl	%edi, %edi
	callq	exit@PLT
.Lfunc_end2:
	.size	enclave_main, .Lfunc_end2-enclave_main

	.type	objs,@object            # @objs
	.comm	objs,8,8
	.type	objs_end,@object        # @objs_end
	.comm	objs_end,8,8
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


	.ident	"clang version 4.0.1 (tags/RELEASE_401/final)"
	.section	".note.GNU-stack","",@progbits
