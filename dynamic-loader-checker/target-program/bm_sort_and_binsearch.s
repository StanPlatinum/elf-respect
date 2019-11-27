	.text
	.file	"bm_sort_and_binsearch.c"
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
	andq	$-16, %rsp
	subq	$48, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	40(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movq	%rdi, 40(%rsp)
	movabsq	$2305843009213693951, %rax # imm = 0x1FFFFFFFFFFFFFFF
	pushq	%rbx
	pushq	%rax
	leaq	32(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movq	%rax, 32(%rsp)
	pushq	%rbx
	pushq	%rax
	leaq	28(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	$536870911, 28(%rsp)    # imm = 0x1FFFFFFF
	pushq	%rbx
	pushq	%rax
	leaq	24(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	$0, 24(%rsp)
	movl	28(%rsp), %ecx
	pushq	%rbx
	pushq	%rax
	leaq	20(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%ecx, 20(%rsp)
	pushq	%rbx
	pushq	%rax
	leaq	16(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	$0, 16(%rsp)
	cmpq	$0, 40(%rsp)
	jne	.LBB0_2
# %bb.1:                                # %if.then
	jmp	.LBB0_14
.LBB0_2:                                # %if.end
	jmp	.LBB0_3
.LBB0_3:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	24(%rsp), %eax
	cmpl	20(%rsp), %eax
	jg	.LBB0_13
# %bb.4:                                # %while.body
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	24(%rsp), %eax
	movl	20(%rsp), %ecx
	subl	24(%rsp), %ecx
	pushq	%rbx
	pushq	%rax
	leaq	12(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%eax, 12(%rsp)          # 4-byte Spill
	movl	%ecx, %eax
	cltd
	movl	$2, %ecx
	idivl	%ecx
	movl	12(%rsp), %ecx          # 4-byte Reload
	addl	%eax, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	16(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%ecx, 16(%rsp)
	movl	16(%rsp), %eax
	cmpl	20(%rsp), %eax
	jle	.LBB0_6
# %bb.5:                                # %if.then3
	jmp	.LBB0_13
.LBB0_6:                                # %if.end4
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	32(%rsp), %rax
	movslq	16(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	40(%rsp), %rax
	jbe	.LBB0_8
# %bb.7:                                # %if.then6
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	16(%rsp), %eax
	subl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	20(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%eax, 20(%rsp)
	jmp	.LBB0_12
.LBB0_8:                                # %if.else
                                        #   in Loop: Header=BB0_3 Depth=1
	movq	32(%rsp), %rax
	movslq	16(%rsp), %rcx
	movq	(%rax,%rcx,8), %rax
	cmpq	40(%rsp), %rax
	jae	.LBB0_10
# %bb.9:                                # %if.then11
                                        #   in Loop: Header=BB0_3 Depth=1
	movl	16(%rsp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	24(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_15
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_15
	popq	%rax
	popq	%rbx
	movl	%eax, 24(%rsp)
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
	movq	%rbp, %rsp
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
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	subq	$32, %rsp
	xorl	%edi, %edi
	movl	array_size(%rip), %eax
	subl	$1, %eax
	movl	%eax, %esi
	callq	sort
	leaq	.L.str(%rip), %rdi
	callq	puts@PLT
	pushq	%rbx
	pushq	%rax
	leaq	28(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	$256, 28(%rsp)          # imm = 0x100
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$512, 28(%rsp)          # imm = 0x200
	jae	.LBB1_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	buf@GOTPCREL(%rip), %rdi
	movl	28(%rsp), %eax
	movl	%eax, %ecx
	leaq	numbers(%rip), %rdx
	movl	(%rdx,%rcx,4), %edx
	leaq	.L.str.1(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	movq	buf@GOTPCREL(%rip), %rdi
	pushq	%rbx
	pushq	%rax
	leaq	24(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	%eax, 24(%rsp)          # 4-byte Spill
	callq	puts@PLT
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	28(%rsp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	28(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	%eax, 28(%rsp)
	jmp	.LBB1_1
.LBB1_4:                                # %for.end
	callq	check
	cmpl	$0, %eax
	jne	.LBB1_6
# %bb.5:                                # %if.then
	leaq	.L.str.2(%rip), %rdi
	callq	puts@PLT
	xorl	%edi, %edi
	pushq	%rbx
	pushq	%rax
	leaq	20(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	%eax, 20(%rsp)          # 4-byte Spill
	callq	exit@PLT
.LBB1_6:                                # %if.end
	leaq	.L.str.3(%rip), %rdi
	callq	puts@PLT
	pushq	%rbx
	pushq	%rax
	leaq	28(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	$17, 28(%rsp)
.LBB1_7:                                # %for.cond6
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$4096, 28(%rsp)         # imm = 0x1000
	jae	.LBB1_12
# %bb.8:                                # %for.body8
                                        #   in Loop: Header=BB1_7 Depth=1
	movl	28(%rsp), %eax
	movl	28(%rsp), %ecx
	movl	%ecx, %edx
	leaq	numbers(%rip), %rsi
	movl	(%rsi,%rdx,4), %edi
	pushq	%rbx
	pushq	%rax
	leaq	16(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	%eax, 16(%rsp)          # 4-byte Spill
	callq	binsearch
	movl	16(%rsp), %ecx          # 4-byte Reload
	cmpl	%eax, %ecx
	je	.LBB1_10
# %bb.9:                                # %if.then13
	movq	buf@GOTPCREL(%rip), %rdi
	movl	28(%rsp), %edx
	leaq	.L.str.4(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	movq	buf@GOTPCREL(%rip), %rdi
	pushq	%rbx
	pushq	%rax
	leaq	12(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	%eax, 12(%rsp)          # 4-byte Spill
	callq	puts@PLT
	xorl	%edi, %edi
	pushq	%rbx
	pushq	%rax
	leaq	8(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	%eax, 8(%rsp)           # 4-byte Spill
	callq	exit@PLT
.LBB1_10:                               # %if.end16
                                        #   in Loop: Header=BB1_7 Depth=1
	jmp	.LBB1_11
.LBB1_11:                               # %for.inc17
                                        #   in Loop: Header=BB1_7 Depth=1
	movl	28(%rsp), %eax
	addl	$125, %eax
	pushq	%rbx
	pushq	%rax
	leaq	28(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	%eax, 28(%rsp)
	jmp	.LBB1_7
.LBB1_12:                               # %for.end18
	leaq	.L.str.5(%rip), %rdi
	callq	puts@PLT
	xorl	%edi, %edi
	pushq	%rbx
	pushq	%rax
	leaq	4(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_13
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_13
	popq	%rax
	popq	%rbx
	movl	%eax, 4(%rsp)           # 4-byte Spill
	callq	exit@PLT
.LBB1_13:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end1:
	.size	enclave_main, .Lfunc_end1-enclave_main
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function sort
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
	andq	$-16, %rsp
	subq	$32, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	28(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%edi, 28(%rsp)
	pushq	%rbx
	pushq	%rax
	leaq	24(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%esi, 24(%rsp)
	movl	28(%rsp), %eax
	cmpl	24(%rsp), %eax
	jl	.LBB2_2
# %bb.1:                                # %if.then
	jmp	.LBB2_9
.LBB2_2:                                # %if.end
	movl	28(%rsp), %eax
	movl	%eax, %ecx
	leaq	numbers(%rip), %rdx
	movl	(%rdx,%rcx,4), %eax
	movl	%eax, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	8(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rcx, 8(%rsp)
	movl	28(%rsp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	20(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%eax, 20(%rsp)
	movl	28(%rsp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	16(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%eax, 16(%rsp)
.LBB2_3:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	16(%rsp), %eax
	cmpl	24(%rsp), %eax
	ja	.LBB2_8
# %bb.4:                                # %for.body
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	16(%rsp), %eax
	movl	%eax, %ecx
	leaq	numbers(%rip), %rdx
	movl	(%rdx,%rcx,4), %eax
	movl	%eax, %ecx
	cmpq	8(%rsp), %rcx
	jae	.LBB2_6
# %bb.5:                                # %if.then8
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	20(%rsp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	20(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%eax, 20(%rsp)
	movl	16(%rsp), %eax
	movl	%eax, %ecx
	leaq	numbers(%rip), %rdx
	movl	(%rdx,%rcx,4), %eax
	movl	%eax, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rcx, (%rsp)
	movl	20(%rsp), %eax
	movl	%eax, %ecx
	movl	(%rdx,%rcx,4), %eax
	movl	16(%rsp), %esi
	movl	%esi, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	(%rdx,%rcx,4), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%eax, (%rdx,%rcx,4)
	movq	(%rsp), %rcx
                                        # kill: def $ecx killed $ecx killed $rcx
	movl	20(%rsp), %eax
	movl	%eax, %edi
	pushq	%rbx
	pushq	%rax
	leaq	(%rdx,%rdi,4), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%ecx, (%rdx,%rdi,4)
.LBB2_6:                                # %if.end19
                                        #   in Loop: Header=BB2_3 Depth=1
	jmp	.LBB2_7
.LBB2_7:                                # %for.inc
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	16(%rsp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	16(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%eax, 16(%rsp)
	jmp	.LBB2_3
.LBB2_8:                                # %for.end
	movl	28(%rsp), %eax
	movl	%eax, %ecx
	leaq	numbers(%rip), %rdx
	movl	(%rdx,%rcx,4), %eax
	movl	%eax, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movq	%rcx, (%rsp)
	movl	20(%rsp), %eax
	movl	%eax, %ecx
	movl	(%rdx,%rcx,4), %eax
	movl	28(%rsp), %esi
	movl	%esi, %ecx
	pushq	%rbx
	pushq	%rax
	leaq	(%rdx,%rcx,4), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%eax, (%rdx,%rcx,4)
	movq	(%rsp), %rcx
                                        # kill: def $ecx killed $ecx killed $rcx
	movl	20(%rsp), %eax
	movl	%eax, %edi
	pushq	%rbx
	pushq	%rax
	leaq	(%rdx,%rdi,4), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_10
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_10
	popq	%rax
	popq	%rbx
	movl	%ecx, (%rdx,%rdi,4)
	movl	28(%rsp), %edi
	movl	20(%rsp), %eax
	subl	$1, %eax
	movl	%eax, %esi
	callq	sort
	movl	20(%rsp), %eax
	addl	$1, %eax
	movl	24(%rsp), %esi
	movl	%eax, %edi
	callq	sort
.LBB2_9:                                # %return
	movq	%rbp, %rsp
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
	.size	sort, .Lfunc_end2-sort
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function binsearch
	.type	binsearch,@function
binsearch:                              # @binsearch
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-8, %rsp
	subq	$32, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	24(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_11
	popq	%rax
	popq	%rbx
	movl	%edi, 24(%rsp)
	pushq	%rbx
	pushq	%rax
	leaq	20(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_11
	popq	%rax
	popq	%rbx
	movl	$0, 20(%rsp)
	movl	array_size(%rip), %eax
	subl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	16(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_11
	popq	%rax
	popq	%rbx
	movl	%eax, 16(%rsp)
.LBB3_1:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	20(%rsp), %eax
	cmpl	16(%rsp), %eax
	jae	.LBB3_9
# %bb.2:                                # %while.body
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	20(%rsp), %eax
	addl	16(%rsp), %eax
	addl	$1, %eax
	shrl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	12(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_11
	popq	%rax
	popq	%rbx
	movl	%eax, 12(%rsp)
	movl	12(%rsp), %eax
	movl	%eax, %ecx
	leaq	numbers(%rip), %rdx
	movl	(%rdx,%rcx,4), %eax
	pushq	%rbx
	pushq	%rax
	leaq	8(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_11
	popq	%rax
	popq	%rbx
	movl	%eax, 8(%rsp)
	movl	24(%rsp), %eax
	cmpl	8(%rsp), %eax
	jne	.LBB3_4
# %bb.3:                                # %if.then
	movl	12(%rsp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	28(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_11
	popq	%rax
	popq	%rbx
	movl	%eax, 28(%rsp)
	jmp	.LBB3_10
.LBB3_4:                                # %if.else
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	24(%rsp), %eax
	cmpl	8(%rsp), %eax
	jae	.LBB3_6
# %bb.5:                                # %if.then4
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	12(%rsp), %eax
	subl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	16(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_11
	popq	%rax
	popq	%rbx
	movl	%eax, 16(%rsp)
	jmp	.LBB3_7
.LBB3_6:                                # %if.else6
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	12(%rsp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	20(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_11
	popq	%rax
	popq	%rbx
	movl	%eax, 20(%rsp)
.LBB3_7:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_8
.LBB3_8:                                # %if.end7
                                        #   in Loop: Header=BB3_1 Depth=1
	jmp	.LBB3_1
.LBB3_9:                                # %while.end
	movl	20(%rsp), %eax
	pushq	%rbx
	pushq	%rax
	leaq	28(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB3_11
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB3_11
	popq	%rax
	popq	%rbx
	movl	%eax, 28(%rsp)
.LBB3_10:                               # %return
	movl	28(%rsp), %eax
	movq	%rbp, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB3_12
	retq
.LBB3_11:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB3_12:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end3:
	.size	binsearch, .Lfunc_end3-binsearch
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function check
	.type	check,@function
check:                                  # @check
# %bb.0:                                # %entry
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-8, %rsp
	subq	$16, %rsp
	pushq	%rbx
	pushq	%rax
	leaq	8(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_8
	popq	%rax
	popq	%rbx
	movl	$1, 8(%rsp)
.LBB4_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	8(%rsp), %eax
	cmpl	array_size(%rip), %eax
	jae	.LBB4_6
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	8(%rsp), %eax
	movl	%eax, %ecx
	leaq	numbers(%rip), %rdx
	movl	(%rdx,%rcx,4), %eax
	movl	8(%rsp), %esi
	subl	$1, %esi
	movl	%esi, %esi
	movl	%esi, %ecx
	cmpl	(%rdx,%rcx,4), %eax
	jae	.LBB4_4
# %bb.3:                                # %if.then
	pushq	%rbx
	pushq	%rax
	leaq	12(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_8
	popq	%rax
	popq	%rbx
	movl	$0, 12(%rsp)
	jmp	.LBB4_7
.LBB4_4:                                # %if.end
                                        #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_5
.LBB4_5:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	8(%rsp), %eax
	addl	$1, %eax
	pushq	%rbx
	pushq	%rax
	leaq	8(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_8
	popq	%rax
	popq	%rbx
	movl	%eax, 8(%rsp)
	jmp	.LBB4_1
.LBB4_6:                                # %for.end
	pushq	%rbx
	pushq	%rax
	leaq	12(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB4_8
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB4_8
	popq	%rax
	popq	%rbx
	movl	$1, 12(%rsp)
.LBB4_7:                                # %return
	movl	12(%rsp), %eax
	movq	%rbp, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB4_9
	retq
.LBB4_8:
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB4_9:
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end4:
	.size	check, .Lfunc_end4-check
                                        # -- End function
	.type	buf,@object             # @buf
	.bss
	.globl	buf
	.p2align	4
buf:
	.zero	32
	.size	buf, 32

	.type	array_size,@object      # @array_size
	.data
	.p2align	2
array_size:
	.long	4096                    # 0x1000
	.size	array_size, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"sort() done"
	.size	.L.str, 12

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%05d "
	.size	.L.str.1, 6

	.type	numbers,@object         # @numbers
	.data
	.p2align	4
numbers:
	.long	27652                   # 0x6c04
	.long	15313                   # 0x3bd1
	.long	54231                   # 0xd3d7
	.long	55223                   # 0xd7b7
	.long	10999                   # 0x2af7
	.long	25221                   # 0x6285
	.long	2837                    # 0xb15
	.long	50123                   # 0xc3cb
	.long	51505                   # 0xc931
	.long	58817                   # 0xe5c1
	.long	13159                   # 0x3367
	.long	65130                   # 0xfe6a
	.long	64970                   # 0xfdca
	.long	64315                   # 0xfb3b
	.long	9017                    # 0x2339
	.long	57518                   # 0xe0ae
	.long	64901                   # 0xfd85
	.long	7272                    # 0x1c68
	.long	36042                   # 0x8cca
	.long	55759                   # 0xd9cf
	.long	22372                   # 0x5764
	.long	23296                   # 0x5b00
	.long	52832                   # 0xce60
	.long	54408                   # 0xd488
	.long	58824                   # 0xe5c8
	.long	9578                    # 0x256a
	.long	49232                   # 0xc050
	.long	24373                   # 0x5f35
	.long	35358                   # 0x8a1e
	.long	2313                    # 0x909
	.long	25721                   # 0x6479
	.long	10864                   # 0x2a70
	.long	52734                   # 0xcdfe
	.long	63063                   # 0xf657
	.long	38516                   # 0x9674
	.long	2511                    # 0x9cf
	.long	51758                   # 0xca2e
	.long	28204                   # 0x6e2c
	.long	13511                   # 0x34c7
	.long	37728                   # 0x9360
	.long	21485                   # 0x53ed
	.long	26670                   # 0x682e
	.long	37322                   # 0x91ca
	.long	20919                   # 0x51b7
	.long	25449                   # 0x6369
	.long	46339                   # 0xb503
	.long	12901                   # 0x3265
	.long	24814                   # 0x60ee
	.long	53612                   # 0xd16c
	.long	48943                   # 0xbf2f
	.long	15037                   # 0x3abd
	.long	10448                   # 0x28d0
	.long	6703                    # 0x1a2f
	.long	2333                    # 0x91d
	.long	64857                   # 0xfd59
	.long	65528                   # 0xfff8
	.long	11912                   # 0x2e88
	.long	48553                   # 0xbda9
	.long	24365                   # 0x5f2d
	.long	47270                   # 0xb8a6
	.long	50866                   # 0xc6b2
	.long	50087                   # 0xc3a7
	.long	58134                   # 0xe316
	.long	38065                   # 0x94b1
	.long	47614                   # 0xb9fe
	.long	31115                   # 0x798b
	.long	40576                   # 0x9e80
	.long	33837                   # 0x842d
	.long	59319                   # 0xe7b7
	.long	54087                   # 0xd347
	.long	6029                    # 0x178d
	.long	15268                   # 0x3ba4
	.long	15221                   # 0x3b75
	.long	43351                   # 0xa957
	.long	36187                   # 0x8d5b
	.long	40670                   # 0x9ede
	.long	24155                   # 0x5e5b
	.long	49088                   # 0xbfc0
	.long	65484                   # 0xffcc
	.long	12231                   # 0x2fc7
	.long	32495                   # 0x7eef
	.long	14985                   # 0x3a89
	.long	22679                   # 0x5897
	.long	39198                   # 0x991e
	.long	17319                   # 0x43a7
	.long	22000                   # 0x55f0
	.long	39190                   # 0x9916
	.long	29231                   # 0x722f
	.long	5018                    # 0x139a
	.long	63556                   # 0xf844
	.long	10965                   # 0x2ad5
	.long	55884                   # 0xda4c
	.long	48107                   # 0xbbeb
	.long	3564                    # 0xdec
	.long	28413                   # 0x6efd
	.long	30185                   # 0x75e9
	.long	34679                   # 0x8777
	.long	3454                    # 0xd7e
	.long	64022                   # 0xfa16
	.long	28462                   # 0x6f2e
	.long	57541                   # 0xe0c5
	.long	4515                    # 0x11a3
	.long	43730                   # 0xaad2
	.long	7227                    # 0x1c3b
	.long	47867                   # 0xbafb
	.long	14381                   # 0x382d
	.long	47897                   # 0xbb19
	.long	6486                    # 0x1956
	.long	63469                   # 0xf7ed
	.long	47846                   # 0xbae6
	.long	18717                   # 0x491d
	.long	30428                   # 0x76dc
	.long	62831                   # 0xf56f
	.long	41396                   # 0xa1b4
	.long	4090                    # 0xffa
	.long	14614                   # 0x3916
	.long	63397                   # 0xf7a5
	.long	43281                   # 0xa911
	.long	43845                   # 0xab45
	.long	2879                    # 0xb3f
	.long	41301                   # 0xa155
	.long	54811                   # 0xd61b
	.long	58763                   # 0xe58b
	.long	23872                   # 0x5d40
	.long	58375                   # 0xe407
	.long	21641                   # 0x5489
	.long	54057                   # 0xd329
	.long	27518                   # 0x6b7e
	.long	25095                   # 0x6207
	.long	52544                   # 0xcd40
	.long	55980                   # 0xdaac
	.long	17100                   # 0x42cc
	.long	57059                   # 0xdee3
	.long	34174                   # 0x857e
	.long	24327                   # 0x5f07
	.long	39390                   # 0x99de
	.long	48555                   # 0xbdab
	.long	6689                    # 0x1a21
	.long	45876                   # 0xb334
	.long	46488                   # 0xb598
	.long	54535                   # 0xd507
	.long	64593                   # 0xfc51
	.long	11380                   # 0x2c74
	.long	51830                   # 0xca76
	.long	40454                   # 0x9e06
	.long	15470                   # 0x3c6e
	.long	909                     # 0x38d
	.long	38315                   # 0x95ab
	.long	58751                   # 0xe57f
	.long	44754                   # 0xaed2
	.long	41194                   # 0xa0ea
	.long	34516                   # 0x86d4
	.long	34029                   # 0x84ed
	.long	34421                   # 0x8675
	.long	58388                   # 0xe414
	.long	26868                   # 0x68f4
	.long	56062                   # 0xdafe
	.long	46910                   # 0xb73e
	.long	54386                   # 0xd472
	.long	15621                   # 0x3d05
	.long	33918                   # 0x847e
	.long	44830                   # 0xaf1e
	.long	32722                   # 0x7fd2
	.long	25441                   # 0x6361
	.long	13468                   # 0x349c
	.long	57049                   # 0xded9
	.long	64832                   # 0xfd40
	.long	62023                   # 0xf247
	.long	63738                   # 0xf8fa
	.long	45172                   # 0xb074
	.long	42975                   # 0xa7df
	.long	52737                   # 0xce01
	.long	44230                   # 0xacc6
	.long	54355                   # 0xd453
	.long	39032                   # 0x9878
	.long	19148                   # 0x4acc
	.long	4290                    # 0x10c2
	.long	39941                   # 0x9c05
	.long	57463                   # 0xe077
	.long	63041                   # 0xf641
	.long	19159                   # 0x4ad7
	.long	33121                   # 0x8161
	.long	32022                   # 0x7d16
	.long	53189                   # 0xcfc5
	.long	2006                    # 0x7d6
	.long	24874                   # 0x612a
	.long	14521                   # 0x38b9
	.long	58069                   # 0xe2d5
	.long	6248                    # 0x1868
	.long	3372                    # 0xd2c
	.long	8154                    # 0x1fda
	.long	40166                   # 0x9ce6
	.long	48202                   # 0xbc4a
	.long	40876                   # 0x9fac
	.long	72                      # 0x48
	.long	61671                   # 0xf0e7
	.long	32390                   # 0x7e86
	.long	64904                   # 0xfd88
	.long	58158                   # 0xe32e
	.long	30592                   # 0x7780
	.long	44540                   # 0xadfc
	.long	35598                   # 0x8b0e
	.long	17794                   # 0x4582
	.long	23234                   # 0x5ac2
	.long	24417                   # 0x5f61
	.long	56826                   # 0xddfa
	.long	42382                   # 0xa58e
	.long	28707                   # 0x7023
	.long	31231                   # 0x79ff
	.long	34309                   # 0x8605
	.long	26213                   # 0x6665
	.long	50390                   # 0xc4d6
	.long	1894                    # 0x766
	.long	58235                   # 0xe37b
	.long	38043                   # 0x949b
	.long	3901                    # 0xf3d
	.long	17573                   # 0x44a5
	.long	52565                   # 0xcd55
	.long	61970                   # 0xf212
	.long	23822                   # 0x5d0e
	.long	55937                   # 0xda81
	.long	4588                    # 0x11ec
	.long	63988                   # 0xf9f4
	.long	38603                   # 0x96cb
	.long	45465                   # 0xb199
	.long	64060                   # 0xfa3c
	.long	34738                   # 0x87b2
	.long	12319                   # 0x301f
	.long	63428                   # 0xf7c4
	.long	27361                   # 0x6ae1
	.long	42911                   # 0xa79f
	.long	42433                   # 0xa5c1
	.long	62959                   # 0xf5ef
	.long	60705                   # 0xed21
	.long	131                     # 0x83
	.long	21840                   # 0x5550
	.long	51995                   # 0xcb1b
	.long	42514                   # 0xa612
	.long	50548                   # 0xc574
	.long	17690                   # 0x451a
	.long	11287                   # 0x2c17
	.long	11225                   # 0x2bd9
	.long	2545                    # 0x9f1
	.long	13182                   # 0x337e
	.long	3924                    # 0xf54
	.long	40588                   # 0x9e8c
	.long	17083                   # 0x42bb
	.long	21497                   # 0x53f9
	.long	27617                   # 0x6be1
	.long	13517                   # 0x34cd
	.long	45319                   # 0xb107
	.long	18018                   # 0x4662
	.long	18105                   # 0x46b9
	.long	43772                   # 0xaafc
	.long	56622                   # 0xdd2e
	.long	63570                   # 0xf852
	.long	42296                   # 0xa538
	.long	25824                   # 0x64e0
	.long	10353                   # 0x2871
	.long	40189                   # 0x9cfd
	.long	53185                   # 0xcfc1
	.long	53265                   # 0xd011
	.long	17086                   # 0x42be
	.long	50608                   # 0xc5b0
	.long	48434                   # 0xbd32
	.long	17217                   # 0x4341
	.long	6913                    # 0x1b01
	.long	34894                   # 0x884e
	.long	59731                   # 0xe953
	.long	57461                   # 0xe075
	.long	52584                   # 0xcd68
	.long	5483                    # 0x156b
	.long	3150                    # 0xc4e
	.long	55129                   # 0xd759
	.long	18665                   # 0x48e9
	.long	7074                    # 0x1ba2
	.long	30182                   # 0x75e6
	.long	35748                   # 0x8ba4
	.long	28571                   # 0x6f9b
	.long	57799                   # 0xe1c7
	.long	49265                   # 0xc071
	.long	8355                    # 0x20a3
	.long	10282                   # 0x282a
	.long	1834                    # 0x72a
	.long	52127                   # 0xcb9f
	.long	1368                    # 0x558
	.long	65405                   # 0xff7d
	.long	28887                   # 0x70d7
	.long	27192                   # 0x6a38
	.long	10222                   # 0x27ee
	.long	3540                    # 0xdd4
	.long	14842                   # 0x39fa
	.long	63487                   # 0xf7ff
	.long	20626                   # 0x5092
	.long	65450                   # 0xffaa
	.long	46386                   # 0xb532
	.long	37844                   # 0x93d4
	.long	6827                    # 0x1aab
	.long	15744                   # 0x3d80
	.long	32039                   # 0x7d27
	.long	64288                   # 0xfb20
	.long	2792                    # 0xae8
	.long	37522                   # 0x9292
	.long	1902                    # 0x76e
	.long	57922                   # 0xe242
	.long	56187                   # 0xdb7b
	.long	8976                    # 0x2310
	.long	22568                   # 0x5828
	.long	26399                   # 0x671f
	.long	37548                   # 0x92ac
	.long	14831                   # 0x39ef
	.long	10128                   # 0x2790
	.long	45903                   # 0xb34f
	.long	25113                   # 0x6219
	.long	11963                   # 0x2ebb
	.long	32494                   # 0x7eee
	.long	26481                   # 0x6771
	.long	11832                   # 0x2e38
	.long	61381                   # 0xefc5
	.long	53674                   # 0xd1aa
	.long	22054                   # 0x5626
	.long	64922                   # 0xfd9a
	.long	2980                    # 0xba4
	.long	20006                   # 0x4e26
	.long	20012                   # 0x4e2c
	.long	2894                    # 0xb4e
	.long	856                     # 0x358
	.long	57856                   # 0xe200
	.long	9722                    # 0x25fa
	.long	16600                   # 0x40d8
	.long	24360                   # 0x5f28
	.long	8474                    # 0x211a
	.long	19392                   # 0x4bc0
	.long	61882                   # 0xf1ba
	.long	10377                   # 0x2889
	.long	11778                   # 0x2e02
	.long	52534                   # 0xcd36
	.long	19353                   # 0x4b99
	.long	34346                   # 0x862a
	.long	13397                   # 0x3455
	.long	56901                   # 0xde45
	.long	49178                   # 0xc01a
	.long	23526                   # 0x5be6
	.long	37268                   # 0x9194
	.long	8755                    # 0x2233
	.long	35489                   # 0x8aa1
	.long	4226                    # 0x1082
	.long	35237                   # 0x89a5
	.long	47321                   # 0xb8d9
	.long	72                      # 0x48
	.long	23375                   # 0x5b4f
	.long	3839                    # 0xeff
	.long	64994                   # 0xfde2
	.long	26355                   # 0x66f3
	.long	23845                   # 0x5d25
	.long	19470                   # 0x4c0e
	.long	29249                   # 0x7241
	.long	24701                   # 0x607d
	.long	11791                   # 0x2e0f
	.long	38971                   # 0x983b
	.long	41301                   # 0xa155
	.long	36151                   # 0x8d37
	.long	47446                   # 0xb956
	.long	60694                   # 0xed16
	.long	32497                   # 0x7ef1
	.long	57823                   # 0xe1df
	.long	6936                    # 0x1b18
	.long	19495                   # 0x4c27
	.long	11640                   # 0x2d78
	.long	41283                   # 0xa143
	.long	32893                   # 0x807d
	.long	3006                    # 0xbbe
	.long	24925                   # 0x615d
	.long	56419                   # 0xdc63
	.long	40274                   # 0x9d52
	.long	33680                   # 0x8390
	.long	26372                   # 0x6704
	.long	44501                   # 0xadd5
	.long	3381                    # 0xd35
	.long	8157                    # 0x1fdd
	.long	44573                   # 0xae1d
	.long	26756                   # 0x6884
	.long	11996                   # 0x2edc
	.long	44031                   # 0xabff
	.long	53111                   # 0xcf77
	.long	35842                   # 0x8c02
	.long	63501                   # 0xf80d
	.long	16825                   # 0x41b9
	.long	60543                   # 0xec7f
	.long	9756                    # 0x261c
	.long	55796                   # 0xd9f4
	.long	36309                   # 0x8dd5
	.long	45907                   # 0xb353
	.long	37706                   # 0x934a
	.long	31467                   # 0x7aeb
	.long	12869                   # 0x3245
	.long	29993                   # 0x7529
	.long	38403                   # 0x9603
	.long	32364                   # 0x7e6c
	.long	41634                   # 0xa2a2
	.long	14150                   # 0x3746
	.long	65257                   # 0xfee9
	.long	44640                   # 0xae60
	.long	39075                   # 0x98a3
	.long	56140                   # 0xdb4c
	.long	19378                   # 0x4bb2
	.long	7220                    # 0x1c34
	.long	16976                   # 0x4250
	.long	63879                   # 0xf987
	.long	10601                   # 0x2969
	.long	25133                   # 0x622d
	.long	42916                   # 0xa7a4
	.long	37358                   # 0x91ee
	.long	37130                   # 0x910a
	.long	21411                   # 0x53a3
	.long	24933                   # 0x6165
	.long	7436                    # 0x1d0c
	.long	19377                   # 0x4bb1
	.long	41758                   # 0xa31e
	.long	2443                    # 0x98b
	.long	29133                   # 0x71cd
	.long	32019                   # 0x7d13
	.long	38752                   # 0x9760
	.long	9505                    # 0x2521
	.long	4189                    # 0x105d
	.long	4683                    # 0x124b
	.long	22374                   # 0x5766
	.long	34183                   # 0x8587
	.long	43087                   # 0xa84f
	.long	54738                   # 0xd5d2
	.long	10281                   # 0x2829
	.long	57237                   # 0xdf95
	.long	54460                   # 0xd4bc
	.long	54921                   # 0xd689
	.long	30777                   # 0x7839
	.long	45064                   # 0xb008
	.long	8763                    # 0x223b
	.long	37997                   # 0x946d
	.long	62041                   # 0xf259
	.long	7107                    # 0x1bc3
	.long	48598                   # 0xbdd6
	.long	21638                   # 0x5486
	.long	50023                   # 0xc367
	.long	20420                   # 0x4fc4
	.long	58768                   # 0xe590
	.long	5899                    # 0x170b
	.long	45354                   # 0xb12a
	.long	668                     # 0x29c
	.long	25276                   # 0x62bc
	.long	21576                   # 0x5448
	.long	3112                    # 0xc28
	.long	54409                   # 0xd489
	.long	53595                   # 0xd15b
	.long	41864                   # 0xa388
	.long	63914                   # 0xf9aa
	.long	57785                   # 0xe1b9
	.long	46548                   # 0xb5d4
	.long	20752                   # 0x5110
	.long	26432                   # 0x6740
	.long	24099                   # 0x5e23
	.long	9955                    # 0x26e3
	.long	36713                   # 0x8f69
	.long	15800                   # 0x3db8
	.long	64415                   # 0xfb9f
	.long	26098                   # 0x65f2
	.long	46577                   # 0xb5f1
	.long	43943                   # 0xaba7
	.long	34861                   # 0x882d
	.long	19038                   # 0x4a5e
	.long	40448                   # 0x9e00
	.long	41968                   # 0xa3f0
	.long	2101                    # 0x835
	.long	62087                   # 0xf287
	.long	26456                   # 0x6758
	.long	22521                   # 0x57f9
	.long	55319                   # 0xd817
	.long	32355                   # 0x7e63
	.long	2339                    # 0x923
	.long	55988                   # 0xdab4
	.long	57631                   # 0xe11f
	.long	23916                   # 0x5d6c
	.long	59100                   # 0xe6dc
	.long	46504                   # 0xb5a8
	.long	11975                   # 0x2ec7
	.long	35428                   # 0x8a64
	.long	44883                   # 0xaf53
	.long	4224                    # 0x1080
	.long	16440                   # 0x4038
	.long	99                      # 0x63
	.long	30656                   # 0x77c0
	.long	40539                   # 0x9e5b
	.long	10054                   # 0x2746
	.long	1833                    # 0x729
	.long	56340                   # 0xdc14
	.long	8933                    # 0x22e5
	.long	27931                   # 0x6d1b
	.long	37381                   # 0x9205
	.long	52877                   # 0xce8d
	.long	62793                   # 0xf549
	.long	56420                   # 0xdc64
	.long	27789                   # 0x6c8d
	.long	39225                   # 0x9939
	.long	58521                   # 0xe499
	.long	24340                   # 0x5f14
	.long	145                     # 0x91
	.long	15506                   # 0x3c92
	.long	14124                   # 0x372c
	.long	32500                   # 0x7ef4
	.long	17846                   # 0x45b6
	.long	4576                    # 0x11e0
	.long	24595                   # 0x6013
	.long	41762                   # 0xa322
	.long	63676                   # 0xf8bc
	.long	5564                    # 0x15bc
	.long	53737                   # 0xd1e9
	.long	33568                   # 0x8320
	.long	50447                   # 0xc50f
	.long	57962                   # 0xe26a
	.long	50009                   # 0xc359
	.long	50546                   # 0xc572
	.long	23082                   # 0x5a2a
	.long	25012                   # 0x61b4
	.long	60601                   # 0xecb9
	.long	24916                   # 0x6154
	.long	15816                   # 0x3dc8
	.long	3998                    # 0xf9e
	.long	52847                   # 0xce6f
	.long	53198                   # 0xcfce
	.long	56875                   # 0xde2b
	.long	50104                   # 0xc3b8
	.long	44082                   # 0xac32
	.long	19129                   # 0x4ab9
	.long	23794                   # 0x5cf2
	.long	37067                   # 0x90cb
	.long	43469                   # 0xa9cd
	.long	23939                   # 0x5d83
	.long	52573                   # 0xcd5d
	.long	57593                   # 0xe0f9
	.long	56440                   # 0xdc78
	.long	4883                    # 0x1313
	.long	62169                   # 0xf2d9
	.long	15499                   # 0x3c8b
	.long	46645                   # 0xb635
	.long	60309                   # 0xeb95
	.long	21063                   # 0x5247
	.long	34847                   # 0x881f
	.long	28342                   # 0x6eb6
	.long	5974                    # 0x1756
	.long	27273                   # 0x6a89
	.long	12815                   # 0x320f
	.long	56521                   # 0xdcc9
	.long	50355                   # 0xc4b3
	.long	37827                   # 0x93c3
	.long	51586                   # 0xc982
	.long	9735                    # 0x2607
	.long	53644                   # 0xd18c
	.long	55584                   # 0xd920
	.long	62583                   # 0xf477
	.long	41306                   # 0xa15a
	.long	46924                   # 0xb74c
	.long	47151                   # 0xb82f
	.long	19852                   # 0x4d8c
	.long	517                     # 0x205
	.long	5409                    # 0x1521
	.long	56919                   # 0xde57
	.long	43986                   # 0xabd2
	.long	29349                   # 0x72a5
	.long	43956                   # 0xabb4
	.long	36044                   # 0x8ccc
	.long	20253                   # 0x4f1d
	.long	48840                   # 0xbec8
	.long	32677                   # 0x7fa5
	.long	35752                   # 0x8ba8
	.long	29949                   # 0x74fd
	.long	27451                   # 0x6b3b
	.long	56816                   # 0xddf0
	.long	64796                   # 0xfd1c
	.long	55793                   # 0xd9f1
	.long	62790                   # 0xf546
	.long	26533                   # 0x67a5
	.long	3072                    # 0xc00
	.long	53775                   # 0xd20f
	.long	11353                   # 0x2c59
	.long	40899                   # 0x9fc3
	.long	39825                   # 0x9b91
	.long	21088                   # 0x5260
	.long	29007                   # 0x714f
	.long	29874                   # 0x74b2
	.long	18135                   # 0x46d7
	.long	4777                    # 0x12a9
	.long	11262                   # 0x2bfe
	.long	65287                   # 0xff07
	.long	24629                   # 0x6035
	.long	11779                   # 0x2e03
	.long	5160                    # 0x1428
	.long	16012                   # 0x3e8c
	.long	55765                   # 0xd9d5
	.long	34509                   # 0x86cd
	.long	59969                   # 0xea41
	.long	26273                   # 0x66a1
	.long	54762                   # 0xd5ea
	.long	43273                   # 0xa909
	.long	58951                   # 0xe647
	.long	24979                   # 0x6193
	.long	7686                    # 0x1e06
	.long	20866                   # 0x5182
	.long	16259                   # 0x3f83
	.long	6947                    # 0x1b23
	.long	11123                   # 0x2b73
	.long	13513                   # 0x34c9
	.long	33480                   # 0x82c8
	.long	14195                   # 0x3773
	.long	1753                    # 0x6d9
	.long	44833                   # 0xaf21
	.long	55094                   # 0xd736
	.long	41578                   # 0xa26a
	.long	386                     # 0x182
	.long	18566                   # 0x4886
	.long	5916                    # 0x171c
	.long	18521                   # 0x4859
	.long	23343                   # 0x5b2f
	.long	17178                   # 0x431a
	.long	18272                   # 0x4760
	.long	47973                   # 0xbb65
	.long	28957                   # 0x711d
	.long	23433                   # 0x5b89
	.long	63985                   # 0xf9f1
	.long	19187                   # 0x4af3
	.long	57942                   # 0xe256
	.long	58418                   # 0xe432
	.long	45460                   # 0xb194
	.long	47169                   # 0xb841
	.long	36155                   # 0x8d3b
	.long	38875                   # 0x97db
	.long	6612                    # 0x19d4
	.long	43842                   # 0xab42
	.long	59741                   # 0xe95d
	.long	22871                   # 0x5957
	.long	50789                   # 0xc665
	.long	5328                    # 0x14d0
	.long	36384                   # 0x8e20
	.long	18733                   # 0x492d
	.long	19523                   # 0x4c43
	.long	38137                   # 0x94f9
	.long	63567                   # 0xf84f
	.long	9082                    # 0x237a
	.long	14180                   # 0x3764
	.long	63953                   # 0xf9d1
	.long	27648                   # 0x6c00
	.long	20096                   # 0x4e80
	.long	16938                   # 0x422a
	.long	50991                   # 0xc72f
	.long	37275                   # 0x919b
	.long	35211                   # 0x898b
	.long	33428                   # 0x8294
	.long	696                     # 0x2b8
	.long	58644                   # 0xe514
	.long	31878                   # 0x7c86
	.long	19883                   # 0x4dab
	.long	51050                   # 0xc76a
	.long	24760                   # 0x60b8
	.long	65344                   # 0xff40
	.long	32683                   # 0x7fab
	.long	60916                   # 0xedf4
	.long	38683                   # 0x971b
	.long	39295                   # 0x997f
	.long	39222                   # 0x9936
	.long	32889                   # 0x8079
	.long	62166                   # 0xf2d6
	.long	24475                   # 0x5f9b
	.long	38217                   # 0x9549
	.long	33015                   # 0x80f7
	.long	43208                   # 0xa8c8
	.long	57741                   # 0xe18d
	.long	5616                    # 0x15f0
	.long	41239                   # 0xa117
	.long	1287                    # 0x507
	.long	19796                   # 0x4d54
	.long	39656                   # 0x9ae8
	.long	28935                   # 0x7107
	.long	39893                   # 0x9bd5
	.long	56595                   # 0xdd13
	.long	14390                   # 0x3836
	.long	11632                   # 0x2d70
	.long	26270                   # 0x669e
	.long	47819                   # 0xbacb
	.long	12328                   # 0x3028
	.long	19378                   # 0x4bb2
	.long	14161                   # 0x3751
	.long	32212                   # 0x7dd4
	.long	4892                    # 0x131c
	.long	38921                   # 0x9809
	.long	32020                   # 0x7d14
	.long	37576                   # 0x92c8
	.long	34301                   # 0x85fd
	.long	5167                    # 0x142f
	.long	11335                   # 0x2c47
	.long	7987                    # 0x1f33
	.long	38056                   # 0x94a8
	.long	7966                    # 0x1f1e
	.long	32462                   # 0x7ece
	.long	10738                   # 0x29f2
	.long	40981                   # 0xa015
	.long	10135                   # 0x2797
	.long	2943                    # 0xb7f
	.long	46597                   # 0xb605
	.long	51374                   # 0xc8ae
	.long	4230                    # 0x1086
	.long	858                     # 0x35a
	.long	25495                   # 0x6397
	.long	33165                   # 0x818d
	.long	40751                   # 0x9f2f
	.long	16554                   # 0x40aa
	.long	47555                   # 0xb9c3
	.long	52383                   # 0xcc9f
	.long	42824                   # 0xa748
	.long	29838                   # 0x748e
	.long	64711                   # 0xfcc7
	.long	62202                   # 0xf2fa
	.long	43999                   # 0xabdf
	.long	31387                   # 0x7a9b
	.long	1558                    # 0x616
	.long	17385                   # 0x43e9
	.long	63407                   # 0xf7af
	.long	39134                   # 0x98de
	.long	51686                   # 0xc9e6
	.long	3039                    # 0xbdf
	.long	50470                   # 0xc526
	.long	59674                   # 0xe91a
	.long	41095                   # 0xa087
	.long	58436                   # 0xe444
	.long	26600                   # 0x67e8
	.long	51833                   # 0xca79
	.long	33881                   # 0x8459
	.long	36735                   # 0x8f7f
	.long	54776                   # 0xd5f8
	.long	14942                   # 0x3a5e
	.long	22574                   # 0x582e
	.long	59006                   # 0xe67e
	.long	15800                   # 0x3db8
	.long	48069                   # 0xbbc5
	.long	26635                   # 0x680b
	.long	56551                   # 0xdce7
	.long	64623                   # 0xfc6f
	.long	8655                    # 0x21cf
	.long	43398                   # 0xa986
	.long	41911                   # 0xa3b7
	.long	38493                   # 0x965d
	.long	42574                   # 0xa64e
	.long	38577                   # 0x96b1
	.long	16957                   # 0x423d
	.long	8425                    # 0x20e9
	.long	40135                   # 0x9cc7
	.long	34342                   # 0x8626
	.long	6297                    # 0x1899
	.long	13734                   # 0x35a6
	.long	20492                   # 0x500c
	.long	9336                    # 0x2478
	.long	64204                   # 0xfacc
	.long	14630                   # 0x3926
	.long	50431                   # 0xc4ff
	.long	57104                   # 0xdf10
	.long	41231                   # 0xa10f
	.long	36729                   # 0x8f79
	.long	25449                   # 0x6369
	.long	12430                   # 0x308e
	.long	25969                   # 0x6571
	.long	40391                   # 0x9dc7
	.long	35004                   # 0x88bc
	.long	19440                   # 0x4bf0
	.long	56192                   # 0xdb80
	.long	17537                   # 0x4481
	.long	46075                   # 0xb3fb
	.long	47207                   # 0xb867
	.long	16624                   # 0x40f0
	.long	54730                   # 0xd5ca
	.long	25070                   # 0x61ee
	.long	58535                   # 0xe4a7
	.long	27688                   # 0x6c28
	.long	2108                    # 0x83c
	.long	31576                   # 0x7b58
	.long	44645                   # 0xae65
	.long	10533                   # 0x2925
	.long	6176                    # 0x1820
	.long	13451                   # 0x348b
	.long	16830                   # 0x41be
	.long	19910                   # 0x4dc6
	.long	33943                   # 0x8497
	.long	26166                   # 0x6636
	.long	18578                   # 0x4892
	.long	48574                   # 0xbdbe
	.long	11062                   # 0x2b36
	.long	10146                   # 0x27a2
	.long	24269                   # 0x5ecd
	.long	47791                   # 0xbaaf
	.long	35595                   # 0x8b0b
	.long	36699                   # 0x8f5b
	.long	8224                    # 0x2020
	.long	10450                   # 0x28d2
	.long	6168                    # 0x1818
	.long	27664                   # 0x6c10
	.long	1106                    # 0x452
	.long	23705                   # 0x5c99
	.long	8204                    # 0x200c
	.long	48314                   # 0xbcba
	.long	40330                   # 0x9d8a
	.long	62934                   # 0xf5d6
	.long	7848                    # 0x1ea8
	.long	33329                   # 0x8231
	.long	25086                   # 0x61fe
	.long	9956                    # 0x26e4
	.long	64906                   # 0xfd8a
	.long	4195                    # 0x1063
	.long	20489                   # 0x5009
	.long	5546                    # 0x15aa
	.long	17646                   # 0x44ee
	.long	37320                   # 0x91c8
	.long	25456                   # 0x6370
	.long	51590                   # 0xc986
	.long	63486                   # 0xf7fe
	.long	44034                   # 0xac02
	.long	34628                   # 0x8744
	.long	9012                    # 0x2334
	.long	54180                   # 0xd3a4
	.long	58897                   # 0xe611
	.long	56803                   # 0xdde3
	.long	24239                   # 0x5eaf
	.long	30060                   # 0x756c
	.long	65028                   # 0xfe04
	.long	34689                   # 0x8781
	.long	36228                   # 0x8d84
	.long	27156                   # 0x6a14
	.long	35796                   # 0x8bd4
	.long	59934                   # 0xea1e
	.long	35360                   # 0x8a20
	.long	18574                   # 0x488e
	.long	34728                   # 0x87a8
	.long	32759                   # 0x7ff7
	.long	26422                   # 0x6736
	.long	2521                    # 0x9d9
	.long	57845                   # 0xe1f5
	.long	36378                   # 0x8e1a
	.long	1891                    # 0x763
	.long	62041                   # 0xf259
	.long	56867                   # 0xde23
	.long	7437                    # 0x1d0d
	.long	14151                   # 0x3747
	.long	28651                   # 0x6feb
	.long	32893                   # 0x807d
	.long	205                     # 0xcd
	.long	26602                   # 0x67ea
	.long	11391                   # 0x2c7f
	.long	34833                   # 0x8811
	.long	35614                   # 0x8b1e
	.long	35                      # 0x23
	.long	28194                   # 0x6e22
	.long	26882                   # 0x6902
	.long	24274                   # 0x5ed2
	.long	58255                   # 0xe38f
	.long	26374                   # 0x6706
	.long	58964                   # 0xe654
	.long	28947                   # 0x7113
	.long	53530                   # 0xd11a
	.long	29224                   # 0x7228
	.long	23345                   # 0x5b31
	.long	23355                   # 0x5b3b
	.long	47798                   # 0xbab6
	.long	58073                   # 0xe2d9
	.long	56114                   # 0xdb32
	.long	8684                    # 0x21ec
	.long	60595                   # 0xecb3
	.long	48423                   # 0xbd27
	.long	45062                   # 0xb006
	.long	62486                   # 0xf416
	.long	44928                   # 0xaf80
	.long	36393                   # 0x8e29
	.long	4388                    # 0x1124
	.long	59080                   # 0xe6c8
	.long	65045                   # 0xfe15
	.long	37281                   # 0x91a1
	.long	59285                   # 0xe795
	.long	26111                   # 0x65ff
	.long	48673                   # 0xbe21
	.long	28583                   # 0x6fa7
	.long	61725                   # 0xf11d
	.long	48708                   # 0xbe44
	.long	56777                   # 0xddc9
	.long	23071                   # 0x5a1f
	.long	7447                    # 0x1d17
	.long	49496                   # 0xc158
	.long	49445                   # 0xc125
	.long	875                     # 0x36b
	.long	12908                   # 0x326c
	.long	37440                   # 0x9240
	.long	30099                   # 0x7593
	.long	36253                   # 0x8d9d
	.long	60795                   # 0xed7b
	.long	12361                   # 0x3049
	.long	28791                   # 0x7077
	.long	51373                   # 0xc8ad
	.long	21045                   # 0x5235
	.long	23850                   # 0x5d2a
	.long	34260                   # 0x85d4
	.long	571                     # 0x23b
	.long	20800                   # 0x5140
	.long	13653                   # 0x3555
	.long	36964                   # 0x9064
	.long	25188                   # 0x6264
	.long	7197                    # 0x1c1d
	.long	36473                   # 0x8e79
	.long	62470                   # 0xf406
	.long	946                     # 0x3b2
	.long	62584                   # 0xf478
	.long	45607                   # 0xb227
	.long	29529                   # 0x7359
	.long	58774                   # 0xe596
	.long	28779                   # 0x706b
	.long	20771                   # 0x5123
	.long	16309                   # 0x3fb5
	.long	36226                   # 0x8d82
	.long	4731                    # 0x127b
	.long	219                     # 0xdb
	.long	37101                   # 0x90ed
	.long	17639                   # 0x44e7
	.long	37659                   # 0x931b
	.long	1664                    # 0x680
	.long	53893                   # 0xd285
	.long	32918                   # 0x8096
	.long	14025                   # 0x36c9
	.long	17148                   # 0x42fc
	.long	18755                   # 0x4943
	.long	35070                   # 0x88fe
	.long	40998                   # 0xa026
	.long	53015                   # 0xcf17
	.long	35641                   # 0x8b39
	.long	61798                   # 0xf166
	.long	1132                    # 0x46c
	.long	7070                    # 0x1b9e
	.long	21451                   # 0x53cb
	.long	8329                    # 0x2089
	.long	43543                   # 0xaa17
	.long	18385                   # 0x47d1
	.long	9276                    # 0x243c
	.long	40592                   # 0x9e90
	.long	63992                   # 0xf9f8
	.long	38805                   # 0x9795
	.long	33830                   # 0x8426
	.long	27235                   # 0x6a63
	.long	59576                   # 0xe8b8
	.long	50139                   # 0xc3db
	.long	63462                   # 0xf7e6
	.long	64308                   # 0xfb34
	.long	50358                   # 0xc4b6
	.long	35027                   # 0x88d3
	.long	16411                   # 0x401b
	.long	22481                   # 0x57d1
	.long	36692                   # 0x8f54
	.long	4768                    # 0x12a0
	.long	55399                   # 0xd867
	.long	50717                   # 0xc61d
	.long	21916                   # 0x559c
	.long	8618                    # 0x21aa
	.long	20252                   # 0x4f1c
	.long	62914                   # 0xf5c2
	.long	61634                   # 0xf0c2
	.long	55893                   # 0xda55
	.long	59177                   # 0xe729
	.long	62766                   # 0xf52e
	.long	62963                   # 0xf5f3
	.long	15092                   # 0x3af4
	.long	5560                    # 0x15b8
	.long	40971                   # 0xa00b
	.long	33477                   # 0x82c5
	.long	14836                   # 0x39f4
	.long	16027                   # 0x3e9b
	.long	31933                   # 0x7cbd
	.long	53641                   # 0xd189
	.long	49857                   # 0xc2c1
	.long	59168                   # 0xe720
	.long	47682                   # 0xba42
	.long	34460                   # 0x869c
	.long	57094                   # 0xdf06
	.long	46454                   # 0xb576
	.long	19283                   # 0x4b53
	.long	26586                   # 0x67da
	.long	62865                   # 0xf591
	.long	41764                   # 0xa324
	.long	63278                   # 0xf72e
	.long	2098                    # 0x832
	.long	31628                   # 0x7b8c
	.long	48459                   # 0xbd4b
	.long	24014                   # 0x5dce
	.long	40246                   # 0x9d36
	.long	3175                    # 0xc67
	.long	21393                   # 0x5391
	.long	36344                   # 0x8df8
	.long	59069                   # 0xe6bd
	.long	15034                   # 0x3aba
	.long	33575                   # 0x8327
	.long	56496                   # 0xdcb0
	.long	30126                   # 0x75ae
	.long	39135                   # 0x98df
	.long	31931                   # 0x7cbb
	.long	63603                   # 0xf873
	.long	53971                   # 0xd2d3
	.long	47958                   # 0xbb56
	.long	30000                   # 0x7530
	.long	42076                   # 0xa45c
	.long	32279                   # 0x7e17
	.long	23632                   # 0x5c50
	.long	24222                   # 0x5e9e
	.long	1204                    # 0x4b4
	.long	15191                   # 0x3b57
	.long	5140                    # 0x1414
	.long	20487                   # 0x5007
	.long	41777                   # 0xa331
	.long	2470                    # 0x9a6
	.long	62251                   # 0xf32b
	.long	39519                   # 0x9a5f
	.long	4568                    # 0x11d8
	.long	28343                   # 0x6eb7
	.long	22442                   # 0x57aa
	.long	28582                   # 0x6fa6
	.long	3054                    # 0xbee
	.long	25618                   # 0x6412
	.long	49975                   # 0xc337
	.long	39398                   # 0x99e6
	.long	19151                   # 0x4acf
	.long	65009                   # 0xfdf1
	.long	7437                    # 0x1d0d
	.long	10111                   # 0x277f
	.long	29599                   # 0x739f
	.long	46572                   # 0xb5ec
	.long	42043                   # 0xa43b
	.long	27666                   # 0x6c12
	.long	35007                   # 0x88bf
	.long	24465                   # 0x5f91
	.long	57666                   # 0xe142
	.long	11548                   # 0x2d1c
	.long	56745                   # 0xdda9
	.long	15763                   # 0x3d93
	.long	35770                   # 0x8bba
	.long	57949                   # 0xe25d
	.long	30954                   # 0x78ea
	.long	40911                   # 0x9fcf
	.long	12900                   # 0x3264
	.long	7195                    # 0x1c1b
	.long	43381                   # 0xa975
	.long	9615                    # 0x258f
	.long	46714                   # 0xb67a
	.long	47949                   # 0xbb4d
	.long	37959                   # 0x9447
	.long	3620                    # 0xe24
	.long	10995                   # 0x2af3
	.long	41013                   # 0xa035
	.long	29238                   # 0x7236
	.long	60971                   # 0xee2b
	.long	14875                   # 0x3a1b
	.long	48389                   # 0xbd05
	.long	60444                   # 0xec1c
	.long	22313                   # 0x5729
	.long	58501                   # 0xe485
	.long	24508                   # 0x5fbc
	.long	3349                    # 0xd15
	.long	35008                   # 0x88c0
	.long	52174                   # 0xcbce
	.long	38357                   # 0x95d5
	.long	59473                   # 0xe851
	.long	44305                   # 0xad11
	.long	49905                   # 0xc2f1
	.long	50682                   # 0xc5fa
	.long	60068                   # 0xeaa4
	.long	20139                   # 0x4eab
	.long	43095                   # 0xa857
	.long	25486                   # 0x638e
	.long	61050                   # 0xee7a
	.long	55995                   # 0xdabb
	.long	32681                   # 0x7fa9
	.long	38895                   # 0x97ef
	.long	75                      # 0x4b
	.long	13859                   # 0x3623
	.long	21308                   # 0x533c
	.long	38034                   # 0x9492
	.long	17479                   # 0x4447
	.long	32304                   # 0x7e30
	.long	13511                   # 0x34c7
	.long	46718                   # 0xb67e
	.long	27739                   # 0x6c5b
	.long	28386                   # 0x6ee2
	.long	29571                   # 0x7383
	.long	22647                   # 0x5877
	.long	50699                   # 0xc60b
	.long	22536                   # 0x5808
	.long	47155                   # 0xb833
	.long	54049                   # 0xd321
	.long	57544                   # 0xe0c8
	.long	33794                   # 0x8402
	.long	26870                   # 0x68f6
	.long	51482                   # 0xc91a
	.long	12563                   # 0x3113
	.long	11239                   # 0x2be7
	.long	36628                   # 0x8f14
	.long	7095                    # 0x1bb7
	.long	31378                   # 0x7a92
	.long	14188                   # 0x376c
	.long	32581                   # 0x7f45
	.long	26893                   # 0x690d
	.long	4647                    # 0x1227
	.long	65262                   # 0xfeee
	.long	252                     # 0xfc
	.long	4722                    # 0x1272
	.long	13585                   # 0x3511
	.long	21561                   # 0x5439
	.long	42756                   # 0xa704
	.long	31064                   # 0x7958
	.long	53865                   # 0xd269
	.long	56267                   # 0xdbcb
	.long	12246                   # 0x2fd6
	.long	16068                   # 0x3ec4
	.long	19118                   # 0x4aae
	.long	41818                   # 0xa35a
	.long	38715                   # 0x973b
	.long	4281                    # 0x10b9
	.long	64354                   # 0xfb62
	.long	20335                   # 0x4f6f
	.long	58330                   # 0xe3da
	.long	56363                   # 0xdc2b
	.long	54129                   # 0xd371
	.long	19664                   # 0x4cd0
	.long	42309                   # 0xa545
	.long	1156                    # 0x484
	.long	30903                   # 0x78b7
	.long	13401                   # 0x3459
	.long	8251                    # 0x203b
	.long	62282                   # 0xf34a
	.long	27589                   # 0x6bc5
	.long	40832                   # 0x9f80
	.long	23639                   # 0x5c57
	.long	32237                   # 0x7ded
	.long	40558                   # 0x9e6e
	.long	23891                   # 0x5d53
	.long	36959                   # 0x905f
	.long	54143                   # 0xd37f
	.long	45452                   # 0xb18c
	.long	14180                   # 0x3764
	.long	19671                   # 0x4cd7
	.long	33781                   # 0x83f5
	.long	4911                    # 0x132f
	.long	31918                   # 0x7cae
	.long	49849                   # 0xc2b9
	.long	24029                   # 0x5ddd
	.long	8200                    # 0x2008
	.long	23029                   # 0x59f5
	.long	28311                   # 0x6e97
	.long	7018                    # 0x1b6a
	.long	43364                   # 0xa964
	.long	21105                   # 0x5271
	.long	63381                   # 0xf795
	.long	31957                   # 0x7cd5
	.long	40770                   # 0x9f42
	.long	40154                   # 0x9cda
	.long	33113                   # 0x8159
	.long	6137                    # 0x17f9
	.long	53556                   # 0xd134
	.long	41364                   # 0xa194
	.long	2883                    # 0xb43
	.long	15609                   # 0x3cf9
	.long	16660                   # 0x4114
	.long	26522                   # 0x679a
	.long	47846                   # 0xbae6
	.long	57218                   # 0xdf82
	.long	50414                   # 0xc4ee
	.long	19270                   # 0x4b46
	.long	45825                   # 0xb301
	.long	30330                   # 0x767a
	.long	33450                   # 0x82aa
	.long	65496                   # 0xffd8
	.long	64112                   # 0xfa70
	.long	38361                   # 0x95d9
	.long	31878                   # 0x7c86
	.long	48425                   # 0xbd29
	.long	62391                   # 0xf3b7
	.long	40078                   # 0x9c8e
	.long	5918                    # 0x171e
	.long	25166                   # 0x624e
	.long	47097                   # 0xb7f9
	.long	49282                   # 0xc082
	.long	46271                   # 0xb4bf
	.long	44942                   # 0xaf8e
	.long	15703                   # 0x3d57
	.long	21505                   # 0x5401
	.long	19561                   # 0x4c69
	.long	48816                   # 0xbeb0
	.long	27643                   # 0x6bfb
	.long	7581                    # 0x1d9d
	.long	24644                   # 0x6044
	.long	30526                   # 0x773e
	.long	23190                   # 0x5a96
	.long	41304                   # 0xa158
	.long	57049                   # 0xded9
	.long	5501                    # 0x157d
	.long	32986                   # 0x80da
	.long	41927                   # 0xa3c7
	.long	24771                   # 0x60c3
	.long	13275                   # 0x33db
	.long	6721                    # 0x1a41
	.long	58221                   # 0xe36d
	.long	13236                   # 0x33b4
	.long	5297                    # 0x14b1
	.long	31046                   # 0x7946
	.long	45114                   # 0xb03a
	.long	53723                   # 0xd1db
	.long	27901                   # 0x6cfd
	.long	19657                   # 0x4cc9
	.long	59641                   # 0xe8f9
	.long	53067                   # 0xcf4b
	.long	1218                    # 0x4c2
	.long	43388                   # 0xa97c
	.long	33803                   # 0x840b
	.long	46160                   # 0xb450
	.long	59091                   # 0xe6d3
	.long	55308                   # 0xd80c
	.long	185                     # 0xb9
	.long	42372                   # 0xa584
	.long	17415                   # 0x4407
	.long	7766                    # 0x1e56
	.long	1480                    # 0x5c8
	.long	47942                   # 0xbb46
	.long	30957                   # 0x78ed
	.long	42785                   # 0xa721
	.long	39455                   # 0x9a1f
	.long	36458                   # 0x8e6a
	.long	10235                   # 0x27fb
	.long	15846                   # 0x3de6
	.long	61229                   # 0xef2d
	.long	23511                   # 0x5bd7
	.long	22567                   # 0x5827
	.long	53914                   # 0xd29a
	.long	36747                   # 0x8f8b
	.long	27865                   # 0x6cd9
	.long	19424                   # 0x4be0
	.long	16325                   # 0x3fc5
	.long	16052                   # 0x3eb4
	.long	47326                   # 0xb8de
	.long	35982                   # 0x8c8e
	.long	10157                   # 0x27ad
	.long	34857                   # 0x8829
	.long	37200                   # 0x9150
	.long	53545                   # 0xd129
	.long	3124                    # 0xc34
	.long	17825                   # 0x45a1
	.long	47101                   # 0xb7fd
	.long	58433                   # 0xe441
	.long	18010                   # 0x465a
	.long	23937                   # 0x5d81
	.long	10312                   # 0x2848
	.long	25777                   # 0x64b1
	.long	25417                   # 0x6349
	.long	58254                   # 0xe38e
	.long	56734                   # 0xdd9e
	.long	2666                    # 0xa6a
	.long	32173                   # 0x7dad
	.long	27656                   # 0x6c08
	.long	12902                   # 0x3266
	.long	48019                   # 0xbb93
	.long	23349                   # 0x5b35
	.long	36413                   # 0x8e3d
	.long	5051                    # 0x13bb
	.long	11727                   # 0x2dcf
	.long	7624                    # 0x1dc8
	.long	32916                   # 0x8094
	.long	31151                   # 0x79af
	.long	23949                   # 0x5d8d
	.long	48968                   # 0xbf48
	.long	12941                   # 0x328d
	.long	59932                   # 0xea1c
	.long	59125                   # 0xe6f5
	.long	47799                   # 0xbab7
	.long	31596                   # 0x7b6c
	.long	47135                   # 0xb81f
	.long	50923                   # 0xc6eb
	.long	49421                   # 0xc10d
	.long	28700                   # 0x701c
	.long	43820                   # 0xab2c
	.long	1896                    # 0x768
	.long	52637                   # 0xcd9d
	.long	54133                   # 0xd375
	.long	27673                   # 0x6c19
	.long	12518                   # 0x30e6
	.long	46851                   # 0xb703
	.long	18871                   # 0x49b7
	.long	15185                   # 0x3b51
	.long	13489                   # 0x34b1
	.long	46527                   # 0xb5bf
	.long	28087                   # 0x6db7
	.long	61508                   # 0xf044
	.long	4340                    # 0x10f4
	.long	64500                   # 0xfbf4
	.long	1023                    # 0x3ff
	.long	16067                   # 0x3ec3
	.long	6588                    # 0x19bc
	.long	33939                   # 0x8493
	.long	47218                   # 0xb872
	.long	30537                   # 0x7749
	.long	17371                   # 0x43db
	.long	60160                   # 0xeb00
	.long	24933                   # 0x6165
	.long	10961                   # 0x2ad1
	.long	42423                   # 0xa5b7
	.long	56530                   # 0xdcd2
	.long	58096                   # 0xe2f0
	.long	27810                   # 0x6ca2
	.long	40415                   # 0x9ddf
	.long	21260                   # 0x530c
	.long	6095                    # 0x17cf
	.long	42311                   # 0xa547
	.long	8361                    # 0x20a9
	.long	60228                   # 0xeb44
	.long	4448                    # 0x1160
	.long	20879                   # 0x518f
	.long	41543                   # 0xa247
	.long	23319                   # 0x5b17
	.long	36064                   # 0x8ce0
	.long	55032                   # 0xd6f8
	.long	4310                    # 0x10d6
	.long	64151                   # 0xfa97
	.long	51005                   # 0xc73d
	.long	8650                    # 0x21ca
	.long	63115                   # 0xf68b
	.long	52028                   # 0xcb3c
	.long	24717                   # 0x608d
	.long	4167                    # 0x1047
	.long	20432                   # 0x4fd0
	.long	6400                    # 0x1900
	.long	34705                   # 0x8791
	.long	37803                   # 0x93ab
	.long	1024                    # 0x400
	.long	59638                   # 0xe8f6
	.long	48764                   # 0xbe7c
	.long	43447                   # 0xa9b7
	.long	50632                   # 0xc5c8
	.long	41324                   # 0xa16c
	.long	5721                    # 0x1659
	.long	25512                   # 0x63a8
	.long	62584                   # 0xf478
	.long	11816                   # 0x2e28
	.long	2287                    # 0x8ef
	.long	5409                    # 0x1521
	.long	6508                    # 0x196c
	.long	6736                    # 0x1a50
	.long	26289                   # 0x66b1
	.long	48052                   # 0xbbb4
	.long	30055                   # 0x7567
	.long	62353                   # 0xf391
	.long	37548                   # 0x92ac
	.long	34366                   # 0x863e
	.long	60969                   # 0xee29
	.long	23017                   # 0x59e9
	.long	43016                   # 0xa808
	.long	58548                   # 0xe4b4
	.long	9510                    # 0x2526
	.long	2198                    # 0x896
	.long	62716                   # 0xf4fc
	.long	29942                   # 0x74f6
	.long	8598                    # 0x2196
	.long	31885                   # 0x7c8d
	.long	2209                    # 0x8a1
	.long	9622                    # 0x2596
	.long	25987                   # 0x6583
	.long	50974                   # 0xc71e
	.long	53069                   # 0xcf4d
	.long	11084                   # 0x2b4c
	.long	26762                   # 0x688a
	.long	58790                   # 0xe5a6
	.long	36596                   # 0x8ef4
	.long	23811                   # 0x5d03
	.long	5071                    # 0x13cf
	.long	38883                   # 0x97e3
	.long	29220                   # 0x7224
	.long	11579                   # 0x2d3b
	.long	45619                   # 0xb233
	.long	55509                   # 0xd8d5
	.long	59631                   # 0xe8ef
	.long	10139                   # 0x279b
	.long	52327                   # 0xcc67
	.long	31644                   # 0x7b9c
	.long	44505                   # 0xadd9
	.long	47760                   # 0xba90
	.long	54661                   # 0xd585
	.long	21985                   # 0x55e1
	.long	40772                   # 0x9f44
	.long	64171                   # 0xfaab
	.long	24183                   # 0x5e77
	.long	37952                   # 0x9440
	.long	28577                   # 0x6fa1
	.long	32781                   # 0x800d
	.long	4301                    # 0x10cd
	.long	30787                   # 0x7843
	.long	42403                   # 0xa5a3
	.long	30289                   # 0x7651
	.long	16225                   # 0x3f61
	.long	29936                   # 0x74f0
	.long	41373                   # 0xa19d
	.long	42987                   # 0xa7eb
	.long	23191                   # 0x5a97
	.long	12433                   # 0x3091
	.long	1262                    # 0x4ee
	.long	28262                   # 0x6e66
	.long	51316                   # 0xc874
	.long	30483                   # 0x7713
	.long	39841                   # 0x9ba1
	.long	31400                   # 0x7aa8
	.long	20456                   # 0x4fe8
	.long	33937                   # 0x8491
	.long	41539                   # 0xa243
	.long	7247                    # 0x1c4f
	.long	45                      # 0x2d
	.long	20508                   # 0x501c
	.long	55007                   # 0xd6df
	.long	54706                   # 0xd5b2
	.long	42493                   # 0xa5fd
	.long	30244                   # 0x7624
	.long	53342                   # 0xd05e
	.long	1141                    # 0x475
	.long	2660                    # 0xa64
	.long	16383                   # 0x3fff
	.long	33922                   # 0x8482
	.long	6962                    # 0x1b32
	.long	47170                   # 0xb842
	.long	10790                   # 0x2a26
	.long	37251                   # 0x9183
	.long	63395                   # 0xf7a3
	.long	40726                   # 0x9f16
	.long	13088                   # 0x3320
	.long	40847                   # 0x9f8f
	.long	63917                   # 0xf9ad
	.long	25521                   # 0x63b1
	.long	42109                   # 0xa47d
	.long	26643                   # 0x6813
	.long	11301                   # 0x2c25
	.long	7056                    # 0x1b90
	.long	949                     # 0x3b5
	.long	42701                   # 0xa6cd
	.long	27513                   # 0x6b79
	.long	34886                   # 0x8846
	.long	18704                   # 0x4910
	.long	34760                   # 0x87c8
	.long	34931                   # 0x8873
	.long	39212                   # 0x992c
	.long	24232                   # 0x5ea8
	.long	24101                   # 0x5e25
	.long	16170                   # 0x3f2a
	.long	54476                   # 0xd4cc
	.long	11907                   # 0x2e83
	.long	17311                   # 0x439f
	.long	57136                   # 0xdf30
	.long	28291                   # 0x6e83
	.long	51233                   # 0xc821
	.long	64098                   # 0xfa62
	.long	9925                    # 0x26c5
	.long	62023                   # 0xf247
	.long	35813                   # 0x8be5
	.long	7785                    # 0x1e69
	.long	37214                   # 0x915e
	.long	48901                   # 0xbf05
	.long	48632                   # 0xbdf8
	.long	35595                   # 0x8b0b
	.long	8886                    # 0x22b6
	.long	25205                   # 0x6275
	.long	62239                   # 0xf31f
	.long	20188                   # 0x4edc
	.long	32262                   # 0x7e06
	.long	63188                   # 0xf6d4
	.long	62889                   # 0xf5a9
	.long	59775                   # 0xe97f
	.long	32538                   # 0x7f1a
	.long	16058                   # 0x3eba
	.long	28999                   # 0x7147
	.long	1933                    # 0x78d
	.long	55270                   # 0xd7e6
	.long	53231                   # 0xcfef
	.long	26034                   # 0x65b2
	.long	5904                    # 0x1710
	.long	42171                   # 0xa4bb
	.long	37942                   # 0x9436
	.long	23215                   # 0x5aaf
	.long	33772                   # 0x83ec
	.long	697                     # 0x2b9
	.long	8913                    # 0x22d1
	.long	32334                   # 0x7e4e
	.long	10622                   # 0x297e
	.long	5400                    # 0x1518
	.long	2612                    # 0xa34
	.long	18407                   # 0x47e7
	.long	42614                   # 0xa676
	.long	51513                   # 0xc939
	.long	1503                    # 0x5df
	.long	12674                   # 0x3182
	.long	60400                   # 0xebf0
	.long	26709                   # 0x6855
	.long	9377                    # 0x24a1
	.long	15052                   # 0x3acc
	.long	58971                   # 0xe65b
	.long	7029                    # 0x1b75
	.long	12405                   # 0x3075
	.long	53210                   # 0xcfda
	.long	39567                   # 0x9a8f
	.long	28463                   # 0x6f2f
	.long	16673                   # 0x4121
	.long	41500                   # 0xa21c
	.long	18198                   # 0x4716
	.long	4369                    # 0x1111
	.long	1998                    # 0x7ce
	.long	24102                   # 0x5e26
	.long	46540                   # 0xb5cc
	.long	39940                   # 0x9c04
	.long	47318                   # 0xb8d6
	.long	14776                   # 0x39b8
	.long	40637                   # 0x9ebd
	.long	56231                   # 0xdba7
	.long	47111                   # 0xb807
	.long	51260                   # 0xc83c
	.long	61631                   # 0xf0bf
	.long	49723                   # 0xc23b
	.long	4131                    # 0x1023
	.long	38710                   # 0x9736
	.long	35700                   # 0x8b74
	.long	5635                    # 0x1603
	.long	51384                   # 0xc8b8
	.long	30564                   # 0x7764
	.long	32344                   # 0x7e58
	.long	60761                   # 0xed59
	.long	45616                   # 0xb230
	.long	25779                   # 0x64b3
	.long	2254                    # 0x8ce
	.long	58022                   # 0xe2a6
	.long	13453                   # 0x348d
	.long	41821                   # 0xa35d
	.long	20949                   # 0x51d5
	.long	30126                   # 0x75ae
	.long	17785                   # 0x4579
	.long	39147                   # 0x98eb
	.long	34495                   # 0x86bf
	.long	19783                   # 0x4d47
	.long	63250                   # 0xf712
	.long	15500                   # 0x3c8c
	.long	59724                   # 0xe94c
	.long	45032                   # 0xafe8
	.long	30276                   # 0x7644
	.long	34825                   # 0x8809
	.long	35727                   # 0x8b8f
	.long	11851                   # 0x2e4b
	.long	20549                   # 0x5045
	.long	31822                   # 0x7c4e
	.long	61574                   # 0xf086
	.long	24681                   # 0x6069
	.long	4996                    # 0x1384
	.long	31739                   # 0x7bfb
	.long	30316                   # 0x766c
	.long	56380                   # 0xdc3c
	.long	62303                   # 0xf35f
	.long	62660                   # 0xf4c4
	.long	51605                   # 0xc995
	.long	42384                   # 0xa590
	.long	22903                   # 0x5977
	.long	53859                   # 0xd263
	.long	34870                   # 0x8836
	.long	36356                   # 0x8e04
	.long	30144                   # 0x75c0
	.long	55819                   # 0xda0b
	.long	946                     # 0x3b2
	.long	47929                   # 0xbb39
	.long	29431                   # 0x72f7
	.long	35442                   # 0x8a72
	.long	2177                    # 0x881
	.long	27145                   # 0x6a09
	.long	50942                   # 0xc6fe
	.long	61901                   # 0xf1cd
	.long	6641                    # 0x19f1
	.long	15682                   # 0x3d42
	.long	31190                   # 0x79d6
	.long	42368                   # 0xa580
	.long	27534                   # 0x6b8e
	.long	51740                   # 0xca1c
	.long	8654                    # 0x21ce
	.long	23572                   # 0x5c14
	.long	10885                   # 0x2a85
	.long	13651                   # 0x3553
	.long	55311                   # 0xd80f
	.long	41201                   # 0xa0f1
	.long	4495                    # 0x118f
	.long	52079                   # 0xcb6f
	.long	38325                   # 0x95b5
	.long	56101                   # 0xdb25
	.long	28927                   # 0x70ff
	.long	61228                   # 0xef2c
	.long	44424                   # 0xad88
	.long	63797                   # 0xf935
	.long	32048                   # 0x7d30
	.long	9033                    # 0x2349
	.long	54080                   # 0xd340
	.long	32994                   # 0x80e2
	.long	56962                   # 0xde82
	.long	17975                   # 0x4637
	.long	2900                    # 0xb54
	.long	59139                   # 0xe703
	.long	45120                   # 0xb040
	.long	53842                   # 0xd252
	.long	55504                   # 0xd8d0
	.long	51761                   # 0xca31
	.long	3989                    # 0xf95
	.long	21159                   # 0x52a7
	.long	28593                   # 0x6fb1
	.long	31523                   # 0x7b23
	.long	7363                    # 0x1cc3
	.long	37248                   # 0x9180
	.long	55095                   # 0xd737
	.long	18248                   # 0x4748
	.long	50899                   # 0xc6d3
	.long	44871                   # 0xaf47
	.long	59449                   # 0xe839
	.long	55394                   # 0xd862
	.long	31414                   # 0x7ab6
	.long	32238                   # 0x7dee
	.long	45959                   # 0xb387
	.long	60341                   # 0xebb5
	.long	27930                   # 0x6d1a
	.long	24848                   # 0x6110
	.long	58602                   # 0xe4ea
	.long	59978                   # 0xea4a
	.long	33881                   # 0x8459
	.long	47146                   # 0xb82a
	.long	27436                   # 0x6b2c
	.long	25307                   # 0x62db
	.long	65122                   # 0xfe62
	.long	30337                   # 0x7681
	.long	18911                   # 0x49df
	.long	44706                   # 0xaea2
	.long	18643                   # 0x48d3
	.long	8879                    # 0x22af
	.long	30932                   # 0x78d4
	.long	22632                   # 0x5868
	.long	30038                   # 0x7556
	.long	59525                   # 0xe885
	.long	54155                   # 0xd38b
	.long	37401                   # 0x9219
	.long	31237                   # 0x7a05
	.long	43715                   # 0xaac3
	.long	55649                   # 0xd961
	.long	16600                   # 0x40d8
	.long	23050                   # 0x5a0a
	.long	49562                   # 0xc19a
	.long	6459                    # 0x193b
	.long	54464                   # 0xd4c0
	.long	16264                   # 0x3f88
	.long	52418                   # 0xccc2
	.long	49269                   # 0xc075
	.long	44194                   # 0xaca2
	.long	11730                   # 0x2dd2
	.long	42335                   # 0xa55f
	.long	38636                   # 0x96ec
	.long	45611                   # 0xb22b
	.long	23945                   # 0x5d89
	.long	537                     # 0x219
	.long	5383                    # 0x1507
	.long	23531                   # 0x5beb
	.long	30874                   # 0x789a
	.long	24294                   # 0x5ee6
	.long	2702                    # 0xa8e
	.long	49517                   # 0xc16d
	.long	33173                   # 0x8195
	.long	33634                   # 0x8362
	.long	6614                    # 0x19d6
	.long	63212                   # 0xf6ec
	.long	27623                   # 0x6be7
	.long	60769                   # 0xed61
	.long	35077                   # 0x8905
	.long	58861                   # 0xe5ed
	.long	38948                   # 0x9824
	.long	25191                   # 0x6267
	.long	9925                    # 0x26c5
	.long	61998                   # 0xf22e
	.long	9217                    # 0x2401
	.long	16384                   # 0x4000
	.long	50926                   # 0xc6ee
	.long	25482                   # 0x638a
	.long	3267                    # 0xcc3
	.long	34659                   # 0x8763
	.long	4140                    # 0x102c
	.long	14997                   # 0x3a95
	.long	11458                   # 0x2cc2
	.long	42777                   # 0xa719
	.long	60609                   # 0xecc1
	.long	35404                   # 0x8a4c
	.long	43314                   # 0xa932
	.long	456                     # 0x1c8
	.long	58935                   # 0xe637
	.long	8652                    # 0x21cc
	.long	24750                   # 0x60ae
	.long	61637                   # 0xf0c5
	.long	58169                   # 0xe339
	.long	57923                   # 0xe243
	.long	29735                   # 0x7427
	.long	64783                   # 0xfd0f
	.long	55599                   # 0xd92f
	.long	57359                   # 0xe00f
	.long	60017                   # 0xea71
	.long	25141                   # 0x6235
	.long	50684                   # 0xc5fc
	.long	33429                   # 0x8295
	.long	50332                   # 0xc49c
	.long	60609                   # 0xecc1
	.long	29892                   # 0x74c4
	.long	59549                   # 0xe89d
	.long	11458                   # 0x2cc2
	.long	15282                   # 0x3bb2
	.long	19495                   # 0x4c27
	.long	14725                   # 0x3985
	.long	49942                   # 0xc316
	.long	23636                   # 0x5c54
	.long	29722                   # 0x741a
	.long	61400                   # 0xefd8
	.long	877                     # 0x36d
	.long	24795                   # 0x60db
	.long	31268                   # 0x7a24
	.long	44191                   # 0xac9f
	.long	25251                   # 0x62a3
	.long	24668                   # 0x605c
	.long	52843                   # 0xce6b
	.long	50001                   # 0xc351
	.long	20769                   # 0x5121
	.long	45476                   # 0xb1a4
	.long	42389                   # 0xa595
	.long	50505                   # 0xc549
	.long	44724                   # 0xaeb4
	.long	32452                   # 0x7ec4
	.long	42328                   # 0xa558
	.long	39205                   # 0x9925
	.long	57593                   # 0xe0f9
	.long	27476                   # 0x6b54
	.long	7098                    # 0x1bba
	.long	42389                   # 0xa595
	.long	22549                   # 0x5815
	.long	36990                   # 0x907e
	.long	36403                   # 0x8e33
	.long	34007                   # 0x84d7
	.long	52273                   # 0xcc31
	.long	55898                   # 0xda5a
	.long	48732                   # 0xbe5c
	.long	36679                   # 0x8f47
	.long	13998                   # 0x36ae
	.long	12919                   # 0x3277
	.long	32543                   # 0x7f1f
	.long	14875                   # 0x3a1b
	.long	37714                   # 0x9352
	.long	63812                   # 0xf944
	.long	59066                   # 0xe6ba
	.long	62966                   # 0xf5f6
	.long	22944                   # 0x59a0
	.long	46373                   # 0xb525
	.long	47431                   # 0xb947
	.long	43713                   # 0xaac1
	.long	26314                   # 0x66ca
	.long	24284                   # 0x5edc
	.long	28682                   # 0x700a
	.long	5502                    # 0x157e
	.long	56737                   # 0xdda1
	.long	5474                    # 0x1562
	.long	44707                   # 0xaea3
	.long	48794                   # 0xbe9a
	.long	32950                   # 0x80b6
	.long	51805                   # 0xca5d
	.long	25648                   # 0x6430
	.long	55500                   # 0xd8cc
	.long	23260                   # 0x5adc
	.long	62051                   # 0xf263
	.long	23971                   # 0x5da3
	.long	9997                    # 0x270d
	.long	52413                   # 0xccbd
	.long	7168                    # 0x1c00
	.long	46676                   # 0xb654
	.long	876                     # 0x36c
	.long	20087                   # 0x4e77
	.long	13683                   # 0x3573
	.long	15751                   # 0x3d87
	.long	57801                   # 0xe1c9
	.long	11959                   # 0x2eb7
	.long	9282                    # 0x2442
	.long	55231                   # 0xd7bf
	.long	34903                   # 0x8857
	.long	55655                   # 0xd967
	.long	37127                   # 0x9107
	.long	13081                   # 0x3319
	.long	16433                   # 0x4031
	.long	61411                   # 0xefe3
	.long	41763                   # 0xa323
	.long	21935                   # 0x55af
	.long	52612                   # 0xcd84
	.long	47238                   # 0xb886
	.long	1106                    # 0x452
	.long	35871                   # 0x8c1f
	.long	14652                   # 0x393c
	.long	52912                   # 0xceb0
	.long	61519                   # 0xf04f
	.long	4616                    # 0x1208
	.long	10636                   # 0x298c
	.long	58034                   # 0xe2b2
	.long	28588                   # 0x6fac
	.long	20633                   # 0x5099
	.long	44911                   # 0xaf6f
	.long	35756                   # 0x8bac
	.long	1773                    # 0x6ed
	.long	45787                   # 0xb2db
	.long	55843                   # 0xda23
	.long	15456                   # 0x3c60
	.long	61539                   # 0xf063
	.long	48108                   # 0xbbec
	.long	27416                   # 0x6b18
	.long	5285                    # 0x14a5
	.long	37804                   # 0x93ac
	.long	62319                   # 0xf36f
	.long	60940                   # 0xee0c
	.long	9395                    # 0x24b3
	.long	9864                    # 0x2688
	.long	11838                   # 0x2e3e
	.long	5270                    # 0x1496
	.long	51628                   # 0xc9ac
	.long	33773                   # 0x83ed
	.long	57883                   # 0xe21b
	.long	33330                   # 0x8232
	.long	34880                   # 0x8840
	.long	28218                   # 0x6e3a
	.long	47982                   # 0xbb6e
	.long	22256                   # 0x56f0
	.long	24201                   # 0x5e89
	.long	52599                   # 0xcd77
	.long	32892                   # 0x807c
	.long	16699                   # 0x413b
	.long	15651                   # 0x3d23
	.long	53525                   # 0xd115
	.long	61610                   # 0xf0aa
	.long	51407                   # 0xc8cf
	.long	55298                   # 0xd802
	.long	41862                   # 0xa386
	.long	41714                   # 0xa2f2
	.long	5218                    # 0x1462
	.long	37865                   # 0x93e9
	.long	24286                   # 0x5ede
	.long	32634                   # 0x7f7a
	.long	43150                   # 0xa88e
	.long	62090                   # 0xf28a
	.long	29418                   # 0x72ea
	.long	38554                   # 0x969a
	.long	5949                    # 0x173d
	.long	39282                   # 0x9972
	.long	50392                   # 0xc4d8
	.long	11220                   # 0x2bd4
	.long	25374                   # 0x631e
	.long	18630                   # 0x48c6
	.long	3567                    # 0xdef
	.long	58704                   # 0xe550
	.long	53510                   # 0xd106
	.long	31785                   # 0x7c29
	.long	41151                   # 0xa0bf
	.long	10230                   # 0x27f6
	.long	55986                   # 0xdab2
	.long	28214                   # 0x6e36
	.long	43122                   # 0xa872
	.long	7149                    # 0x1bed
	.long	43865                   # 0xab59
	.long	31111                   # 0x7987
	.long	3223                    # 0xc97
	.long	29736                   # 0x7428
	.long	20873                   # 0x5189
	.long	45085                   # 0xb01d
	.long	5914                    # 0x171a
	.long	26091                   # 0x65eb
	.long	17414                   # 0x4406
	.long	30200                   # 0x75f8
	.long	58726                   # 0xe566
	.long	60564                   # 0xec94
	.long	26755                   # 0x6883
	.long	22608                   # 0x5850
	.long	33583                   # 0x832f
	.long	32704                   # 0x7fc0
	.long	61890                   # 0xf1c2
	.long	18439                   # 0x4807
	.long	43924                   # 0xab94
	.long	21729                   # 0x54e1
	.long	37069                   # 0x90cd
	.long	47491                   # 0xb983
	.long	14897                   # 0x3a31
	.long	25043                   # 0x61d3
	.long	13740                   # 0x35ac
	.long	56048                   # 0xdaf0
	.long	35273                   # 0x89c9
	.long	4190                    # 0x105e
	.long	18726                   # 0x4926
	.long	12859                   # 0x323b
	.long	11339                   # 0x2c4b
	.long	62591                   # 0xf47f
	.long	43970                   # 0xabc2
	.long	14563                   # 0x38e3
	.long	26791                   # 0x68a7
	.long	64843                   # 0xfd4b
	.long	59648                   # 0xe900
	.long	32705                   # 0x7fc1
	.long	25399                   # 0x6337
	.long	11527                   # 0x2d07
	.long	62906                   # 0xf5ba
	.long	18589                   # 0x489d
	.long	6555                    # 0x199b
	.long	24125                   # 0x5e3d
	.long	41197                   # 0xa0ed
	.long	40138                   # 0x9cca
	.long	56829                   # 0xddfd
	.long	37551                   # 0x92af
	.long	58578                   # 0xe4d2
	.long	35218                   # 0x8992
	.long	59280                   # 0xe790
	.long	30111                   # 0x759f
	.long	17173                   # 0x4315
	.long	8642                    # 0x21c2
	.long	55155                   # 0xd773
	.long	30914                   # 0x78c2
	.long	64690                   # 0xfcb2
	.long	24892                   # 0x613c
	.long	35104                   # 0x8920
	.long	17881                   # 0x45d9
	.long	37752                   # 0x9378
	.long	46444                   # 0xb56c
	.long	14936                   # 0x3a58
	.long	16186                   # 0x3f3a
	.long	61007                   # 0xee4f
	.long	41728                   # 0xa300
	.long	15494                   # 0x3c86
	.long	55119                   # 0xd74f
	.long	8897                    # 0x22c1
	.long	40893                   # 0x9fbd
	.long	1110                    # 0x456
	.long	6267                    # 0x187b
	.long	59482                   # 0xe85a
	.long	7666                    # 0x1df2
	.long	30392                   # 0x76b8
	.long	35143                   # 0x8947
	.long	47804                   # 0xbabc
	.long	21686                   # 0x54b6
	.long	7158                    # 0x1bf6
	.long	40846                   # 0x9f8e
	.long	56904                   # 0xde48
	.long	903                     # 0x387
	.long	5422                    # 0x152e
	.long	8541                    # 0x215d
	.long	9545                    # 0x2549
	.long	60577                   # 0xeca1
	.long	39455                   # 0x9a1f
	.long	8699                    # 0x21fb
	.long	19933                   # 0x4ddd
	.long	9024                    # 0x2340
	.long	26580                   # 0x67d4
	.long	57685                   # 0xe155
	.long	55468                   # 0xd8ac
	.long	41517                   # 0xa22d
	.long	8336                    # 0x2090
	.long	50939                   # 0xc6fb
	.long	17709                   # 0x452d
	.long	23830                   # 0x5d16
	.long	40522                   # 0x9e4a
	.long	26606                   # 0x67ee
	.long	64723                   # 0xfcd3
	.long	41633                   # 0xa2a1
	.long	32874                   # 0x806a
	.long	58669                   # 0xe52d
	.long	49299                   # 0xc093
	.long	63266                   # 0xf722
	.long	28276                   # 0x6e74
	.long	31567                   # 0x7b4f
	.long	19416                   # 0x4bd8
	.long	35434                   # 0x8a6a
	.long	6878                    # 0x1ade
	.long	10784                   # 0x2a20
	.long	36337                   # 0x8df1
	.long	12300                   # 0x300c
	.long	19326                   # 0x4b7e
	.long	45882                   # 0xb33a
	.long	7341                    # 0x1cad
	.long	58781                   # 0xe59d
	.long	54582                   # 0xd536
	.long	27274                   # 0x6a8a
	.long	2269                    # 0x8dd
	.long	15626                   # 0x3d0a
	.long	19424                   # 0x4be0
	.long	57737                   # 0xe189
	.long	57143                   # 0xdf37
	.long	27760                   # 0x6c70
	.long	43140                   # 0xa884
	.long	9316                    # 0x2464
	.long	51590                   # 0xc986
	.long	18127                   # 0x46cf
	.long	35923                   # 0x8c53
	.long	50777                   # 0xc659
	.long	59760                   # 0xe970
	.long	3261                    # 0xcbd
	.long	43910                   # 0xab86
	.long	43523                   # 0xaa03
	.long	991                     # 0x3df
	.long	6650                    # 0x19fa
	.long	9554                    # 0x2552
	.long	20408                   # 0x4fb8
	.long	42084                   # 0xa464
	.long	16432                   # 0x4030
	.long	31192                   # 0x79d8
	.long	12886                   # 0x3256
	.long	28732                   # 0x703c
	.long	50518                   # 0xc556
	.long	58768                   # 0xe590
	.long	36073                   # 0x8ce9
	.long	43764                   # 0xaaf4
	.long	47814                   # 0xbac6
	.long	63348                   # 0xf774
	.long	46033                   # 0xb3d1
	.long	63441                   # 0xf7d1
	.long	17236                   # 0x4354
	.long	38235                   # 0x955b
	.long	55048                   # 0xd708
	.long	44996                   # 0xafc4
	.long	15839                   # 0x3ddf
	.long	64365                   # 0xfb6d
	.long	31050                   # 0x794a
	.long	33966                   # 0x84ae
	.long	34752                   # 0x87c0
	.long	16291                   # 0x3fa3
	.long	28190                   # 0x6e1e
	.long	38013                   # 0x947d
	.long	60201                   # 0xeb29
	.long	6177                    # 0x1821
	.long	39004                   # 0x985c
	.long	1315                    # 0x523
	.long	15732                   # 0x3d74
	.long	59412                   # 0xe814
	.long	43399                   # 0xa987
	.long	32164                   # 0x7da4
	.long	25069                   # 0x61ed
	.long	56285                   # 0xdbdd
	.long	60897                   # 0xede1
	.long	10051                   # 0x2743
	.long	49518                   # 0xc16e
	.long	31434                   # 0x7aca
	.long	53815                   # 0xd237
	.long	31796                   # 0x7c34
	.long	29246                   # 0x723e
	.long	34313                   # 0x8609
	.long	29701                   # 0x7405
	.long	46482                   # 0xb592
	.long	7012                    # 0x1b64
	.long	19214                   # 0x4b0e
	.long	25942                   # 0x6556
	.long	22851                   # 0x5943
	.long	18043                   # 0x467b
	.long	56992                   # 0xdea0
	.long	56818                   # 0xddf2
	.long	52795                   # 0xce3b
	.long	7747                    # 0x1e43
	.long	19472                   # 0x4c10
	.long	25272                   # 0x62b8
	.long	2412                    # 0x96c
	.long	25650                   # 0x6432
	.long	64276                   # 0xfb14
	.long	3727                    # 0xe8f
	.long	41382                   # 0xa1a6
	.long	58153                   # 0xe329
	.long	47127                   # 0xb817
	.long	8010                    # 0x1f4a
	.long	17686                   # 0x4516
	.long	37876                   # 0x93f4
	.long	3371                    # 0xd2b
	.long	27737                   # 0x6c59
	.long	21858                   # 0x5562
	.long	34806                   # 0x87f6
	.long	16017                   # 0x3e91
	.long	53655                   # 0xd197
	.long	64052                   # 0xfa34
	.long	50330                   # 0xc49a
	.long	17820                   # 0x459c
	.long	44999                   # 0xafc7
	.long	57342                   # 0xdffe
	.long	37034                   # 0x90aa
	.long	5405                    # 0x151d
	.long	14657                   # 0x3941
	.long	55077                   # 0xd725
	.long	62398                   # 0xf3be
	.long	5939                    # 0x1733
	.long	42336                   # 0xa560
	.long	4609                    # 0x1201
	.long	25412                   # 0x6344
	.long	2072                    # 0x818
	.long	7022                    # 0x1b6e
	.long	51062                   # 0xc776
	.long	813                     # 0x32d
	.long	10749                   # 0x29fd
	.long	26908                   # 0x691c
	.long	58966                   # 0xe656
	.long	57876                   # 0xe214
	.long	34918                   # 0x8866
	.long	11116                   # 0x2b6c
	.long	30217                   # 0x7609
	.long	38290                   # 0x9592
	.long	38853                   # 0x97c5
	.long	52075                   # 0xcb6b
	.long	7560                    # 0x1d88
	.long	54870                   # 0xd656
	.long	40194                   # 0x9d02
	.long	6076                    # 0x17bc
	.long	39664                   # 0x9af0
	.long	58015                   # 0xe29f
	.long	51075                   # 0xc783
	.long	31470                   # 0x7aee
	.long	29513                   # 0x7349
	.long	56481                   # 0xdca1
	.long	46128                   # 0xb430
	.long	19055                   # 0x4a6f
	.long	53343                   # 0xd05f
	.long	52067                   # 0xcb63
	.long	61391                   # 0xefcf
	.long	57952                   # 0xe260
	.long	11943                   # 0x2ea7
	.long	63464                   # 0xf7e8
	.long	64974                   # 0xfdce
	.long	63005                   # 0xf61d
	.long	64277                   # 0xfb15
	.long	10188                   # 0x27cc
	.long	24377                   # 0x5f39
	.long	57707                   # 0xe16b
	.long	2528                    # 0x9e0
	.long	59296                   # 0xe7a0
	.long	3287                    # 0xcd7
	.long	32745                   # 0x7fe9
	.long	32050                   # 0x7d32
	.long	42140                   # 0xa49c
	.long	19285                   # 0x4b55
	.long	39610                   # 0x9aba
	.long	31475                   # 0x7af3
	.long	59479                   # 0xe857
	.long	45686                   # 0xb276
	.long	5603                    # 0x15e3
	.long	51958                   # 0xcaf6
	.long	31226                   # 0x79fa
	.long	37074                   # 0x90d2
	.long	15936                   # 0x3e40
	.long	22171                   # 0x569b
	.long	17666                   # 0x4502
	.long	34991                   # 0x88af
	.long	9978                    # 0x26fa
	.long	4197                    # 0x1065
	.long	30846                   # 0x787e
	.long	2394                    # 0x95a
	.long	16141                   # 0x3f0d
	.long	28774                   # 0x7066
	.long	1833                    # 0x729
	.long	13610                   # 0x352a
	.long	27515                   # 0x6b7b
	.long	12021                   # 0x2ef5
	.long	37988                   # 0x9464
	.long	19686                   # 0x4ce6
	.long	14549                   # 0x38d5
	.long	31748                   # 0x7c04
	.long	22973                   # 0x59bd
	.long	47295                   # 0xb8bf
	.long	63798                   # 0xf936
	.long	65114                   # 0xfe5a
	.long	1044                    # 0x414
	.long	37872                   # 0x93f0
	.long	31053                   # 0x794d
	.long	60523                   # 0xec6b
	.long	18022                   # 0x4666
	.long	36656                   # 0x8f30
	.long	46946                   # 0xb762
	.long	49248                   # 0xc060
	.long	8194                    # 0x2002
	.long	62882                   # 0xf5a2
	.long	5883                    # 0x16fb
	.long	25860                   # 0x6504
	.long	32337                   # 0x7e51
	.long	15861                   # 0x3df5
	.long	30058                   # 0x756a
	.long	63183                   # 0xf6cf
	.long	18256                   # 0x4750
	.long	46199                   # 0xb477
	.long	26422                   # 0x6736
	.long	20089                   # 0x4e79
	.long	59809                   # 0xe9a1
	.long	53937                   # 0xd2b1
	.long	32110                   # 0x7d6e
	.long	32261                   # 0x7e05
	.long	8088                    # 0x1f98
	.long	46659                   # 0xb643
	.long	64009                   # 0xfa09
	.long	31061                   # 0x7955
	.long	28418                   # 0x6f02
	.long	62271                   # 0xf33f
	.long	30639                   # 0x77af
	.long	29462                   # 0x7316
	.long	34607                   # 0x872f
	.long	61692                   # 0xf0fc
	.long	24450                   # 0x5f82
	.long	52630                   # 0xcd96
	.long	32813                   # 0x802d
	.long	5860                    # 0x16e4
	.long	36342                   # 0x8df6
	.long	41007                   # 0xa02f
	.long	3206                    # 0xc86
	.long	42226                   # 0xa4f2
	.long	1332                    # 0x534
	.long	35543                   # 0x8ad7
	.long	58087                   # 0xe2e7
	.long	31390                   # 0x7a9e
	.long	33190                   # 0x81a6
	.long	10807                   # 0x2a37
	.long	12053                   # 0x2f15
	.long	59612                   # 0xe8dc
	.long	30896                   # 0x78b0
	.long	6326                    # 0x18b6
	.long	48014                   # 0xbb8e
	.long	63006                   # 0xf61e
	.long	38588                   # 0x96bc
	.long	56102                   # 0xdb26
	.long	44130                   # 0xac62
	.long	37061                   # 0x90c5
	.long	21627                   # 0x547b
	.long	7012                    # 0x1b64
	.long	33797                   # 0x8405
	.long	52267                   # 0xcc2b
	.long	36475                   # 0x8e7b
	.long	2868                    # 0xb34
	.long	48423                   # 0xbd27
	.long	60925                   # 0xedfd
	.long	55498                   # 0xd8ca
	.long	15700                   # 0x3d54
	.long	1249                    # 0x4e1
	.long	26305                   # 0x66c1
	.long	56708                   # 0xdd84
	.long	4455                    # 0x1167
	.long	2995                    # 0xbb3
	.long	58040                   # 0xe2b8
	.long	39998                   # 0x9c3e
	.long	61082                   # 0xee9a
	.long	23894                   # 0x5d56
	.long	7652                    # 0x1de4
	.long	6354                    # 0x18d2
	.long	35947                   # 0x8c6b
	.long	1729                    # 0x6c1
	.long	37250                   # 0x9182
	.long	42273                   # 0xa521
	.long	49743                   # 0xc24f
	.long	34721                   # 0x87a1
	.long	15325                   # 0x3bdd
	.long	40309                   # 0x9d75
	.long	13315                   # 0x3403
	.long	52387                   # 0xcca3
	.long	61936                   # 0xf1f0
	.long	20327                   # 0x4f67
	.long	20648                   # 0x50a8
	.long	48667                   # 0xbe1b
	.long	56802                   # 0xdde2
	.long	23516                   # 0x5bdc
	.long	31555                   # 0x7b43
	.long	52191                   # 0xcbdf
	.long	13479                   # 0x34a7
	.long	47255                   # 0xb897
	.long	53440                   # 0xd0c0
	.long	39784                   # 0x9b68
	.long	38427                   # 0x961b
	.long	57895                   # 0xe227
	.long	42779                   # 0xa71b
	.long	30931                   # 0x78d3
	.long	32357                   # 0x7e65
	.long	38325                   # 0x95b5
	.long	54825                   # 0xd629
	.long	40010                   # 0x9c4a
	.long	44679                   # 0xae87
	.long	25236                   # 0x6294
	.long	41739                   # 0xa30b
	.long	16394                   # 0x400a
	.long	1974                    # 0x7b6
	.long	25946                   # 0x655a
	.long	51115                   # 0xc7ab
	.long	17299                   # 0x4393
	.long	719                     # 0x2cf
	.long	64430                   # 0xfbae
	.long	4150                    # 0x1036
	.long	62655                   # 0xf4bf
	.long	19221                   # 0x4b15
	.long	24798                   # 0x60de
	.long	45787                   # 0xb2db
	.long	10488                   # 0x28f8
	.long	48315                   # 0xbcbb
	.long	11806                   # 0x2e1e
	.long	62679                   # 0xf4d7
	.long	61794                   # 0xf162
	.long	59061                   # 0xe6b5
	.long	50584                   # 0xc598
	.long	36042                   # 0x8cca
	.long	31953                   # 0x7cd1
	.long	42943                   # 0xa7bf
	.long	13285                   # 0x33e5
	.long	62884                   # 0xf5a4
	.long	9765                    # 0x2625
	.long	51610                   # 0xc99a
	.long	52174                   # 0xcbce
	.long	49775                   # 0xc26f
	.long	30754                   # 0x7822
	.long	11874                   # 0x2e62
	.long	25978                   # 0x657a
	.long	47148                   # 0xb82c
	.long	13848                   # 0x3618
	.long	51924                   # 0xcad4
	.long	32727                   # 0x7fd7
	.long	31148                   # 0x79ac
	.long	52643                   # 0xcda3
	.long	31621                   # 0x7b85
	.long	35298                   # 0x89e2
	.long	49762                   # 0xc262
	.long	50842                   # 0xc69a
	.long	60097                   # 0xeac1
	.long	30013                   # 0x753d
	.long	61330                   # 0xef92
	.long	42876                   # 0xa77c
	.long	41819                   # 0xa35b
	.long	58474                   # 0xe46a
	.long	39134                   # 0x98de
	.long	35345                   # 0x8a11
	.long	43522                   # 0xaa02
	.long	9640                    # 0x25a8
	.long	1762                    # 0x6e2
	.long	20929                   # 0x51c1
	.long	22925                   # 0x598d
	.long	64646                   # 0xfc86
	.long	30694                   # 0x77e6
	.long	8999                    # 0x2327
	.long	51284                   # 0xc854
	.long	14933                   # 0x3a55
	.long	39753                   # 0x9b49
	.long	63159                   # 0xf6b7
	.long	40911                   # 0x9fcf
	.long	21365                   # 0x5375
	.long	11471                   # 0x2ccf
	.long	27299                   # 0x6aa3
	.long	54092                   # 0xd34c
	.long	42619                   # 0xa67b
	.long	14406                   # 0x3846
	.long	20177                   # 0x4ed1
	.long	12382                   # 0x305e
	.long	64169                   # 0xfaa9
	.long	5484                    # 0x156c
	.long	6943                    # 0x1b1f
	.long	28646                   # 0x6fe6
	.long	1278                    # 0x4fe
	.long	49819                   # 0xc29b
	.long	4930                    # 0x1342
	.long	59752                   # 0xe968
	.long	23417                   # 0x5b79
	.long	40275                   # 0x9d53
	.long	37738                   # 0x936a
	.long	33057                   # 0x8121
	.long	42037                   # 0xa435
	.long	58668                   # 0xe52c
	.long	55982                   # 0xdaae
	.long	41147                   # 0xa0bb
	.long	23826                   # 0x5d12
	.long	64981                   # 0xfdd5
	.long	26896                   # 0x6910
	.long	38760                   # 0x9768
	.long	39199                   # 0x991f
	.long	24519                   # 0x5fc7
	.long	14135                   # 0x3737
	.long	60564                   # 0xec94
	.long	35990                   # 0x8c96
	.long	41435                   # 0xa1db
	.long	49121                   # 0xbfe1
	.long	13074                   # 0x3312
	.long	55841                   # 0xda21
	.long	3762                    # 0xeb2
	.long	25456                   # 0x6370
	.long	54474                   # 0xd4ca
	.long	9246                    # 0x241e
	.long	32399                   # 0x7e8f
	.long	17585                   # 0x44b1
	.long	10525                   # 0x291d
	.long	16682                   # 0x412a
	.long	22515                   # 0x57f3
	.long	4741                    # 0x1285
	.long	40099                   # 0x9ca3
	.long	62790                   # 0xf546
	.long	42480                   # 0xa5f0
	.long	7620                    # 0x1dc4
	.long	39291                   # 0x997b
	.long	35612                   # 0x8b1c
	.long	63602                   # 0xf872
	.long	14902                   # 0x3a36
	.long	59438                   # 0xe82e
	.long	63047                   # 0xf647
	.long	41798                   # 0xa346
	.long	32662                   # 0x7f96
	.long	36710                   # 0x8f66
	.long	781                     # 0x30d
	.long	46798                   # 0xb6ce
	.long	31739                   # 0x7bfb
	.long	36772                   # 0x8fa4
	.long	22697                   # 0x58a9
	.long	15324                   # 0x3bdc
	.long	49846                   # 0xc2b6
	.long	13002                   # 0x32ca
	.long	19086                   # 0x4a8e
	.long	9766                    # 0x2626
	.long	1941                    # 0x795
	.long	28333                   # 0x6ead
	.long	42165                   # 0xa4b5
	.long	19526                   # 0x4c46
	.long	38858                   # 0x97ca
	.long	58847                   # 0xe5df
	.long	42041                   # 0xa439
	.long	43599                   # 0xaa4f
	.long	33410                   # 0x8282
	.long	39295                   # 0x997f
	.long	20543                   # 0x503f
	.long	41030                   # 0xa046
	.long	13050                   # 0x32fa
	.long	56155                   # 0xdb5b
	.long	39096                   # 0x98b8
	.long	27952                   # 0x6d30
	.long	50058                   # 0xc38a
	.long	36607                   # 0x8eff
	.long	4215                    # 0x1077
	.long	17184                   # 0x4320
	.long	7782                    # 0x1e66
	.long	4996                    # 0x1384
	.long	63982                   # 0xf9ee
	.long	39521                   # 0x9a61
	.long	41768                   # 0xa328
	.long	21143                   # 0x5297
	.long	54845                   # 0xd63d
	.long	26078                   # 0x65de
	.long	34146                   # 0x8562
	.long	8395                    # 0x20cb
	.long	35844                   # 0x8c04
	.long	36087                   # 0x8cf7
	.long	36728                   # 0x8f78
	.long	12473                   # 0x30b9
	.long	55613                   # 0xd93d
	.long	10050                   # 0x2742
	.long	5784                    # 0x1698
	.long	32118                   # 0x7d76
	.long	53650                   # 0xd192
	.long	39194                   # 0x991a
	.long	5877                    # 0x16f5
	.long	8657                    # 0x21d1
	.long	14688                   # 0x3960
	.long	18927                   # 0x49ef
	.long	64813                   # 0xfd2d
	.long	53784                   # 0xd218
	.long	46879                   # 0xb71f
	.long	49335                   # 0xc0b7
	.long	24856                   # 0x6118
	.long	51094                   # 0xc796
	.long	983                     # 0x3d7
	.long	32638                   # 0x7f7e
	.long	56091                   # 0xdb1b
	.long	64966                   # 0xfdc6
	.long	6623                    # 0x19df
	.long	32323                   # 0x7e43
	.long	20573                   # 0x505d
	.long	61468                   # 0xf01c
	.long	58402                   # 0xe422
	.long	54719                   # 0xd5bf
	.long	4327                    # 0x10e7
	.long	28710                   # 0x7026
	.long	25270                   # 0x62b6
	.long	41056                   # 0xa060
	.long	41184                   # 0xa0e0
	.long	15347                   # 0x3bf3
	.long	51106                   # 0xc7a2
	.long	46968                   # 0xb778
	.long	47465                   # 0xb969
	.long	39220                   # 0x9934
	.long	20627                   # 0x5093
	.long	53342                   # 0xd05e
	.long	47878                   # 0xbb06
	.long	35315                   # 0x89f3
	.long	6733                    # 0x1a4d
	.long	47155                   # 0xb833
	.long	23564                   # 0x5c0c
	.long	53613                   # 0xd16d
	.long	30954                   # 0x78ea
	.long	48420                   # 0xbd24
	.long	39171                   # 0x9903
	.long	31937                   # 0x7cc1
	.long	15522                   # 0x3ca2
	.long	29726                   # 0x741e
	.long	31367                   # 0x7a87
	.long	22145                   # 0x5681
	.long	62050                   # 0xf262
	.long	51941                   # 0xcae5
	.long	18077                   # 0x469d
	.long	54916                   # 0xd684
	.long	41124                   # 0xa0a4
	.long	22404                   # 0x5784
	.long	18090                   # 0x46aa
	.long	859                     # 0x35b
	.long	63460                   # 0xf7e4
	.long	59274                   # 0xe78a
	.long	16206                   # 0x3f4e
	.long	49031                   # 0xbf87
	.long	40707                   # 0x9f03
	.long	63672                   # 0xf8b8
	.long	22715                   # 0x58bb
	.long	61334                   # 0xef96
	.long	51478                   # 0xc916
	.long	5057                    # 0x13c1
	.long	31113                   # 0x7989
	.long	58212                   # 0xe364
	.long	52212                   # 0xcbf4
	.long	54677                   # 0xd595
	.long	46289                   # 0xb4d1
	.long	17630                   # 0x44de
	.long	37561                   # 0x92b9
	.long	19924                   # 0x4dd4
	.long	49568                   # 0xc1a0
	.long	53083                   # 0xcf5b
	.long	49651                   # 0xc1f3
	.long	15399                   # 0x3c27
	.long	9692                    # 0x25dc
	.long	46165                   # 0xb455
	.long	1804                    # 0x70c
	.long	27769                   # 0x6c79
	.long	35545                   # 0x8ad9
	.long	42929                   # 0xa7b1
	.long	50174                   # 0xc3fe
	.long	53635                   # 0xd183
	.long	43788                   # 0xab0c
	.long	48098                   # 0xbbe2
	.long	47374                   # 0xb90e
	.long	59994                   # 0xea5a
	.long	31593                   # 0x7b69
	.long	22545                   # 0x5811
	.long	58130                   # 0xe312
	.long	54309                   # 0xd425
	.long	18343                   # 0x47a7
	.long	44073                   # 0xac29
	.long	59366                   # 0xe7e6
	.long	49456                   # 0xc130
	.long	36749                   # 0x8f8d
	.long	46043                   # 0xb3db
	.long	38598                   # 0x96c6
	.long	17502                   # 0x445e
	.long	63673                   # 0xf8b9
	.long	10623                   # 0x297f
	.long	37426                   # 0x9232
	.long	47705                   # 0xba59
	.long	63707                   # 0xf8db
	.long	21541                   # 0x5425
	.long	63105                   # 0xf681
	.long	7863                    # 0x1eb7
	.long	2170                    # 0x87a
	.long	64909                   # 0xfd8d
	.long	35633                   # 0x8b31
	.long	37715                   # 0x9353
	.long	42302                   # 0xa53e
	.long	20271                   # 0x4f2f
	.long	25815                   # 0x64d7
	.long	20554                   # 0x504a
	.long	2833                    # 0xb11
	.long	7653                    # 0x1de5
	.long	15013                   # 0x3aa5
	.long	34427                   # 0x867b
	.long	30198                   # 0x75f6
	.long	7607                    # 0x1db7
	.long	23200                   # 0x5aa0
	.long	48541                   # 0xbd9d
	.long	51680                   # 0xc9e0
	.long	17030                   # 0x4286
	.long	32461                   # 0x7ecd
	.long	22893                   # 0x596d
	.long	63073                   # 0xf661
	.long	5523                    # 0x1593
	.long	40395                   # 0x9dcb
	.long	61211                   # 0xef1b
	.long	16147                   # 0x3f13
	.long	12286                   # 0x2ffe
	.long	43380                   # 0xa974
	.long	14318                   # 0x37ee
	.long	33827                   # 0x8423
	.long	40949                   # 0x9ff5
	.long	22181                   # 0x56a5
	.long	35998                   # 0x8c9e
	.long	40323                   # 0x9d83
	.long	57814                   # 0xe1d6
	.long	8177                    # 0x1ff1
	.long	17089                   # 0x42c1
	.long	12549                   # 0x3105
	.long	33992                   # 0x84c8
	.long	37644                   # 0x930c
	.long	15383                   # 0x3c17
	.long	41645                   # 0xa2ad
	.long	52657                   # 0xcdb1
	.long	49810                   # 0xc292
	.long	6307                    # 0x18a3
	.long	60264                   # 0xeb68
	.long	7474                    # 0x1d32
	.long	54848                   # 0xd640
	.long	46409                   # 0xb549
	.long	24504                   # 0x5fb8
	.long	21774                   # 0x550e
	.long	3766                    # 0xeb6
	.long	22042                   # 0x561a
	.long	27297                   # 0x6aa1
	.long	44162                   # 0xac82
	.long	17717                   # 0x4535
	.long	43444                   # 0xa9b4
	.long	56448                   # 0xdc80
	.long	61097                   # 0xeea9
	.long	57762                   # 0xe1a2
	.long	24739                   # 0x60a3
	.long	36511                   # 0x8e9f
	.long	14408                   # 0x3848
	.long	60737                   # 0xed41
	.long	11298                   # 0x2c22
	.long	6686                    # 0x1a1e
	.long	3379                    # 0xd33
	.long	28387                   # 0x6ee3
	.long	19236                   # 0x4b24
	.long	37371                   # 0x91fb
	.long	495                     # 0x1ef
	.long	34619                   # 0x873b
	.long	13481                   # 0x34a9
	.long	53152                   # 0xcfa0
	.long	18893                   # 0x49cd
	.long	19788                   # 0x4d4c
	.long	47881                   # 0xbb09
	.long	26367                   # 0x66ff
	.long	9101                    # 0x238d
	.long	28754                   # 0x7052
	.long	50871                   # 0xc6b7
	.long	30875                   # 0x789b
	.long	32520                   # 0x7f08
	.long	7377                    # 0x1cd1
	.long	58172                   # 0xe33c
	.long	11146                   # 0x2b8a
	.long	25094                   # 0x6206
	.long	36081                   # 0x8cf1
	.long	2058                    # 0x80a
	.long	20656                   # 0x50b0
	.long	28307                   # 0x6e93
	.long	26798                   # 0x68ae
	.long	57167                   # 0xdf4f
	.long	42715                   # 0xa6db
	.long	21999                   # 0x55ef
	.long	2929                    # 0xb71
	.long	49402                   # 0xc0fa
	.long	25378                   # 0x6322
	.long	31316                   # 0x7a54
	.long	3102                    # 0xc1e
	.long	62750                   # 0xf51e
	.long	31812                   # 0x7c44
	.long	37721                   # 0x9359
	.long	10695                   # 0x29c7
	.long	19428                   # 0x4be4
	.long	56614                   # 0xdd26
	.long	30483                   # 0x7713
	.long	1773                    # 0x6ed
	.long	17445                   # 0x4425
	.long	39584                   # 0x9aa0
	.long	30527                   # 0x773f
	.long	2780                    # 0xadc
	.long	4923                    # 0x133b
	.long	63048                   # 0xf648
	.long	10158                   # 0x27ae
	.long	63096                   # 0xf678
	.long	8658                    # 0x21d2
	.long	35252                   # 0x89b4
	.long	33641                   # 0x8369
	.long	10717                   # 0x29dd
	.long	55908                   # 0xda64
	.long	61948                   # 0xf1fc
	.long	37515                   # 0x928b
	.long	47539                   # 0xb9b3
	.long	39128                   # 0x98d8
	.long	59514                   # 0xe87a
	.long	50468                   # 0xc524
	.long	22994                   # 0x59d2
	.long	19357                   # 0x4b9d
	.long	16249                   # 0x3f79
	.long	26096                   # 0x65f0
	.long	16571                   # 0x40bb
	.long	48061                   # 0xbbbd
	.long	63817                   # 0xf949
	.long	27266                   # 0x6a82
	.long	1953                    # 0x7a1
	.long	54895                   # 0xd66f
	.long	57749                   # 0xe195
	.long	3727                    # 0xe8f
	.long	6804                    # 0x1a94
	.long	31798                   # 0x7c36
	.long	34254                   # 0x85ce
	.long	9584                    # 0x2570
	.long	36721                   # 0x8f71
	.long	31766                   # 0x7c16
	.long	19742                   # 0x4d1e
	.long	34281                   # 0x85e9
	.long	40425                   # 0x9de9
	.long	54995                   # 0xd6d3
	.long	2386                    # 0x952
	.long	51142                   # 0xc7c6
	.long	45367                   # 0xb137
	.long	64335                   # 0xfb4f
	.long	23121                   # 0x5a51
	.long	27371                   # 0x6aeb
	.long	37927                   # 0x9427
	.long	17099                   # 0x42cb
	.long	12303                   # 0x300f
	.long	60921                   # 0xedf9
	.long	36456                   # 0x8e68
	.long	28552                   # 0x6f88
	.long	21481                   # 0x53e9
	.long	53027                   # 0xcf23
	.long	11077                   # 0x2b45
	.long	19762                   # 0x4d32
	.long	14757                   # 0x39a5
	.long	13031                   # 0x32e7
	.long	9121                    # 0x23a1
	.long	6971                    # 0x1b3b
	.long	16758                   # 0x4176
	.long	15925                   # 0x3e35
	.long	38769                   # 0x9771
	.long	51012                   # 0xc744
	.long	25509                   # 0x63a5
	.long	9954                    # 0x26e2
	.long	17243                   # 0x435b
	.long	45252                   # 0xb0c4
	.long	44236                   # 0xaccc
	.long	57668                   # 0xe144
	.long	34711                   # 0x8797
	.long	46622                   # 0xb61e
	.long	43274                   # 0xa90a
	.long	14542                   # 0x38ce
	.long	45421                   # 0xb16d
	.long	859                     # 0x35b
	.long	41913                   # 0xa3b9
	.long	17812                   # 0x4594
	.long	17958                   # 0x4626
	.long	54217                   # 0xd3c9
	.long	13197                   # 0x338d
	.long	54415                   # 0xd48f
	.long	17233                   # 0x4351
	.long	34678                   # 0x8776
	.long	41906                   # 0xa3b2
	.long	28311                   # 0x6e97
	.long	54440                   # 0xd4a8
	.long	56664                   # 0xdd58
	.long	41342                   # 0xa17e
	.long	63561                   # 0xf849
	.long	63635                   # 0xf893
	.long	58100                   # 0xe2f4
	.long	13950                   # 0x367e
	.long	36868                   # 0x9004
	.long	43576                   # 0xaa38
	.long	39460                   # 0x9a24
	.long	46822                   # 0xb6e6
	.long	60819                   # 0xed93
	.long	19176                   # 0x4ae8
	.long	25522                   # 0x63b2
	.long	52951                   # 0xced7
	.long	53887                   # 0xd27f
	.long	6609                    # 0x19d1
	.long	30689                   # 0x77e1
	.long	2893                    # 0xb4d
	.long	52030                   # 0xcb3e
	.long	31548                   # 0x7b3c
	.long	44807                   # 0xaf07
	.long	4307                    # 0x10d3
	.long	49507                   # 0xc163
	.long	33488                   # 0x82d0
	.long	17504                   # 0x4460
	.long	38386                   # 0x95f2
	.long	50721                   # 0xc621
	.long	52183                   # 0xcbd7
	.long	14756                   # 0x39a4
	.long	13496                   # 0x34b8
	.long	41087                   # 0xa07f
	.long	5884                    # 0x16fc
	.long	54838                   # 0xd636
	.long	39113                   # 0x98c9
	.long	3983                    # 0xf8f
	.long	47402                   # 0xb92a
	.long	53063                   # 0xcf47
	.long	40851                   # 0x9f93
	.long	25443                   # 0x6363
	.long	26987                   # 0x696b
	.long	22138                   # 0x567a
	.long	20726                   # 0x50f6
	.long	46163                   # 0xb453
	.long	47660                   # 0xba2c
	.long	8142                    # 0x1fce
	.long	34514                   # 0x86d2
	.long	54269                   # 0xd3fd
	.long	38831                   # 0x97af
	.long	37408                   # 0x9220
	.long	40764                   # 0x9f3c
	.long	4844                    # 0x12ec
	.long	16679                   # 0x4127
	.long	45071                   # 0xb00f
	.long	54351                   # 0xd44f
	.long	50167                   # 0xc3f7
	.long	62575                   # 0xf46f
	.long	27201                   # 0x6a41
	.long	35352                   # 0x8a18
	.long	49222                   # 0xc046
	.long	41957                   # 0xa3e5
	.long	48849                   # 0xbed1
	.long	24774                   # 0x60c6
	.long	47842                   # 0xbae2
	.long	38151                   # 0x9507
	.long	63887                   # 0xf98f
	.long	51825                   # 0xca71
	.long	20018                   # 0x4e32
	.long	51414                   # 0xc8d6
	.long	27141                   # 0x6a05
	.long	45461                   # 0xb195
	.long	12866                   # 0x3242
	.long	49279                   # 0xc07f
	.long	651                     # 0x28b
	.long	59029                   # 0xe695
	.long	31403                   # 0x7aab
	.long	8793                    # 0x2259
	.long	28008                   # 0x6d68
	.long	20137                   # 0x4ea9
	.long	47625                   # 0xba09
	.long	65416                   # 0xff88
	.long	60901                   # 0xede5
	.long	52469                   # 0xccf5
	.long	16559                   # 0x40af
	.long	40436                   # 0x9df4
	.long	41284                   # 0xa144
	.long	1190                    # 0x4a6
	.long	37475                   # 0x9263
	.long	2949                    # 0xb85
	.long	36542                   # 0x8ebe
	.long	21162                   # 0x52aa
	.long	44906                   # 0xaf6a
	.long	19855                   # 0x4d8f
	.long	45936                   # 0xb370
	.long	27212                   # 0x6a4c
	.long	58007                   # 0xe297
	.long	44287                   # 0xacff
	.long	13502                   # 0x34be
	.long	12489                   # 0x30c9
	.long	30165                   # 0x75d5
	.long	40643                   # 0x9ec3
	.long	57950                   # 0xe25e
	.long	43031                   # 0xa817
	.long	24386                   # 0x5f42
	.long	58601                   # 0xe4e9
	.long	36525                   # 0x8ead
	.long	55789                   # 0xd9ed
	.long	1859                    # 0x743
	.long	64533                   # 0xfc15
	.long	10390                   # 0x2896
	.long	49484                   # 0xc14c
	.long	64413                   # 0xfb9d
	.long	5755                    # 0x167b
	.long	36417                   # 0x8e41
	.long	15436                   # 0x3c4c
	.long	46191                   # 0xb46f
	.long	12165                   # 0x2f85
	.long	16626                   # 0x40f2
	.long	18131                   # 0x46d3
	.long	15114                   # 0x3b0a
	.long	53168                   # 0xcfb0
	.long	39293                   # 0x997d
	.long	60020                   # 0xea74
	.long	7488                    # 0x1d40
	.long	19693                   # 0x4ced
	.long	21697                   # 0x54c1
	.long	65495                   # 0xffd7
	.long	63980                   # 0xf9ec
	.long	35199                   # 0x897f
	.long	12448                   # 0x30a0
	.long	28609                   # 0x6fc1
	.long	10306                   # 0x2842
	.long	4862                    # 0x12fe
	.long	6105                    # 0x17d9
	.long	34692                   # 0x8784
	.long	63463                   # 0xf7e7
	.long	42630                   # 0xa686
	.long	24945                   # 0x6171
	.long	65322                   # 0xff2a
	.long	41627                   # 0xa29b
	.long	35336                   # 0x8a08
	.long	49270                   # 0xc076
	.long	40504                   # 0x9e38
	.long	41091                   # 0xa083
	.long	20151                   # 0x4eb7
	.long	55940                   # 0xda84
	.long	21747                   # 0x54f3
	.long	32316                   # 0x7e3c
	.long	7030                    # 0x1b76
	.long	39878                   # 0x9bc6
	.long	47430                   # 0xb946
	.long	60198                   # 0xeb26
	.long	13635                   # 0x3543
	.long	41915                   # 0xa3bb
	.long	2150                    # 0x866
	.long	33328                   # 0x8230
	.long	63612                   # 0xf87c
	.long	2109                    # 0x83d
	.long	31772                   # 0x7c1c
	.long	33275                   # 0x81fb
	.long	14557                   # 0x38dd
	.long	60381                   # 0xebdd
	.long	43581                   # 0xaa3d
	.long	19419                   # 0x4bdb
	.long	950                     # 0x3b6
	.long	12737                   # 0x31c1
	.long	17347                   # 0x43c3
	.long	43580                   # 0xaa3c
	.long	37682                   # 0x9332
	.long	17133                   # 0x42ed
	.long	19671                   # 0x4cd7
	.long	7482                    # 0x1d3a
	.long	868                     # 0x364
	.long	60175                   # 0xeb0f
	.long	48574                   # 0xbdbe
	.long	21019                   # 0x521b
	.long	50579                   # 0xc593
	.long	4785                    # 0x12b1
	.long	53336                   # 0xd058
	.long	57609                   # 0xe109
	.long	44663                   # 0xae77
	.long	35230                   # 0x899e
	.long	52272                   # 0xcc30
	.long	58298                   # 0xe3ba
	.long	11609                   # 0x2d59
	.long	54422                   # 0xd496
	.long	26090                   # 0x65ea
	.long	9685                    # 0x25d5
	.long	56532                   # 0xdcd4
	.long	57862                   # 0xe206
	.long	42960                   # 0xa7d0
	.long	5553                    # 0x15b1
	.long	52707                   # 0xcde3
	.long	21005                   # 0x520d
	.long	24973                   # 0x618d
	.long	53658                   # 0xd19a
	.long	33742                   # 0x83ce
	.long	42320                   # 0xa550
	.long	31702                   # 0x7bd6
	.long	5889                    # 0x1701
	.long	59453                   # 0xe83d
	.long	51374                   # 0xc8ae
	.long	13371                   # 0x343b
	.long	60321                   # 0xeba1
	.long	46013                   # 0xb3bd
	.long	61945                   # 0xf1f9
	.long	15805                   # 0x3dbd
	.long	31057                   # 0x7951
	.long	1194                    # 0x4aa
	.long	3605                    # 0xe15
	.long	23130                   # 0x5a5a
	.long	45857                   # 0xb321
	.long	38835                   # 0x97b3
	.long	9866                    # 0x268a
	.long	38619                   # 0x96db
	.long	50445                   # 0xc50d
	.long	64289                   # 0xfb21
	.long	64709                   # 0xfcc5
	.long	60130                   # 0xeae2
	.long	55285                   # 0xd7f5
	.long	57035                   # 0xdecb
	.long	37555                   # 0x92b3
	.long	60838                   # 0xeda6
	.long	44207                   # 0xacaf
	.long	58560                   # 0xe4c0
	.long	20275                   # 0x4f33
	.long	32329                   # 0x7e49
	.long	26767                   # 0x688f
	.long	62595                   # 0xf483
	.long	64031                   # 0xfa1f
	.long	32656                   # 0x7f90
	.long	56513                   # 0xdcc1
	.long	49869                   # 0xc2cd
	.long	46027                   # 0xb3cb
	.long	51298                   # 0xc862
	.long	30347                   # 0x768b
	.long	42437                   # 0xa5c5
	.long	1567                    # 0x61f
	.long	61404                   # 0xefdc
	.long	43631                   # 0xaa6f
	.long	5172                    # 0x1434
	.long	18998                   # 0x4a36
	.long	23953                   # 0x5d91
	.long	44008                   # 0xabe8
	.long	28865                   # 0x70c1
	.long	62572                   # 0xf46c
	.long	28917                   # 0x70f5
	.long	27618                   # 0x6be2
	.long	61746                   # 0xf132
	.long	23511                   # 0x5bd7
	.long	17367                   # 0x43d7
	.long	53245                   # 0xcffd
	.long	61066                   # 0xee8a
	.long	12669                   # 0x317d
	.long	31916                   # 0x7cac
	.long	54091                   # 0xd34b
	.long	32945                   # 0x80b1
	.long	64245                   # 0xfaf5
	.long	15322                   # 0x3bda
	.long	30004                   # 0x7534
	.long	62741                   # 0xf515
	.long	47978                   # 0xbb6a
	.long	20981                   # 0x51f5
	.long	47074                   # 0xb7e2
	.long	28469                   # 0x6f35
	.long	6744                    # 0x1a58
	.long	11885                   # 0x2e6d
	.long	5370                    # 0x14fa
	.long	8311                    # 0x2077
	.long	7753                    # 0x1e49
	.long	49002                   # 0xbf6a
	.long	13484                   # 0x34ac
	.long	26752                   # 0x6880
	.long	7419                    # 0x1cfb
	.long	57492                   # 0xe094
	.long	55617                   # 0xd941
	.long	4455                    # 0x1167
	.long	20873                   # 0x5189
	.long	17699                   # 0x4523
	.long	665                     # 0x299
	.long	44384                   # 0xad60
	.long	35066                   # 0x88fa
	.long	53911                   # 0xd297
	.long	39915                   # 0x9beb
	.long	47735                   # 0xba77
	.long	20291                   # 0x4f43
	.long	28470                   # 0x6f36
	.long	15144                   # 0x3b28
	.long	19001                   # 0x4a39
	.long	43792                   # 0xab10
	.long	45149                   # 0xb05d
	.long	16206                   # 0x3f4e
	.long	26234                   # 0x667a
	.long	594                     # 0x252
	.long	63280                   # 0xf730
	.long	54703                   # 0xd5af
	.long	7338                    # 0x1caa
	.long	9630                    # 0x259e
	.long	60074                   # 0xeaaa
	.long	15650                   # 0x3d22
	.long	17383                   # 0x43e7
	.long	43540                   # 0xaa14
	.long	29134                   # 0x71ce
	.long	44135                   # 0xac67
	.long	50959                   # 0xc70f
	.long	21090                   # 0x5262
	.long	34216                   # 0x85a8
	.long	55414                   # 0xd876
	.long	41963                   # 0xa3eb
	.long	51915                   # 0xcacb
	.long	56080                   # 0xdb10
	.long	20811                   # 0x514b
	.long	21445                   # 0x53c5
	.long	44455                   # 0xada7
	.long	60726                   # 0xed36
	.long	3645                    # 0xe3d
	.long	64746                   # 0xfcea
	.long	23660                   # 0x5c6c
	.long	18789                   # 0x4965
	.long	18211                   # 0x4723
	.long	1916                    # 0x77c
	.long	63938                   # 0xf9c2
	.long	34417                   # 0x8671
	.long	28150                   # 0x6df6
	.long	64533                   # 0xfc15
	.long	32162                   # 0x7da2
	.long	17318                   # 0x43a6
	.long	6335                    # 0x18bf
	.long	41792                   # 0xa340
	.long	11856                   # 0x2e50
	.long	21985                   # 0x55e1
	.long	59175                   # 0xe727
	.long	55396                   # 0xd864
	.long	51119                   # 0xc7af
	.long	37775                   # 0x938f
	.long	40819                   # 0x9f73
	.long	6673                    # 0x1a11
	.long	6455                    # 0x1937
	.long	30697                   # 0x77e9
	.long	48636                   # 0xbdfc
	.long	58371                   # 0xe403
	.long	21241                   # 0x52f9
	.long	3912                    # 0xf48
	.long	14280                   # 0x37c8
	.long	160                     # 0xa0
	.long	64638                   # 0xfc7e
	.long	17925                   # 0x4605
	.long	64907                   # 0xfd8b
	.long	22763                   # 0x58eb
	.long	36715                   # 0x8f6b
	.long	17582                   # 0x44ae
	.long	24679                   # 0x6067
	.long	35117                   # 0x892d
	.long	52000                   # 0xcb20
	.long	52830                   # 0xce5e
	.long	34114                   # 0x8542
	.long	18626                   # 0x48c2
	.long	4612                    # 0x1204
	.long	40450                   # 0x9e02
	.long	60418                   # 0xec02
	.long	16468                   # 0x4054
	.long	62435                   # 0xf3e3
	.long	54057                   # 0xd329
	.long	6328                    # 0x18b8
	.long	48019                   # 0xbb93
	.long	26296                   # 0x66b8
	.long	47147                   # 0xb82b
	.long	54692                   # 0xd5a4
	.long	32752                   # 0x7ff0
	.long	12308                   # 0x3014
	.long	37793                   # 0x93a1
	.long	25587                   # 0x63f3
	.long	33550                   # 0x830e
	.long	41705                   # 0xa2e9
	.long	39867                   # 0x9bbb
	.long	33710                   # 0x83ae
	.long	40807                   # 0x9f67
	.long	57793                   # 0xe1c1
	.long	33081                   # 0x8139
	.long	63570                   # 0xf852
	.long	28972                   # 0x712c
	.long	50664                   # 0xc5e8
	.long	22714                   # 0x58ba
	.long	64089                   # 0xfa59
	.long	37128                   # 0x9108
	.long	10008                   # 0x2718
	.long	32668                   # 0x7f9c
	.long	55754                   # 0xd9ca
	.long	14620                   # 0x391c
	.long	7582                    # 0x1d9e
	.long	50636                   # 0xc5cc
	.long	31088                   # 0x7970
	.long	4481                    # 0x1181
	.long	39157                   # 0x98f5
	.long	37416                   # 0x9228
	.long	52500                   # 0xcd14
	.long	65454                   # 0xffae
	.long	19027                   # 0x4a53
	.long	41657                   # 0xa2b9
	.long	32670                   # 0x7f9e
	.long	31335                   # 0x7a67
	.long	13914                   # 0x365a
	.long	58257                   # 0xe391
	.long	64885                   # 0xfd75
	.long	55619                   # 0xd943
	.long	32588                   # 0x7f4c
	.long	33060                   # 0x8124
	.long	30890                   # 0x78aa
	.long	24845                   # 0x610d
	.long	605                     # 0x25d
	.long	28925                   # 0x70fd
	.long	53817                   # 0xd239
	.long	51269                   # 0xc845
	.long	51639                   # 0xc9b7
	.long	52371                   # 0xcc93
	.long	22861                   # 0x594d
	.long	61647                   # 0xf0cf
	.long	19503                   # 0x4c2f
	.long	13079                   # 0x3317
	.long	10731                   # 0x29eb
	.long	27085                   # 0x69cd
	.long	63715                   # 0xf8e3
	.long	41819                   # 0xa35b
	.long	31566                   # 0x7b4e
	.long	37337                   # 0x91d9
	.long	13699                   # 0x3583
	.long	18531                   # 0x4863
	.long	37255                   # 0x9187
	.long	32726                   # 0x7fd6
	.long	60188                   # 0xeb1c
	.long	4389                    # 0x1125
	.long	64061                   # 0xfa3d
	.long	8566                    # 0x2176
	.long	62646                   # 0xf4b6
	.long	63411                   # 0xf7b3
	.long	64185                   # 0xfab9
	.long	29698                   # 0x7402
	.long	30935                   # 0x78d7
	.long	29539                   # 0x7363
	.long	54544                   # 0xd510
	.long	31540                   # 0x7b34
	.long	58464                   # 0xe460
	.long	42825                   # 0xa749
	.long	17274                   # 0x437a
	.long	44567                   # 0xae17
	.long	29660                   # 0x73dc
	.long	40135                   # 0x9cc7
	.long	40678                   # 0x9ee6
	.long	49163                   # 0xc00b
	.long	53215                   # 0xcfdf
	.long	51409                   # 0xc8d1
	.long	10712                   # 0x29d8
	.long	51394                   # 0xc8c2
	.long	27692                   # 0x6c2c
	.long	42279                   # 0xa527
	.long	23195                   # 0x5a9b
	.long	41391                   # 0xa1af
	.long	60810                   # 0xed8a
	.long	60450                   # 0xec22
	.long	8581                    # 0x2185
	.long	55462                   # 0xd8a6
	.long	64839                   # 0xfd47
	.long	7107                    # 0x1bc3
	.long	64028                   # 0xfa1c
	.long	61949                   # 0xf1fd
	.long	4982                    # 0x1376
	.long	62677                   # 0xf4d5
	.long	26112                   # 0x6600
	.long	35917                   # 0x8c4d
	.long	26680                   # 0x6838
	.long	15120                   # 0x3b10
	.long	1921                    # 0x781
	.long	19609                   # 0x4c99
	.long	57945                   # 0xe259
	.long	19195                   # 0x4afb
	.long	64176                   # 0xfab0
	.long	22070                   # 0x5636
	.long	59331                   # 0xe7c3
	.long	39319                   # 0x9997
	.long	5697                    # 0x1641
	.long	47010                   # 0xb7a2
	.long	25192                   # 0x6268
	.long	16410                   # 0x401a
	.long	32868                   # 0x8064
	.long	52885                   # 0xce95
	.long	58689                   # 0xe541
	.long	56064                   # 0xdb00
	.long	28740                   # 0x7044
	.long	53963                   # 0xd2cb
	.long	50978                   # 0xc722
	.long	37322                   # 0x91ca
	.long	43889                   # 0xab71
	.long	50282                   # 0xc46a
	.long	44429                   # 0xad8d
	.long	42381                   # 0xa58d
	.long	46695                   # 0xb667
	.long	49411                   # 0xc103
	.long	39522                   # 0x9a62
	.long	7271                    # 0x1c67
	.long	19792                   # 0x4d50
	.long	666                     # 0x29a
	.long	22391                   # 0x5777
	.long	21713                   # 0x54d1
	.long	20275                   # 0x4f33
	.long	14801                   # 0x39d1
	.long	40909                   # 0x9fcd
	.long	18916                   # 0x49e4
	.long	36871                   # 0x9007
	.long	34704                   # 0x8790
	.long	58235                   # 0xe37b
	.long	42568                   # 0xa648
	.long	16178                   # 0x3f32
	.long	17891                   # 0x45e3
	.long	58978                   # 0xe662
	.long	49046                   # 0xbf96
	.long	5240                    # 0x1478
	.long	52131                   # 0xcba3
	.long	39574                   # 0x9a96
	.long	33981                   # 0x84bd
	.long	40558                   # 0x9e6e
	.long	25017                   # 0x61b9
	.long	5767                    # 0x1687
	.long	18911                   # 0x49df
	.long	9763                    # 0x2623
	.long	50196                   # 0xc414
	.long	61292                   # 0xef6c
	.long	56458                   # 0xdc8a
	.long	34071                   # 0x8517
	.long	35278                   # 0x89ce
	.long	63730                   # 0xf8f2
	.long	53863                   # 0xd267
	.long	35945                   # 0x8c69
	.long	20585                   # 0x5069
	.long	10040                   # 0x2738
	.long	56220                   # 0xdb9c
	.long	35386                   # 0x8a3a
	.long	50949                   # 0xc705
	.long	9600                    # 0x2580
	.long	6721                    # 0x1a41
	.long	20117                   # 0x4e95
	.long	2299                    # 0x8fb
	.long	49290                   # 0xc08a
	.long	36295                   # 0x8dc7
	.long	20191                   # 0x4edf
	.long	42732                   # 0xa6ec
	.long	19806                   # 0x4d5e
	.long	25431                   # 0x6357
	.long	29328                   # 0x7290
	.long	59380                   # 0xe7f4
	.long	59412                   # 0xe814
	.long	4350                    # 0x10fe
	.long	18861                   # 0x49ad
	.long	65179                   # 0xfe9b
	.long	23262                   # 0x5ade
	.long	28624                   # 0x6fd0
	.long	49839                   # 0xc2af
	.long	19018                   # 0x4a4a
	.long	19547                   # 0x4c5b
	.long	18374                   # 0x47c6
	.long	54297                   # 0xd419
	.long	17741                   # 0x454d
	.long	6701                    # 0x1a2d
	.long	24706                   # 0x6082
	.long	38326                   # 0x95b6
	.long	16742                   # 0x4166
	.long	15390                   # 0x3c1e
	.long	8177                    # 0x1ff1
	.long	2155                    # 0x86b
	.long	24991                   # 0x619f
	.long	14898                   # 0x3a32
	.long	22273                   # 0x5701
	.long	27290                   # 0x6a9a
	.long	64188                   # 0xfabc
	.long	58568                   # 0xe4c8
	.long	47481                   # 0xb979
	.long	41385                   # 0xa1a9
	.long	12838                   # 0x3226
	.long	7377                    # 0x1cd1
	.long	5177                    # 0x1439
	.long	6683                    # 0x1a1b
	.long	1253                    # 0x4e5
	.long	9527                    # 0x2537
	.long	25544                   # 0x63c8
	.long	897                     # 0x381
	.long	32789                   # 0x8015
	.long	54169                   # 0xd399
	.long	50736                   # 0xc630
	.long	51808                   # 0xca60
	.long	8180                    # 0x1ff4
	.long	3575                    # 0xdf7
	.long	40569                   # 0x9e79
	.long	25921                   # 0x6541
	.long	10276                   # 0x2824
	.long	65275                   # 0xfefb
	.long	64247                   # 0xfaf7
	.long	27018                   # 0x698a
	.long	15129                   # 0x3b19
	.long	6888                    # 0x1ae8
	.long	29174                   # 0x71f6
	.long	40120                   # 0x9cb8
	.long	21787                   # 0x551b
	.long	51447                   # 0xc8f7
	.long	1875                    # 0x753
	.long	20439                   # 0x4fd7
	.long	44479                   # 0xadbf
	.long	49356                   # 0xc0cc
	.long	61824                   # 0xf180
	.long	57318                   # 0xdfe6
	.long	56733                   # 0xdd9d
	.long	1465                    # 0x5b9
	.long	64001                   # 0xfa01
	.long	57987                   # 0xe283
	.long	10993                   # 0x2af1
	.long	24009                   # 0x5dc9
	.long	58884                   # 0xe604
	.long	43782                   # 0xab06
	.long	12642                   # 0x3162
	.long	44084                   # 0xac34
	.long	30054                   # 0x7566
	.long	20822                   # 0x5156
	.long	47659                   # 0xba2b
	.long	5087                    # 0x13df
	.long	46743                   # 0xb697
	.long	57936                   # 0xe250
	.long	4826                    # 0x12da
	.long	45455                   # 0xb18f
	.long	19418                   # 0x4bda
	.long	19956                   # 0x4df4
	.long	52343                   # 0xcc77
	.long	48592                   # 0xbdd0
	.long	60076                   # 0xeaac
	.long	8594                    # 0x2192
	.long	34503                   # 0x86c7
	.long	61951                   # 0xf1ff
	.long	29034                   # 0x716a
	.long	13447                   # 0x3487
	.long	45772                   # 0xb2cc
	.long	25322                   # 0x62ea
	.long	5229                    # 0x146d
	.long	36969                   # 0x9069
	.long	26788                   # 0x68a4
	.long	3694                    # 0xe6e
	.long	29420                   # 0x72ec
	.long	37781                   # 0x9395
	.long	27703                   # 0x6c37
	.long	22768                   # 0x58f0
	.long	16027                   # 0x3e9b
	.long	40346                   # 0x9d9a
	.long	1317                    # 0x525
	.long	46082                   # 0xb402
	.long	61168                   # 0xeef0
	.long	48976                   # 0xbf50
	.long	51169                   # 0xc7e1
	.long	42376                   # 0xa588
	.long	41376                   # 0xa1a0
	.long	55996                   # 0xdabc
	.long	22295                   # 0x5717
	.long	60795                   # 0xed7b
	.long	10416                   # 0x28b0
	.long	9102                    # 0x238e
	.long	43851                   # 0xab4b
	.long	4956                    # 0x135c
	.long	17697                   # 0x4521
	.long	12819                   # 0x3213
	.long	1372                    # 0x55c
	.long	46731                   # 0xb68b
	.long	26266                   # 0x669a
	.long	47144                   # 0xb828
	.long	6517                    # 0x1975
	.long	31495                   # 0x7b07
	.long	18577                   # 0x4891
	.long	33305                   # 0x8219
	.long	35189                   # 0x8975
	.long	47998                   # 0xbb7e
	.long	5550                    # 0x15ae
	.long	62892                   # 0xf5ac
	.long	5230                    # 0x146e
	.long	21578                   # 0x544a
	.long	37702                   # 0x9346
	.long	6547                    # 0x1993
	.long	2124                    # 0x84c
	.long	33335                   # 0x8237
	.long	55524                   # 0xd8e4
	.long	53293                   # 0xd02d
	.long	10175                   # 0x27bf
	.long	31364                   # 0x7a84
	.long	43753                   # 0xaae9
	.long	32470                   # 0x7ed6
	.long	26623                   # 0x67ff
	.long	54169                   # 0xd399
	.long	41572                   # 0xa264
	.long	4939                    # 0x134b
	.long	59126                   # 0xe6f6
	.long	59269                   # 0xe785
	.long	17758                   # 0x455e
	.long	60498                   # 0xec52
	.long	40464                   # 0x9e10
	.long	44024                   # 0xabf8
	.long	42106                   # 0xa47a
	.long	46982                   # 0xb786
	.long	9983                    # 0x26ff
	.long	60683                   # 0xed0b
	.long	14751                   # 0x399f
	.long	45172                   # 0xb074
	.long	43145                   # 0xa889
	.long	20302                   # 0x4f4e
	.long	42528                   # 0xa620
	.long	48376                   # 0xbcf8
	.long	41880                   # 0xa398
	.long	14695                   # 0x3967
	.long	54923                   # 0xd68b
	.long	44004                   # 0xabe4
	.long	48030                   # 0xbb9e
	.long	44911                   # 0xaf6f
	.long	31761                   # 0x7c11
	.long	58205                   # 0xe35d
	.long	10740                   # 0x29f4
	.long	9979                    # 0x26fb
	.long	25139                   # 0x6233
	.long	37363                   # 0x91f3
	.long	64148                   # 0xfa94
	.long	1175                    # 0x497
	.long	42302                   # 0xa53e
	.long	57738                   # 0xe18a
	.long	60445                   # 0xec1d
	.long	60060                   # 0xea9c
	.long	52700                   # 0xcddc
	.long	35373                   # 0x8a2d
	.long	38548                   # 0x9694
	.long	29270                   # 0x7256
	.long	16819                   # 0x41b3
	.long	48531                   # 0xbd93
	.long	24418                   # 0x5f62
	.long	31571                   # 0x7b53
	.long	28167                   # 0x6e07
	.long	2027                    # 0x7eb
	.long	51873                   # 0xcaa1
	.long	5160                    # 0x1428
	.long	50403                   # 0xc4e3
	.long	28217                   # 0x6e39
	.long	19855                   # 0x4d8f
	.long	39791                   # 0x9b6f
	.long	6685                    # 0x1a1d
	.long	2349                    # 0x92d
	.long	19166                   # 0x4ade
	.long	38446                   # 0x962e
	.long	60554                   # 0xec8a
	.long	29906                   # 0x74d2
	.long	48425                   # 0xbd29
	.long	20157                   # 0x4ebd
	.long	1734                    # 0x6c6
	.long	47038                   # 0xb7be
	.long	21332                   # 0x5354
	.long	44036                   # 0xac04
	.long	39240                   # 0x9948
	.long	16241                   # 0x3f71
	.long	38561                   # 0x96a1
	.long	26405                   # 0x6725
	.long	51615                   # 0xc99f
	.long	11573                   # 0x2d35
	.long	55675                   # 0xd97b
	.long	2898                    # 0xb52
	.long	60105                   # 0xeac9
	.long	14557                   # 0x38dd
	.long	34469                   # 0x86a5
	.long	22736                   # 0x58d0
	.long	16585                   # 0x40c9
	.long	20806                   # 0x5146
	.long	27896                   # 0x6cf8
	.long	1452                    # 0x5ac
	.long	49023                   # 0xbf7f
	.long	47751                   # 0xba87
	.long	41243                   # 0xa11b
	.long	55708                   # 0xd99c
	.long	50100                   # 0xc3b4
	.long	60410                   # 0xebfa
	.long	28619                   # 0x6fcb
	.long	45118                   # 0xb03e
	.long	24780                   # 0x60cc
	.long	11508                   # 0x2cf4
	.long	65275                   # 0xfefb
	.long	26514                   # 0x6792
	.long	58546                   # 0xe4b2
	.long	21072                   # 0x5250
	.long	5015                    # 0x1397
	.long	32251                   # 0x7dfb
	.long	37313                   # 0x91c1
	.long	43576                   # 0xaa38
	.long	58656                   # 0xe520
	.long	23392                   # 0x5b60
	.long	55149                   # 0xd76d
	.long	48795                   # 0xbe9b
	.long	26291                   # 0x66b3
	.long	49718                   # 0xc236
	.long	63353                   # 0xf779
	.long	60760                   # 0xed58
	.long	6919                    # 0x1b07
	.long	14402                   # 0x3842
	.long	16031                   # 0x3e9f
	.long	34815                   # 0x87ff
	.long	15854                   # 0x3dee
	.long	65054                   # 0xfe1e
	.long	17031                   # 0x4287
	.long	57098                   # 0xdf0a
	.long	55227                   # 0xd7bb
	.long	1595                    # 0x63b
	.long	51972                   # 0xcb04
	.long	18310                   # 0x4786
	.long	46714                   # 0xb67a
	.long	11216                   # 0x2bd0
	.long	29818                   # 0x747a
	.long	46453                   # 0xb575
	.long	37731                   # 0x9363
	.long	22829                   # 0x592d
	.long	1989                    # 0x7c5
	.long	42746                   # 0xa6fa
	.long	55080                   # 0xd728
	.long	39303                   # 0x9987
	.long	20786                   # 0x5132
	.long	48200                   # 0xbc48
	.long	62695                   # 0xf4e7
	.long	10399                   # 0x289f
	.long	31459                   # 0x7ae3
	.long	23450                   # 0x5b9a
	.long	60118                   # 0xead6
	.long	29276                   # 0x725c
	.long	18675                   # 0x48f3
	.long	1501                    # 0x5dd
	.long	43678                   # 0xaa9e
	.long	34706                   # 0x8792
	.long	36316                   # 0x8ddc
	.long	59533                   # 0xe88d
	.long	34224                   # 0x85b0
	.long	53347                   # 0xd063
	.long	51095                   # 0xc797
	.long	23915                   # 0x5d6b
	.long	54943                   # 0xd69f
	.long	37531                   # 0x929b
	.long	42225                   # 0xa4f1
	.long	36121                   # 0x8d19
	.long	48747                   # 0xbe6b
	.long	6508                    # 0x196c
	.long	17038                   # 0x428e
	.long	20942                   # 0x51ce
	.long	29337                   # 0x7299
	.long	19028                   # 0x4a54
	.long	63688                   # 0xf8c8
	.long	18881                   # 0x49c1
	.long	58331                   # 0xe3db
	.long	18938                   # 0x49fa
	.long	1545                    # 0x609
	.long	55490                   # 0xd8c2
	.long	29338                   # 0x729a
	.long	33004                   # 0x80ec
	.long	13405                   # 0x345d
	.long	23920                   # 0x5d70
	.long	62281                   # 0xf349
	.long	32080                   # 0x7d50
	.long	25421                   # 0x634d
	.long	40423                   # 0x9de7
	.long	1250                    # 0x4e2
	.long	61737                   # 0xf129
	.long	34420                   # 0x8674
	.long	35474                   # 0x8a92
	.long	49549                   # 0xc18d
	.long	19979                   # 0x4e0b
	.long	59390                   # 0xe7fe
	.long	38956                   # 0x982c
	.long	57510                   # 0xe0a6
	.long	36079                   # 0x8cef
	.long	9541                    # 0x2545
	.long	40722                   # 0x9f12
	.long	42587                   # 0xa65b
	.long	26579                   # 0x67d3
	.long	61664                   # 0xf0e0
	.long	6388                    # 0x18f4
	.long	45607                   # 0xb227
	.long	59817                   # 0xe9a9
	.long	25269                   # 0x62b5
	.long	38402                   # 0x9602
	.long	13219                   # 0x33a3
	.long	26814                   # 0x68be
	.long	28357                   # 0x6ec5
	.long	42557                   # 0xa63d
	.long	59819                   # 0xe9ab
	.long	41762                   # 0xa322
	.long	941                     # 0x3ad
	.long	56564                   # 0xdcf4
	.long	8306                    # 0x2072
	.long	26362                   # 0x66fa
	.long	31451                   # 0x7adb
	.long	9556                    # 0x2554
	.long	22564                   # 0x5824
	.long	336                     # 0x150
	.long	45030                   # 0xafe6
	.long	6577                    # 0x19b1
	.long	20315                   # 0x4f5b
	.long	38884                   # 0x97e4
	.long	45533                   # 0xb1dd
	.long	12290                   # 0x3002
	.long	9428                    # 0x24d4
	.long	55074                   # 0xd722
	.long	53012                   # 0xcf14
	.long	52015                   # 0xcb2f
	.long	16117                   # 0x3ef5
	.long	49140                   # 0xbff4
	.long	58404                   # 0xe424
	.long	61725                   # 0xf11d
	.long	43421                   # 0xa99d
	.long	18137                   # 0x46d9
	.long	34591                   # 0x871f
	.long	56641                   # 0xdd41
	.long	44952                   # 0xaf98
	.long	62948                   # 0xf5e4
	.long	33662                   # 0x837e
	.long	39235                   # 0x9943
	.long	39174                   # 0x9906
	.long	34604                   # 0x872c
	.long	30263                   # 0x7637
	.long	47480                   # 0xb978
	.long	60966                   # 0xee26
	.long	61714                   # 0xf112
	.long	57036                   # 0xdecc
	.long	17994                   # 0x464a
	.long	62050                   # 0xf262
	.long	36531                   # 0x8eb3
	.long	24571                   # 0x5ffb
	.long	16830                   # 0x41be
	.long	9879                    # 0x2697
	.long	4568                    # 0x11d8
	.long	29120                   # 0x71c0
	.long	19307                   # 0x4b6b
	.long	59642                   # 0xe8fa
	.long	16596                   # 0x40d4
	.long	5787                    # 0x169b
	.long	10224                   # 0x27f0
	.long	200                     # 0xc8
	.long	64191                   # 0xfabf
	.long	6413                    # 0x190d
	.long	43622                   # 0xaa66
	.long	16792                   # 0x4198
	.long	41004                   # 0xa02c
	.long	34727                   # 0x87a7
	.long	61744                   # 0xf130
	.long	38417                   # 0x9611
	.long	2853                    # 0xb25
	.long	35443                   # 0x8a73
	.long	12055                   # 0x2f17
	.long	37457                   # 0x9251
	.long	170                     # 0xaa
	.long	59536                   # 0xe890
	.long	32888                   # 0x8078
	.long	61885                   # 0xf1bd
	.long	51036                   # 0xc75c
	.long	50882                   # 0xc6c2
	.long	58399                   # 0xe41f
	.long	22031                   # 0x560f
	.long	9918                    # 0x26be
	.long	9693                    # 0x25dd
	.long	31911                   # 0x7ca7
	.long	14486                   # 0x3896
	.long	38813                   # 0x979d
	.long	51218                   # 0xc812
	.long	8593                    # 0x2191
	.long	55409                   # 0xd871
	.long	57005                   # 0xdead
	.long	18817                   # 0x4981
	.long	55610                   # 0xd93a
	.long	55660                   # 0xd96c
	.long	25230                   # 0x628e
	.long	33696                   # 0x83a0
	.long	6917                    # 0x1b05
	.long	698                     # 0x2ba
	.long	2887                    # 0xb47
	.long	3125                    # 0xc35
	.long	39115                   # 0x98cb
	.long	5740                    # 0x166c
	.long	38569                   # 0x96a9
	.long	51171                   # 0xc7e3
	.long	43198                   # 0xa8be
	.long	38739                   # 0x9753
	.long	45171                   # 0xb073
	.long	10550                   # 0x2936
	.long	35088                   # 0x8910
	.long	30671                   # 0x77cf
	.long	61432                   # 0xeff8
	.long	27952                   # 0x6d30
	.long	52703                   # 0xcddf
	.long	5814                    # 0x16b6
	.long	37645                   # 0x930d
	.long	19078                   # 0x4a86
	.long	20301                   # 0x4f4d
	.long	10923                   # 0x2aab
	.long	4760                    # 0x1298
	.long	28894                   # 0x70de
	.long	796                     # 0x31c
	.long	61766                   # 0xf146
	.long	47711                   # 0xba5f
	.long	56406                   # 0xdc56
	.long	51890                   # 0xcab2
	.long	7405                    # 0x1ced
	.long	24566                   # 0x5ff6
	.long	58807                   # 0xe5b7
	.long	8103                    # 0x1fa7
	.long	27453                   # 0x6b3d
	.long	61933                   # 0xf1ed
	.long	47219                   # 0xb873
	.long	33194                   # 0x81aa
	.long	34966                   # 0x8896
	.long	32854                   # 0x8056
	.long	10856                   # 0x2a68
	.long	8169                    # 0x1fe9
	.long	12489                   # 0x30c9
	.long	21406                   # 0x539e
	.long	43258                   # 0xa8fa
	.long	43160                   # 0xa898
	.long	17302                   # 0x4396
	.long	5674                    # 0x162a
	.long	30327                   # 0x7677
	.long	23117                   # 0x5a4d
	.long	43319                   # 0xa937
	.long	49405                   # 0xc0fd
	.long	43418                   # 0xa99a
	.long	54242                   # 0xd3e2
	.long	54166                   # 0xd396
	.long	6776                    # 0x1a78
	.long	55039                   # 0xd6ff
	.long	50396                   # 0xc4dc
	.long	54487                   # 0xd4d7
	.long	45909                   # 0xb355
	.long	36750                   # 0x8f8e
	.long	61892                   # 0xf1c4
	.long	4940                    # 0x134c
	.long	30022                   # 0x7546
	.long	4459                    # 0x116b
	.long	32393                   # 0x7e89
	.long	26419                   # 0x6733
	.long	51678                   # 0xc9de
	.long	51                      # 0x33
	.long	61385                   # 0xefc9
	.long	18996                   # 0x4a34
	.long	10907                   # 0x2a9b
	.long	4018                    # 0xfb2
	.long	31485                   # 0x7afd
	.long	32313                   # 0x7e39
	.long	47276                   # 0xb8ac
	.long	9110                    # 0x2396
	.long	49616                   # 0xc1d0
	.long	52950                   # 0xced6
	.long	39437                   # 0x9a0d
	.long	7197                    # 0x1c1d
	.long	30734                   # 0x780e
	.long	23307                   # 0x5b0b
	.long	50615                   # 0xc5b7
	.long	19440                   # 0x4bf0
	.long	11937                   # 0x2ea1
	.long	57391                   # 0xe02f
	.long	8943                    # 0x22ef
	.long	62333                   # 0xf37d
	.long	46342                   # 0xb506
	.long	54853                   # 0xd645
	.long	33547                   # 0x830b
	.long	42698                   # 0xa6ca
	.long	59793                   # 0xe991
	.long	63569                   # 0xf851
	.long	47157                   # 0xb835
	.long	26650                   # 0x681a
	.long	24452                   # 0x5f84
	.long	33300                   # 0x8214
	.long	26702                   # 0x684e
	.long	20301                   # 0x4f4d
	.long	52296                   # 0xcc48
	.long	37609                   # 0x92e9
	.long	24320                   # 0x5f00
	.long	18246                   # 0x4746
	.long	4387                    # 0x1123
	.long	6060                    # 0x17ac
	.long	27356                   # 0x6adc
	.long	54003                   # 0xd2f3
	.long	59011                   # 0xe683
	.long	1257                    # 0x4e9
	.long	61200                   # 0xef10
	.long	24209                   # 0x5e91
	.long	24564                   # 0x5ff4
	.long	46279                   # 0xb4c7
	.long	43649                   # 0xaa81
	.long	36501                   # 0x8e95
	.long	38134                   # 0x94f6
	.long	52593                   # 0xcd71
	.long	33298                   # 0x8212
	.long	18940                   # 0x49fc
	.long	41910                   # 0xa3b6
	.long	1310                    # 0x51e
	.long	61638                   # 0xf0c6
	.long	36167                   # 0x8d47
	.long	64879                   # 0xfd6f
	.long	43259                   # 0xa8fb
	.long	62817                   # 0xf561
	.long	23796                   # 0x5cf4
	.long	11023                   # 0x2b0f
	.long	23983                   # 0x5daf
	.long	44097                   # 0xac41
	.long	63320                   # 0xf758
	.long	61593                   # 0xf099
	.long	2881                    # 0xb41
	.long	16030                   # 0x3e9e
	.long	444                     # 0x1bc
	.long	8942                    # 0x22ee
	.long	43386                   # 0xa97a
	.long	54447                   # 0xd4af
	.long	2417                    # 0x971
	.long	44643                   # 0xae63
	.long	50111                   # 0xc3bf
	.long	26626                   # 0x6802
	.long	3672                    # 0xe58
	.long	30854                   # 0x7886
	.long	4739                    # 0x1283
	.long	40173                   # 0x9ced
	.long	3452                    # 0xd7c
	.long	57332                   # 0xdff4
	.long	7936                    # 0x1f00
	.long	22392                   # 0x5778
	.long	33706                   # 0x83aa
	.long	9246                    # 0x241e
	.long	18494                   # 0x483e
	.long	4337                    # 0x10f1
	.long	8589                    # 0x218d
	.long	61753                   # 0xf139
	.long	1619                    # 0x653
	.long	32385                   # 0x7e81
	.long	7241                    # 0x1c49
	.long	25602                   # 0x6402
	.long	10947                   # 0x2ac3
	.long	5025                    # 0x13a1
	.long	21659                   # 0x549b
	.long	13828                   # 0x3604
	.long	21055                   # 0x523f
	.long	22103                   # 0x5657
	.long	22770                   # 0x58f2
	.long	64441                   # 0xfbb9
	.long	11014                   # 0x2b06
	.long	25187                   # 0x6263
	.long	43548                   # 0xaa1c
	.long	61125                   # 0xeec5
	.long	51813                   # 0xca65
	.long	47220                   # 0xb874
	.long	26443                   # 0x674b
	.long	56553                   # 0xdce9
	.long	21858                   # 0x5562
	.long	29895                   # 0x74c7
	.long	48349                   # 0xbcdd
	.long	29794                   # 0x7462
	.long	52287                   # 0xcc3f
	.long	16520                   # 0x4088
	.long	39040                   # 0x9880
	.long	5245                    # 0x147d
	.long	20857                   # 0x5179
	.long	47629                   # 0xba0d
	.long	1463                    # 0x5b7
	.long	22476                   # 0x57cc
	.long	14479                   # 0x388f
	.long	8704                    # 0x2200
	.long	48079                   # 0xbbcf
	.long	25426                   # 0x6352
	.long	13729                   # 0x35a1
	.long	4202                    # 0x106a
	.long	39254                   # 0x9956
	.long	34784                   # 0x87e0
	.long	26306                   # 0x66c2
	.long	62025                   # 0xf249
	.long	33689                   # 0x8399
	.long	37320                   # 0x91c8
	.long	21676                   # 0x54ac
	.long	11701                   # 0x2db5
	.long	32910                   # 0x808e
	.long	7954                    # 0x1f12
	.long	58922                   # 0xe62a
	.long	59353                   # 0xe7d9
	.long	64507                   # 0xfbfb
	.long	15244                   # 0x3b8c
	.long	23713                   # 0x5ca1
	.long	47320                   # 0xb8d8
	.long	45038                   # 0xafee
	.long	10464                   # 0x28e0
	.long	63840                   # 0xf960
	.long	18542                   # 0x486e
	.long	15710                   # 0x3d5e
	.long	19162                   # 0x4ada
	.long	635                     # 0x27b
	.long	17173                   # 0x4315
	.long	41638                   # 0xa2a6
	.long	15114                   # 0x3b0a
	.long	25877                   # 0x6515
	.long	24181                   # 0x5e75
	.long	40540                   # 0x9e5c
	.long	39606                   # 0x9ab6
	.long	28384                   # 0x6ee0
	.long	14259                   # 0x37b3
	.long	8854                    # 0x2296
	.long	54690                   # 0xd5a2
	.long	10748                   # 0x29fc
	.long	42543                   # 0xa62f
	.long	26474                   # 0x676a
	.long	32424                   # 0x7ea8
	.long	54244                   # 0xd3e4
	.long	59384                   # 0xe7f8
	.long	40378                   # 0x9dba
	.long	47630                   # 0xba0e
	.long	53202                   # 0xcfd2
	.long	39349                   # 0x99b5
	.long	62874                   # 0xf59a
	.long	11379                   # 0x2c73
	.long	21134                   # 0x528e
	.long	42376                   # 0xa588
	.long	21843                   # 0x5553
	.long	19438                   # 0x4bee
	.long	60918                   # 0xedf6
	.long	37553                   # 0x92b1
	.long	38600                   # 0x96c8
	.long	61554                   # 0xf072
	.long	54726                   # 0xd5c6
	.long	14703                   # 0x396f
	.long	11132                   # 0x2b7c
	.long	15067                   # 0x3adb
	.long	38884                   # 0x97e4
	.long	51673                   # 0xc9d9
	.long	54673                   # 0xd591
	.long	1732                    # 0x6c4
	.long	396                     # 0x18c
	.long	63527                   # 0xf827
	.long	56422                   # 0xdc66
	.long	11144                   # 0x2b88
	.long	40534                   # 0x9e56
	.long	17361                   # 0x43d1
	.long	43568                   # 0xaa30
	.long	29243                   # 0x723b
	.long	11209                   # 0x2bc9
	.long	18411                   # 0x47eb
	.long	11337                   # 0x2c49
	.long	64411                   # 0xfb9b
	.long	57760                   # 0xe1a0
	.long	8676                    # 0x21e4
	.long	10254                   # 0x280e
	.long	13358                   # 0x342e
	.long	51052                   # 0xc76c
	.long	32098                   # 0x7d62
	.long	32797                   # 0x801d
	.long	46435                   # 0xb563
	.long	4115                    # 0x1013
	.long	5861                    # 0x16e5
	.long	42453                   # 0xa5d5
	.long	58842                   # 0xe5da
	.long	20564                   # 0x5054
	.long	53585                   # 0xd151
	.long	8373                    # 0x20b5
	.long	59449                   # 0xe839
	.long	39722                   # 0x9b2a
	.long	63047                   # 0xf647
	.long	61181                   # 0xeefd
	.long	40118                   # 0x9cb6
	.long	61038                   # 0xee6e
	.long	52068                   # 0xcb64
	.long	51262                   # 0xc83e
	.long	36037                   # 0x8cc5
	.long	3893                    # 0xf35
	.long	29295                   # 0x726f
	.long	65280                   # 0xff00
	.long	15102                   # 0x3afe
	.long	47706                   # 0xba5a
	.long	11081                   # 0x2b49
	.long	13978                   # 0x369a
	.long	39930                   # 0x9bfa
	.long	19757                   # 0x4d2d
	.long	24232                   # 0x5ea8
	.long	53289                   # 0xd029
	.long	5274                    # 0x149a
	.long	56330                   # 0xdc0a
	.long	20550                   # 0x5046
	.long	51709                   # 0xc9fd
	.long	60446                   # 0xec1e
	.long	26411                   # 0x672b
	.long	28626                   # 0x6fd2
	.long	53752                   # 0xd1f8
	.long	46976                   # 0xb780
	.long	16675                   # 0x4123
	.long	62125                   # 0xf2ad
	.long	40889                   # 0x9fb9
	.long	56398                   # 0xdc4e
	.long	59636                   # 0xe8f4
	.long	36534                   # 0x8eb6
	.long	30980                   # 0x7904
	.long	55139                   # 0xd763
	.long	23066                   # 0x5a1a
	.long	16707                   # 0x4143
	.long	25640                   # 0x6428
	.long	26959                   # 0x694f
	.long	46002                   # 0xb3b2
	.long	25384                   # 0x6328
	.long	42062                   # 0xa44e
	.long	28172                   # 0x6e0c
	.long	36465                   # 0x8e71
	.long	56040                   # 0xdae8
	.long	2566                    # 0xa06
	.long	56223                   # 0xdb9f
	.long	14736                   # 0x3990
	.long	55855                   # 0xda2f
	.long	61497                   # 0xf039
	.long	5531                    # 0x159b
	.long	10869                   # 0x2a75
	.long	47670                   # 0xba36
	.long	441                     # 0x1b9
	.long	37281                   # 0x91a1
	.long	10760                   # 0x2a08
	.long	54193                   # 0xd3b1
	.long	18721                   # 0x4921
	.long	27435                   # 0x6b2b
	.long	50782                   # 0xc65e
	.long	59610                   # 0xe8da
	.long	18297                   # 0x4779
	.long	44883                   # 0xaf53
	.long	30608                   # 0x7790
	.long	49278                   # 0xc07e
	.long	34486                   # 0x86b6
	.long	53675                   # 0xd1ab
	.long	449                     # 0x1c1
	.long	60126                   # 0xeade
	.long	15098                   # 0x3afa
	.long	46451                   # 0xb573
	.long	19974                   # 0x4e06
	.long	57160                   # 0xdf48
	.long	9087                    # 0x237f
	.long	56439                   # 0xdc77
	.long	47664                   # 0xba30
	.long	11653                   # 0x2d85
	.long	47126                   # 0xb816
	.long	62401                   # 0xf3c1
	.long	1973                    # 0x7b5
	.long	43087                   # 0xa84f
	.long	2396                    # 0x95c
	.long	12842                   # 0x322a
	.size	numbers, 16384

	.type	.L.str.2,@object        # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"check() fails"
	.size	.L.str.2, 14

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"check() succeeds"
	.size	.L.str.3, 17

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"%d: fail!!"
	.size	.L.str.4, 11

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"binsearch() tests succeeds"
	.size	.L.str.5, 27


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/proofGen.git 6ded7e6fd5083f9b71c0ce167864d38e8c3d3ba4)"
	.section	".note.GNU-stack","",@progbits
