	.text
	.file	"fasta.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function gen_random
.LCPI0_0:
	.quad	4684049276697837568     # double 139968
	.text
	.globl	gen_random
	.p2align	4, 0x90
	.type	gen_random,@function
gen_random:                             # @gen_random
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movsd	.LCPI0_0(%rip), %xmm1   # xmm1 = mem[0],zero
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0         # xmm0 = mem[0],zero
	imulq	$3877, gen_random.last(%rip), %rax # imm = 0xF25
	addq	$29573, %rax            # imm = 0x7385
	cqto
	movl	$139968, %ecx           # imm = 0x222C0
	idivq	%rcx
	movq	%rdx, gen_random.last(%rip)
	cvtsi2sd	%rdx, %xmm2
	mulsd	%xmm2, %xmm0
	divsd	%xmm1, %xmm0
	popq	%rbp
	retq
.Lfunc_end0:
	.size	gen_random, .Lfunc_end0-gen_random
                                        # -- End function
	.globl	makeCumulative          # -- Begin function makeCumulative
	.p2align	4, 0x90
	.type	makeCumulative,@function
makeCumulative:                         # @makeCumulative
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	$0, -28(%rbp)
.LBB1_1:                                # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-28(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.LBB1_4
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movsd	8(%rax), %xmm0          # xmm0 = mem[0],zero
	addsd	-24(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-24(%rbp), %xmm0        # xmm0 = mem[0],zero
	movq	-8(%rbp), %rax
	movslq	-28(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movsd	%xmm0, 8(%rax)
# %bb.3:                                # %for.inc
                                        #   in Loop: Header=BB1_1 Depth=1
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -28(%rbp)
	jmp	.LBB1_1
.LBB1_4:                                # %for.end
	popq	%rbp
	retq
.Lfunc_end1:
	.size	makeCumulative, .Lfunc_end1-makeCumulative
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function selectRandom
.LCPI2_0:
	.quad	4607182418800017408     # double 1
	.text
	.globl	selectRandom
	.p2align	4, 0x90
	.type	selectRandom,@function
selectRandom:                           # @selectRandom
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
	movsd	.LCPI2_0(%rip), %xmm0   # xmm0 = mem[0],zero
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	callq	gen_random@PLT
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0        # xmm0 = mem[0],zero
	movq	-16(%rbp), %rax
	movsd	8(%rax), %xmm1          # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jbe	.LBB2_2
# %bb.1:                                # %if.then
	movq	-16(%rbp), %rax
	movb	(%rax), %cl
	movb	%cl, -1(%rbp)
	jmp	.LBB2_9
.LBB2_2:                                # %if.end
	movl	$0, -40(%rbp)
	movl	-20(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -44(%rbp)
.LBB2_3:                                # %while.cond
                                        # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	movl	-40(%rbp), %ecx
	addl	$1, %ecx
	cmpl	%ecx, %eax
	jle	.LBB2_8
# %bb.4:                                # %while.body
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	-44(%rbp), %eax
	addl	-40(%rbp), %eax
	cltd
	movl	$2, %ecx
	idivl	%ecx
	movl	%eax, -36(%rbp)
	movsd	-32(%rbp), %xmm0        # xmm0 = mem[0],zero
	movq	-16(%rbp), %rsi
	movslq	-36(%rbp), %rdi
	shlq	$4, %rdi
	addq	%rdi, %rsi
	movsd	8(%rsi), %xmm1          # xmm1 = mem[0],zero
	ucomisd	%xmm0, %xmm1
	jbe	.LBB2_6
# %bb.5:                                # %if.then7
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	-36(%rbp), %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB2_7
.LBB2_6:                                # %if.else
                                        #   in Loop: Header=BB2_3 Depth=1
	movl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)
.LBB2_7:                                # %if.end8
                                        #   in Loop: Header=BB2_3 Depth=1
	jmp	.LBB2_3
.LBB2_8:                                # %while.end
	movq	-16(%rbp), %rax
	movslq	-44(%rbp), %rcx
	shlq	$4, %rcx
	addq	%rcx, %rax
	movb	(%rax), %dl
	movb	%dl, -1(%rbp)
.LBB2_9:                                # %return
	movsbl	-1(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end2:
	.size	selectRandom, .Lfunc_end2-selectRandom
                                        # -- End function
	.globl	makeRandomFasta         # -- Begin function makeRandomFasta
	.p2align	4, 0x90
	.type	makeRandomFasta,@function
makeRandomFasta:                        # @makeRandomFasta
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$112, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	%r8d, -32(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
.LBB3_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_6 Depth 2
	cmpl	$0, -36(%rbp)
	jle	.LBB3_11
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB3_1 Depth=1
	cmpl	$60, -36(%rbp)
	jge	.LBB3_4
# %bb.3:                                # %if.then
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-36(%rbp), %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB3_5
.LBB3_4:                                # %if.else
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$60, -44(%rbp)
.LBB3_5:                                # %if.end
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	$0, -40(%rbp)
.LBB3_6:                                # %for.cond2
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-40(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jge	.LBB3_9
# %bb.7:                                # %for.body4
                                        #   in Loop: Header=BB3_6 Depth=2
	movq	-24(%rbp), %rdi
	movl	-28(%rbp), %esi
	callq	selectRandom@PLT
	movslq	-40(%rbp), %rcx
	movb	%al, -112(%rbp,%rcx)
# %bb.8:                                # %for.inc
                                        #   in Loop: Header=BB3_6 Depth=2
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB3_6
.LBB3_9:                                # %for.end
                                        #   in Loop: Header=BB3_1 Depth=1
	leaq	-112(%rbp), %rdi
	movslq	-44(%rbp), %rax
	movb	$0, -112(%rbp,%rax)
	callq	puts@PLT
# %bb.10:                               # %for.inc8
                                        #   in Loop: Header=BB3_1 Depth=1
	movl	-36(%rbp), %eax
	subl	$60, %eax
	movl	%eax, -36(%rbp)
	jmp	.LBB3_1
.LBB3_11:                               # %for.end9
	addq	$112, %rsp
	popq	%rbp
	retq
.Lfunc_end3:
	.size	makeRandomFasta, .Lfunc_end3-makeRandomFasta
                                        # -- End function
	.globl	makeRepeatFasta         # -- Begin function makeRepeatFasta
	.p2align	4, 0x90
	.type	makeRepeatFasta,@function
makeRepeatFasta:                        # @makeRepeatFasta
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -44(%rbp)
	movl	$0, -48(%rbp)
	movq	-24(%rbp), %rdi
	callq	strlen@PLT
                                        # kill: def $eax killed $eax killed $rax
	movl	%eax, -52(%rbp)
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movslq	%eax, %rdi
	callq	malloc@PLT
	movq	%rax, -40(%rbp)
	movq	-40(%rbp), %rdi
	movq	-24(%rbp), %rsi
	movl	-52(%rbp), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rdx
	callq	memcpy@PLT
.LBB4_1:                                # %for.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB4_6 Depth 2
	cmpl	$0, -44(%rbp)
	jle	.LBB4_10
# %bb.2:                                # %for.body
                                        #   in Loop: Header=BB4_1 Depth=1
	cmpl	$60, -44(%rbp)
	jge	.LBB4_4
# %bb.3:                                # %if.then
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-44(%rbp), %eax
	movl	%eax, -56(%rbp)
	jmp	.LBB4_5
.LBB4_4:                                # %if.else
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	$60, -56(%rbp)
.LBB4_5:                                # %if.end
                                        #   in Loop: Header=BB4_1 Depth=1
	jmp	.LBB4_6
.LBB4_6:                                # %while.cond
                                        #   Parent Loop BB4_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	-56(%rbp), %eax
	movl	-52(%rbp), %ecx
	subl	-48(%rbp), %ecx
	cmpl	%ecx, %eax
	jl	.LBB4_8
# %bb.7:                                # %while.body
                                        #   in Loop: Header=BB4_6 Depth=2
	movl	-52(%rbp), %eax
	subl	-48(%rbp), %eax
	movl	-56(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -56(%rbp)
	movl	$0, -48(%rbp)
	jmp	.LBB4_6
.LBB4_8:                                # %while.end
                                        #   in Loop: Header=BB4_1 Depth=1
	movq	-40(%rbp), %rax
	movl	-48(%rbp), %ecx
	addl	-56(%rbp), %ecx
	movslq	%ecx, %rdx
	movb	$0, (%rax,%rdx)
	movq	-40(%rbp), %rax
	movslq	-48(%rbp), %rdx
	addq	%rdx, %rax
	movq	%rax, %rdi
	callq	puts@PLT
	movq	-24(%rbp), %rdx
	movl	-56(%rbp), %ecx
	addl	-48(%rbp), %ecx
	movslq	%ecx, %rsi
	movb	(%rdx,%rsi), %r8b
	movq	-40(%rbp), %rdx
	movl	-48(%rbp), %ecx
	addl	-56(%rbp), %ecx
	movslq	%ecx, %rsi
	movb	%r8b, (%rdx,%rsi)
	movl	-56(%rbp), %ecx
	addl	-48(%rbp), %ecx
	movl	%ecx, -48(%rbp)
# %bb.9:                                # %for.inc
                                        #   in Loop: Header=BB4_1 Depth=1
	movl	-44(%rbp), %eax
	subl	$60, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB4_1
.LBB4_10:                               # %for.end
	movq	-40(%rbp), %rdi
	callq	free@PLT
	addq	$64, %rsp
	popq	%rbp
	retq
.Lfunc_end4:
	.size	makeRepeatFasta, .Lfunc_end4-makeRepeatFasta
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	iub@GOTPCREL(%rip), %rdi
	movl	$200000, -4(%rbp)       # imm = 0x30D40
	movl	$15, %esi
	callq	makeCumulative@PLT
	movq	homosapiens@GOTPCREL(%rip), %rdi
	movl	$4, %esi
	callq	makeCumulative@PLT
	movq	alu@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %ecx
	shll	$1, %ecx
	leaq	.L.str.1(%rip), %rdi
	leaq	.L.str.2(%rip), %rsi
	callq	makeRepeatFasta@PLT
	movq	iub@GOTPCREL(%rip), %rdx
	imull	$3, -4(%rbp), %r8d
	leaq	.L.str.3(%rip), %rdi
	leaq	.L.str.4(%rip), %rsi
	movl	$15, %ecx
	callq	makeRandomFasta@PLT
	movq	homosapiens@GOTPCREL(%rip), %rdx
	imull	$5, -4(%rbp), %r8d
	leaq	.L.str.5(%rip), %rdi
	leaq	.L.str.6(%rip), %rsi
	movl	$4, %ecx
	callq	makeRandomFasta@PLT
	xorl	%edi, %edi
	callq	exit@PLT
.Lfunc_end5:
	.size	enclave_main, .Lfunc_end5-enclave_main
                                        # -- End function
	.type	gen_random.last,@object # @gen_random.last
	.data
	.p2align	3
gen_random.last:
	.quad	42                      # 0x2a
	.size	gen_random.last, 8

	.type	iub,@object             # @iub
	.globl	iub
	.p2align	4
iub:
	.byte	97                      # 0x61
	.zero	7
	.quad	4598535507515466056     # double 0.27000000000000002
	.byte	99                      # 0x63
	.zero	7
	.quad	4593311331947716280     # double 0.12
	.byte	103                     # 0x67
	.zero	7
	.quad	4593311331947716280     # double 0.12
	.byte	116                     # 0x74
	.zero	7
	.quad	4598535507515466056     # double 0.27000000000000002
	.byte	66                      # 0x42
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	68                      # 0x44
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	72                      # 0x48
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	75                      # 0x4b
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	77                      # 0x4d
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	78                      # 0x4e
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	82                      # 0x52
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	83                      # 0x53
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	86                      # 0x56
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	87                      # 0x57
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.byte	89                      # 0x59
	.zero	7
	.quad	4581421828931458171     # double 0.02
	.size	iub, 240

	.type	homosapiens,@object     # @homosapiens
	.globl	homosapiens
	.p2align	4
homosapiens:
	.byte	97                      # 0x61
	.zero	7
	.quad	4599129170985544539     # double 0.30295494266799999
	.byte	99                      # 0x63
	.zero	7
	.quad	4596301300581094939     # double 0.19798830049210001
	.byte	103                     # 0x67
	.zero	7
	.quad	4596285412103078591     # double 0.1975473066391
	.byte	116                     # 0x74
	.zero	7
	.quad	4599103131308197944     # double 0.3015094502008
	.size	homosapiens, 64

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAGGCGGGCGGATCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGGTGAAACCCCGTCTCTACTAAAAATACAAAAATTAGCCGGGCGTGGTGGCGCGCGCCTGTAATCCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAACCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCCAGCCTGGGCGACAGAGCGAGACTCCGTCTCAAAAA"
	.size	.L.str, 288

	.type	alu,@object             # @alu
	.data
	.globl	alu
	.p2align	3
alu:
	.quad	.L.str
	.size	alu, 8

	.type	.L.str.1,@object        # @.str.1
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.1:
	.asciz	"ONE"
	.size	.L.str.1, 4

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Homo sapiens alu"
	.size	.L.str.2, 17

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"TWO"
	.size	.L.str.3, 4

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"IUB ambiguity codes"
	.size	.L.str.4, 20

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"THREE"
	.size	.L.str.5, 6

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"Homo sapiens frequency"
	.size	.L.str.6, 23


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-mc.git 4849ae354b8e083c81068f07b1b37ee6da0c117b)"
	.section	".note.GNU-stack","",@progbits
