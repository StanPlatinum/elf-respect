	.text
	.file	"bm_malloc_simple.c"
	.globl	enclave_main
	.p2align	5, 0x90
	.type	enclave_main,@function
enclave_main:                           # @enclave_main
# BB#0:                                 # %entry
	pushq	%rbp
	movq	%rsp, %rbp
	subl	%r15d, %esp
	subl	$32, %esp
	leaq	(%rsp,%r15), %rsp
	movl	$32768, %eax            # imm = 0x8000
	movl	%eax, %edi
	callq	malloc@PLT
	jmp	enclave_main.0
	.p2align	5, 0x90
enclave_main.0:
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.LBB0_2
# BB#1:                                 # %if.then
	leaq	.L.str(%rip), %rsi
	movl	$137, %edx
	jmp	enclave_main.1
	.p2align	5, 0x90
enclave_main.1:
	leaq	.L.str.1(%rip), %rcx
	movabsq	$81985529206280466, %r8 # imm = 0x123456789101112
	movq	-8(%rbp), %rdi
	movb	$0, %al
	jmp	enclave_main.2
	.p2align	5, 0x90
enclave_main.2:
	callq	sprintf@PLT
	movq	-8(%rbp), %rdi
	movl	%eax, -12(%rbp)         # 4-byte Spill
	callq	puts@PLT
	movq	-8(%rbp), %rdi
	movl	%eax, -16(%rbp)         # 4-byte Spill
	jmp	enclave_main.3
	.p2align	5, 0x90
enclave_main.3:
	callq	free@PLT
	jmp	.LBB0_3
.LBB0_2:                                # %if.else
	leaq	.L.str.2(%rip), %rdi
	callq	puts@PLT
	movl	%eax, -20(%rbp)         # 4-byte Spill
.LBB0_3:                                # %if.end
	xorl	%edi, %edi
	jmp	enclave_main.4
	.p2align	5, 0x90
enclave_main.4:
	callq	exit@PLT
.Lfunc_end0:
	.size	enclave_main, .Lfunc_end0-enclave_main

	.type	.L.str,@object          # @.str
	.section	.rodata,"a",@progbits
.L.str:
	.asciz	"The number is %d, the string is %s, another number is 0x%llx\n\000"
	.size	.L.str, 63

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"\"A long long long string\"\000"
	.size	.L.str.1, 27

	.type	.L.str.2,@object        # @.str.2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.2:
	.asciz	"buf is NULL"
	.size	.L.str.2, 12


	.ident	"clang version 4.0.0 "
	.section	".note.GNU-stack","",@progbits
