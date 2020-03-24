	.text
	.file	"bm_hello.c"
	.globl	useless                 # -- Begin function useless
	.p2align	4, 0x90
	.type	useless,@function
useless:                                # @useless
# %bb.0:                                # %entry
	xend
	movq	%r15, %rax
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB0_6
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB0_6
	popq	%rax
	subq	$16, %rsp
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB0_6
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB0_6
	popq	%rax
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	12(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_4
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_4
	popfq
	popq	%rax
	popq	%rbx
	movl	$0, 12(%rsp)
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	8(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_4
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_4
	popfq
	popq	%rax
	popq	%rbx
	movl	$1, 8(%rsp)
	movl	12(%rsp), %eax
	cmpl	8(%rsp), %eax
	movq	%rax, %r15
	callq	transactionBegin
	jge	.LBB0_2
	xend
	movq	%r15, %rax
	movq	%rax, %r15
	callq	transactionBegin
# %bb.1:                                # %if.then
	xend
	movq	%r15, %rax
	xorl	%eax, %eax
	movl	%eax, %edi
	movq	%rax, %r15
	callq	transactionBegin
	callq	CFICheck@PLT
	xend
	movq	%r15, %rax
	movq	%rax, %r15
	callq	transactionBegin
	jmp	.LBB0_3
	xend
	movq	%r15, %rax
	movq	%rax, %r15
	callq	transactionBegin
.LBB0_2:                                # %if.else
	xend
	movq	%r15, %rax
	xorl	%edi, %edi
	movq	%rax, %r15
	callq	transactionBegin
	callq	exit@PLT
	xend
	movq	%r15, %rax
	movq	%rax, %r15
	callq	transactionBegin
.LBB0_3:                                # %if.end
	xend
	movq	%r15, %rax
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rbp
	ja	.LBB0_6
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rbp
	jb	.LBB0_6
	popq	%rax
	movq	%rbp, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB0_5
	movq	%rax, %r15
	callq	transactionBegin
	retq
.LBB0_4:                                # Label of block must be emitted
	popfq
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB0_5:                                # Label of block must be emitted
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB0_6:                                # Label of block must be emitted
	popq	%rax
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end0:
	.size	useless, .Lfunc_end0-useless
                                        # -- End function
	.globl	enclave_main            # -- Begin function enclave_main
	.p2align	4, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# %bb.0:                                # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB1_2
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB1_2
	popq	%rax
	subq	$16, %rsp
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB1_2
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB1_2
	popq	%rax
	leaq	.L.str(%rip), %rdi
	movq	%rax, %r15
	callq	transactionBegin
	callq	wrapper_by_compiler_puts@PLT
	xend
	movq	%r15, %rax
	xorl	%edi, %edi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	12(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_1
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 12(%rsp)          # 4-byte Spill
	movq	%rax, %r15
	callq	transactionBegin
	callq	exit@PLT
	xend
	movq	%r15, %rax
	movq	%rax, %r15
	callq	transactionBegin
.LBB1_1:                                # Label of block must be emitted
	popfq
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB1_2:                                # Label of block must be emitted
	popq	%rax
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end1:
	.size	enclave_main, .Lfunc_end1-enclave_main
                                        # -- End function
	.globl	wrapper_by_compiler_puts # -- Begin function wrapper_by_compiler_puts
	.p2align	4, 0x90
	.type	wrapper_by_compiler_puts,@function
wrapper_by_compiler_puts:               # @wrapper_by_compiler_puts
# %bb.0:                                # %entry
	xend
	movq	%r15, %rax
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	addq	$8, (%r11)
	movq	(%r11), %r10
	addq	%r10, %r11
	movq	(%rsp), %r10
	movq	%r10, (%r11)
	pushq	%rbp
	movq	%rsp, %rbp
	andq	$-16, %rsp
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB2_3
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB2_3
	popq	%rax
	subq	$16, %rsp
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB2_3
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB2_3
	popq	%rax
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	8(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popfq
	popq	%rax
	popq	%rbx
	movq	%rdi, 8(%rsp)
	movq	8(%rsp), %rdi
	callq	puts@PLT
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rbp
	ja	.LBB2_3
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rbp
	jb	.LBB2_3
	popq	%rax
	movq	%rbp, %rsp
	popq	%rbp
	movabsq	$3458764513820540927, %r11 # imm = 0x2FFFFFFFFFFFFFFF
	movq	(%r11), %r10
	addq	%r11, %r10
	subq	$8, (%r11)
	movq	(%r10), %r11
	cmpq	%r11, (%rsp)
	jne	.LBB2_2
	movq	%rax, %r15
	callq	transactionBegin
	retq
.LBB2_1:                                # Label of block must be emitted
	popfq
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB2_2:                                # Label of block must be emitted
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB2_3:                                # Label of block must be emitted
	popq	%rax
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end2:
	.size	wrapper_by_compiler_puts, .Lfunc_end2-wrapper_by_compiler_puts
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"hello"
	.size	.L.str, 6


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/proofGen.git 079232e66565dfbd72ec0ce5ba70e730daec5d77)"
	.section	".note.GNU-stack","",@progbits
