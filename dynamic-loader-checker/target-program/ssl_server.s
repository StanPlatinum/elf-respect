	.text
	.file	"ssl_server.c"
	.globl	subtime                 # -- Begin function subtime
	.p2align	4, 0x90
	.type	subtime,@function
subtime:                                # @subtime
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
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB0_6
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB0_6
	popq	%rax
	subq	$32, %rsp
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
	leaq	16(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_4
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_4
	popfq
	popq	%rax
	popq	%rbx
	movq	%rdi, 16(%rsp)
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
	movq	%rsi, 8(%rsp)
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_4
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_4
	popfq
	popq	%rax
	popq	%rbx
	movq	$0, (%rsp)
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movq	8(%rsp), %rcx
	cmpq	(%rcx), %rax
	jne	.LBB0_2
# %bb.1:                                # %if.then
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	16(%rsp), %rcx
	subq	8(%rcx), %rax
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	24(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_4
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_4
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 24(%rsp)
	jmp	.LBB0_3
.LBB0_2:                                # %if.end
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movq	16(%rsp), %rcx
	subq	(%rcx), %rax
	imulq	$1000000, %rax, %rax    # imm = 0xF4240
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_4
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_4
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, (%rsp)
	movq	(%rsp), %rax
	movq	8(%rsp), %rcx
	addq	8(%rcx), %rax
	movq	16(%rsp), %rcx
	subq	8(%rcx), %rax
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	24(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB0_4
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB0_4
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 24(%rsp)
.LBB0_3:                                # %return
	movq	24(%rsp), %rax
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
	.size	subtime, .Lfunc_end0-subtime
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
	ja	.LBB1_69
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB1_69
	popq	%rax
	subq	$20544, %rsp            # imm = 0x5040
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB1_69
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB1_69
	popq	%rax
	xorl	%esi, %esi
	leaq	3872(%rsp), %rax
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	callq	memset@PLT
	leaq	.L.str(%rip), %rax
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	3864(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 3864(%rsp)
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	3860(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	$0, 3860(%rsp)
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	3848(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	$0, 3848(%rsp)
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	3840(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	$0, 3840(%rsp)
	leaq	20528(%rsp), %rdi
	callq	mbedtls_net_init@PLT
	leaq	20520(%rsp), %rdi
	callq	mbedtls_net_init@PLT
	leaq	1968(%rsp), %rdi
	callq	mbedtls_ssl_init@PLT
	leaq	1592(%rsp), %rdi
	callq	mbedtls_ssl_config_init@PLT
	leaq	1008(%rsp), %rdi
	callq	mbedtls_ssl_cache_init@PLT
	leaq	1040(%rsp), %rdi
	callq	mbedtls_x509_crt_init@PLT
	leaq	1024(%rsp), %rdi
	callq	mbedtls_pk_init@PLT
	leaq	2752(%rsp), %rdi
	callq	mbedtls_entropy_init@PLT
	leaq	2408(%rsp), %rdi
	callq	mbedtls_ctr_drbg_init@PLT
	xorl	%edi, %edi
	callq	mbedtls_debug_set_threshold@PLT
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	776(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 776(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	776(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.1(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	772(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 772(%rsp)         # 4-byte Spill
	callq	write@PLT
	movq	mbedtls_test_srv_crt_len@GOTPCREL(%rip), %rcx
	movq	mbedtls_test_srv_crt@GOTPCREL(%rip), %rdx
	movq	(%rdx), %rsi
	movq	(%rcx), %rdx
	leaq	1040(%rsp), %rdi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	760(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 760(%rsp)         # 8-byte Spill
	callq	mbedtls_x509_crt_parse@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, 20540(%rsp)
	je	.LBB1_2
# %bb.1:                                # %if.then
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	752(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 752(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	752(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.2(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	748(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 748(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_2:                                # %if.end
	movq	mbedtls_test_cas_pem@GOTPCREL(%rip), %rsi
	movq	mbedtls_test_cas_pem_len@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	leaq	1040(%rsp), %rdi
	callq	mbedtls_x509_crt_parse@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, 20540(%rsp)
	je	.LBB1_4
# %bb.3:                                # %if.then12
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	736(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 736(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	736(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.2(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	732(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 732(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_4:                                # %if.end18
	xorl	%eax, %eax
	movl	%eax, %ecx
	movq	mbedtls_test_srv_key_len@GOTPCREL(%rip), %rdx
	movq	mbedtls_test_srv_key@GOTPCREL(%rip), %rsi
	movq	(%rsi), %rsi
	movq	(%rdx), %rdx
	leaq	1024(%rsp), %rdi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	720(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 720(%rsp)         # 8-byte Spill
	movq	720(%rsp), %r8          # 8-byte Reload
	callq	mbedtls_pk_parse_key@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, 20540(%rsp)
	je	.LBB1_6
# %bb.5:                                # %if.then21
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	712(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 712(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	712(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.3(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	708(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 708(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_6:                                # %if.end27
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	696(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 696(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	696(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.4(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	692(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 692(%rsp)         # 4-byte Spill
	callq	write@PLT
	leaq	3872(%rsp), %rcx
	xorl	%esi, %esi
	movq	%rcx, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	680(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 680(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	672(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 672(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	672(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.5(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	668(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 668(%rsp)         # 4-byte Spill
	callq	write@PLT
	xorl	%ecx, %ecx
	leaq	20528(%rsp), %rdi
	leaq	.L.str.6(%rip), %rsi
	leaq	.L.str.7(%rip), %rdx
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	656(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 656(%rsp)         # 8-byte Spill
	callq	mbedtls_net_bind@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	je	.LBB1_8
# %bb.7:                                # %if.then40
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	648(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 648(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	648(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.8(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	644(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 644(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_8:                                # %if.end46
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	632(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 632(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	632(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.4(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	628(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 628(%rsp)         # 4-byte Spill
	callq	write@PLT
	leaq	3872(%rsp), %rcx
	xorl	%esi, %esi
	movq	%rcx, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	616(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 616(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	608(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 608(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	608(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.9(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	604(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 604(%rsp)         # 4-byte Spill
	callq	write@PLT
	movq	mbedtls_entropy_func@GOTPCREL(%rip), %rsi
	leaq	2752(%rsp), %rcx
	movq	3864(%rsp), %rdx
	movq	3864(%rsp), %rdi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	592(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 592(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	584(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rsi, 584(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	576(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 576(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	568(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rdx, 568(%rsp)         # 8-byte Spill
	callq	strlen@PLT
	leaq	2408(%rsp), %rdi
	movq	584(%rsp), %rsi         # 8-byte Reload
	movq	576(%rsp), %rdx         # 8-byte Reload
	movq	568(%rsp), %rcx         # 8-byte Reload
	movq	%rax, %r8
	callq	mbedtls_ctr_drbg_seed@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	je	.LBB1_10
# %bb.9:                                # %if.then60
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	560(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 560(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	560(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.10(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	556(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 556(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_10:                               # %if.end66
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	544(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 544(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	544(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.4(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 540(%rsp)         # 4-byte Spill
	callq	write@PLT
	leaq	3872(%rsp), %rcx
	xorl	%esi, %esi
	movq	%rcx, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	528(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 528(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	520(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 520(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	520(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.11(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	516(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 516(%rsp)         # 4-byte Spill
	callq	write@PLT
	xorl	%edi, %edi
	leaq	1592(%rsp), %rcx
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	512(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%edi, 512(%rsp)         # 4-byte Spill
	movq	%rcx, %rdi
	movl	$1, %esi
	movl	512(%rsp), %edx         # 4-byte Reload
	movl	512(%rsp), %ecx         # 4-byte Reload
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	504(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 504(%rsp)         # 8-byte Spill
	callq	mbedtls_ssl_config_defaults@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	je	.LBB1_12
# %bb.11:                               # %if.then79
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	496(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 496(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	496(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.12(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	492(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 492(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_12:                               # %if.end85
	movq	mbedtls_ctr_drbg_random@GOTPCREL(%rip), %rsi
	leaq	2408(%rsp), %rax
	leaq	1592(%rsp), %rdi
	movq	%rax, %rdx
	callq	mbedtls_ssl_conf_rng@PLT
	movq	stdout@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	leaq	1592(%rsp), %rdi
	leaq	my_debug(%rip), %rsi
	movq	%rax, %rdx
	callq	mbedtls_ssl_conf_dbg@PLT
	movq	mbedtls_ssl_cache_get@GOTPCREL(%rip), %rdx
	movq	mbedtls_ssl_cache_set@GOTPCREL(%rip), %rcx
	leaq	1008(%rsp), %rax
	leaq	1592(%rsp), %rdi
	movq	%rax, %rsi
	callq	mbedtls_ssl_conf_session_cache@PLT
	xorl	%r8d, %r8d
	movl	%r8d, %edx
	movq	1584(%rsp), %rsi
	leaq	1592(%rsp), %rdi
	callq	mbedtls_ssl_conf_ca_chain@PLT
	leaq	1592(%rsp), %rdi
	leaq	1040(%rsp), %rsi
	leaq	1024(%rsp), %rdx
	callq	mbedtls_ssl_conf_own_cert@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	je	.LBB1_14
# %bb.13:                               # %if.then88
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	480(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 480(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	480(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.13(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	476(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 476(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_14:                               # %if.end94
	leaq	1968(%rsp), %rdi
	leaq	1592(%rsp), %rsi
	callq	mbedtls_ssl_setup@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	je	.LBB1_16
# %bb.15:                               # %if.then97
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	464(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 464(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	464(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.14(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	460(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 460(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_16:                               # %if.end103
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	448(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 448(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	448(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.4(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	444(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 444(%rsp)         # 4-byte Spill
	callq	write@PLT
.LBB1_17:                               # %reset
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_22 Depth 2
                                        #     Child Loop BB1_28 Depth 2
                                        #     Child Loop BB1_42 Depth 2
                                        #     Child Loop BB1_50 Depth 2
                                        #     Child Loop BB1_58 Depth 2
	cmpl	$0, 20540(%rsp)
	je	.LBB1_19
# %bb.18:                               # %if.then110
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	896(%rsp), %rsi
	movl	20540(%rsp), %edi
	movl	$100, %edx
	callq	mbedtls_strerror@PLT
	leaq	896(%rsp), %rcx
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	432(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 432(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	424(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 424(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	424(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.15(%rip), %rsi
	movq	432(%rsp), %rcx         # 8-byte Reload
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	420(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 420(%rsp)         # 4-byte Spill
	callq	write@PLT
.LBB1_19:                               # %if.end118
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	20520(%rsp), %rdi
	callq	mbedtls_net_free@PLT
	leaq	1968(%rsp), %rdi
	callq	mbedtls_ssl_session_reset@PLT
	leaq	3872(%rsp), %rcx
	xorl	%esi, %esi
	movq	%rcx, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	416(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 416(%rsp)         # 4-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	408(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 408(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	408(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.16(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	404(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 404(%rsp)         # 4-byte Spill
	callq	write@PLT
	xorl	%edi, %edi
	movl	%edi, %ecx
	leaq	20528(%rsp), %rdi
	leaq	20520(%rsp), %rsi
	movq	%rcx, %rdx
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	392(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 392(%rsp)         # 8-byte Spill
	movq	392(%rsp), %r8          # 8-byte Reload
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	384(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 384(%rsp)         # 8-byte Spill
	callq	mbedtls_net_accept@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	je	.LBB1_21
# %bb.20:                               # %if.then127
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	376(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 376(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	376(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.17(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	372(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 372(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_21:                               # %if.end133
                                        #   in Loop: Header=BB1_17 Depth=1
	movq	mbedtls_net_send@GOTPCREL(%rip), %rdx
	movq	mbedtls_net_recv@GOTPCREL(%rip), %rcx
	xorl	%eax, %eax
	movl	%eax, %r8d
	leaq	20520(%rsp), %rsi
	leaq	1968(%rsp), %rdi
	callq	mbedtls_ssl_set_bio@PLT
	leaq	3872(%rsp), %rcx
	xorl	%esi, %esi
	movq	%rcx, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	360(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 360(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	360(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.4(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	356(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 356(%rsp)         # 4-byte Spill
	callq	write@PLT
	leaq	3872(%rsp), %rcx
	xorl	%esi, %esi
	movq	%rcx, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	344(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 344(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	336(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 336(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	336(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.18(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	332(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 332(%rsp)         # 4-byte Spill
	callq	write@PLT
	leaq	3800(%rsp), %rcx
	leaq	3824(%rsp), %rdi
	movq	%rcx, %rsi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	320(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 320(%rsp)         # 8-byte Spill
	callq	gettimeofday@PLT
.LBB1_22:                               # %while.cond
                                        #   Parent Loop BB1_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1968(%rsp), %rdi
	callq	mbedtls_ssl_handshake@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	je	.LBB1_27
# %bb.23:                               # %while.body
                                        #   in Loop: Header=BB1_22 Depth=2
	cmpl	$-26880, 20540(%rsp)    # imm = 0x9700
	je	.LBB1_26
# %bb.24:                               # %land.lhs.true
                                        #   in Loop: Header=BB1_22 Depth=2
	cmpl	$-26752, 20540(%rsp)    # imm = 0x9780
	je	.LBB1_26
# %bb.25:                               # %if.then149
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	312(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 312(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	312(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.19(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	308(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 308(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_17
.LBB1_26:                               # %if.end155
                                        #   in Loop: Header=BB1_22 Depth=2
	jmp	.LBB1_22
.LBB1_27:                               # %while.end
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3800(%rsp), %rax
	leaq	3808(%rsp), %rdi
	movq	%rax, %rsi
	callq	gettimeofday@PLT
	leaq	3824(%rsp), %rdi
	leaq	3808(%rsp), %rsi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	304(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 304(%rsp)         # 4-byte Spill
	callq	subtime@PLT
	leaq	3872(%rsp), %rcx
	xorl	%esi, %esi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	3792(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 3792(%rsp)
	movq	%rcx, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	296(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 296(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	296(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.4(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	292(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 292(%rsp)         # 4-byte Spill
	callq	write@PLT
	leaq	3872(%rsp), %rcx
	xorl	%esi, %esi
	movq	%rcx, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	280(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 280(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	272(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 272(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	272(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.20(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	268(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 268(%rsp)         # 4-byte Spill
	callq	write@PLT
.LBB1_28:                               # %do.body
                                        #   Parent Loop BB1_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	4128(%rsp), %rax
	xorl	%esi, %esi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20536(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	$16383, 20536(%rsp)     # imm = 0x3FFF
	movq	%rax, %rdi
	movl	$16384, %edx            # imm = 0x4000
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	256(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 256(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movslq	20536(%rsp), %rdx
	leaq	1968(%rsp), %rdi
	movq	256(%rsp), %rsi         # 8-byte Reload
	callq	mbedtls_ssl_read@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$-26880, 20540(%rsp)    # imm = 0x9700
	je	.LBB1_30
# %bb.29:                               # %lor.lhs.false
                                        #   in Loop: Header=BB1_28 Depth=2
	cmpl	$-26752, 20540(%rsp)    # imm = 0x9780
	jne	.LBB1_31
.LBB1_30:                               # %if.then175
                                        #   in Loop: Header=BB1_28 Depth=2
	jmp	.LBB1_40
.LBB1_31:                               # %if.end176
                                        #   in Loop: Header=BB1_28 Depth=2
	cmpl	$0, 20540(%rsp)
	jg	.LBB1_37
# %bb.32:                               # %if.then179
                                        #   in Loop: Header=BB1_17 Depth=1
	movl	20540(%rsp), %eax
	movl	%eax, %ecx
	subl	$-30848, %ecx           # imm = 0x8780
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	252(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 252(%rsp)         # 4-byte Spill
	je	.LBB1_33
	jmp	.LBB1_67
.LBB1_67:                               # %if.then179
                                        #   in Loop: Header=BB1_17 Depth=1
	movl	252(%rsp), %eax         # 4-byte Reload
	subl	$-80, %eax
	je	.LBB1_34
	jmp	.LBB1_35
.LBB1_33:                               # %sw.bb
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	240(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 240(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	240(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.21(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	236(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 236(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_36
.LBB1_34:                               # %sw.bb185
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	224(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 224(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	224(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.22(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	220(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 220(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_36
.LBB1_35:                               # %sw.default
                                        #   in Loop: Header=BB1_17 Depth=1
	xorl	%eax, %eax
	leaq	3872(%rsp), %rcx
	movq	%rcx, %rdi
	movl	%eax, %esi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	216(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 216(%rsp)         # 4-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	208(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 208(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	216(%rsp), %eax         # 4-byte Reload
	subl	20540(%rsp), %eax
	movq	208(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.23(%rip), %rsi
	movl	%eax, %edx
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	204(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 204(%rsp)         # 4-byte Spill
	callq	write@PLT
.LBB1_36:                               # %sw.epilog
                                        #   in Loop: Header=BB1_17 Depth=1
	jmp	.LBB1_41
.LBB1_37:                               # %if.end196
                                        #   in Loop: Header=BB1_28 Depth=2
	leaq	4128(%rsp), %rcx
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movl	20540(%rsp), %edx
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20536(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%edx, 20536(%rsp)
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	192(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 192(%rsp)         # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	184(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 184(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20536(%rsp), %edx
	movq	184(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.24(%rip), %rsi
	movq	192(%rsp), %rcx         # 8-byte Reload
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	180(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 180(%rsp)         # 4-byte Spill
	callq	write@PLT
	cmpl	$0, 20540(%rsp)
	jle	.LBB1_39
# %bb.38:                               # %if.then205
                                        #   in Loop: Header=BB1_17 Depth=1
	jmp	.LBB1_41
.LBB1_39:                               # %if.end206
                                        #   in Loop: Header=BB1_28 Depth=2
	jmp	.LBB1_40
.LBB1_40:                               # %do.cond
                                        #   in Loop: Header=BB1_28 Depth=2
	movb	$1, %al
	testb	$1, %al
	jne	.LBB1_28
	jmp	.LBB1_41
.LBB1_41:                               # %do.end
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	168(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 168(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	168(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.25(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	164(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 164(%rsp)         # 4-byte Spill
	callq	write@PLT
	xorl	%esi, %esi
	leaq	4128(%rsp), %rdi
	leaq	.L.str.26(%rip), %rcx
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	160(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%esi, 160(%rsp)         # 4-byte Spill
	movq	%rcx, %rsi
	movl	$108, %edx
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	152(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 152(%rsp)         # 8-byte Spill
	callq	memcpy@PLT
	leaq	.L.str.27(%rip), %rdi
	movl	160(%rsp), %esi         # 4-byte Reload
	movb	$0, %al
	callq	open@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	3860(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 3860(%rsp)
	leaq	3800(%rsp), %rcx
	leaq	3824(%rsp), %rdi
	movq	%rcx, %rsi
	callq	gettimeofday@PLT
	movl	3860(%rsp), %edi
	leaq	4128(%rsp), %rcx
	addq	$107, %rcx
	movq	%rcx, %rsi
	movl	$16276, %edx            # imm = 0x3F94
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	148(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 148(%rsp)         # 4-byte Spill
	callq	read@PLT
                                        # kill: def $eax killed $eax killed $rax
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20536(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20536(%rsp)
	leaq	3800(%rsp), %rcx
	leaq	3808(%rsp), %rdi
	movq	%rcx, %rsi
	callq	gettimeofday@PLT
	leaq	3824(%rsp), %rdi
	leaq	3808(%rsp), %rsi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	144(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 144(%rsp)         # 4-byte Spill
	callq	subtime@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	3784(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 3784(%rsp)
	movl	3860(%rsp), %edi
	callq	close@PLT
	leaq	3800(%rsp), %rcx
	leaq	3824(%rsp), %rdi
	movq	%rcx, %rsi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	140(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 140(%rsp)         # 4-byte Spill
	callq	gettimeofday@PLT
.LBB1_42:                               # %while.cond221
                                        #   Parent Loop BB1_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	4128(%rsp), %rsi
	movslq	20536(%rsp), %rdx
	leaq	1968(%rsp), %rdi
	callq	mbedtls_ssl_write@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	jg	.LBB1_49
# %bb.43:                               # %while.body227
                                        #   in Loop: Header=BB1_42 Depth=2
	cmpl	$-80, 20540(%rsp)
	jne	.LBB1_45
# %bb.44:                               # %if.then230
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	128(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 128(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movq	128(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.28(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	124(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 124(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_17
.LBB1_45:                               # %if.end236
                                        #   in Loop: Header=BB1_42 Depth=2
	cmpl	$-26880, 20540(%rsp)    # imm = 0x9700
	je	.LBB1_48
# %bb.46:                               # %land.lhs.true239
                                        #   in Loop: Header=BB1_42 Depth=2
	cmpl	$-26752, 20540(%rsp)    # imm = 0x9780
	je	.LBB1_48
# %bb.47:                               # %if.then242
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	112(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 112(%rsp)         # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	112(%rsp), %rdi         # 8-byte Reload
	leaq	.L.str.29(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	108(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 108(%rsp)         # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_48:                               # %if.end248
                                        #   in Loop: Header=BB1_42 Depth=2
	jmp	.LBB1_42
.LBB1_49:                               # %while.end249
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3800(%rsp), %rax
	leaq	3808(%rsp), %rdi
	movq	%rax, %rsi
	callq	gettimeofday@PLT
	leaq	3824(%rsp), %rdi
	leaq	3808(%rsp), %rsi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	104(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 104(%rsp)         # 4-byte Spill
	callq	subtime@PLT
	leaq	4128(%rsp), %rdi
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	3776(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 3776(%rsp)
	movq	3792(%rsp), %rdx
	movq	3784(%rsp), %rcx
	movq	3776(%rsp), %r8
	leaq	.L.str.30(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20536(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20536(%rsp)
.LBB1_50:                               # %while.cond254
                                        #   Parent Loop BB1_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	4128(%rsp), %rsi
	movslq	20536(%rsp), %rdx
	leaq	1968(%rsp), %rdi
	callq	mbedtls_ssl_write@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	jg	.LBB1_57
# %bb.51:                               # %while.body260
                                        #   in Loop: Header=BB1_50 Depth=2
	cmpl	$-80, 20540(%rsp)
	jne	.LBB1_53
# %bb.52:                               # %if.then263
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	96(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 96(%rsp)          # 8-byte Spill
	callq	memset@PLT
	movq	96(%rsp), %rdi          # 8-byte Reload
	leaq	.L.str.28(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	92(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 92(%rsp)          # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_17
.LBB1_53:                               # %if.end269
                                        #   in Loop: Header=BB1_50 Depth=2
	cmpl	$-26880, 20540(%rsp)    # imm = 0x9700
	je	.LBB1_56
# %bb.54:                               # %land.lhs.true272
                                        #   in Loop: Header=BB1_50 Depth=2
	cmpl	$-26752, 20540(%rsp)    # imm = 0x9780
	je	.LBB1_56
# %bb.55:                               # %if.then275
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	80(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 80(%rsp)          # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	80(%rsp), %rdi          # 8-byte Reload
	leaq	.L.str.29(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	76(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 76(%rsp)          # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_64
.LBB1_56:                               # %if.end281
                                        #   in Loop: Header=BB1_50 Depth=2
	jmp	.LBB1_50
.LBB1_57:                               # %while.end282
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	.L.str.4(%rip), %rdi
	callq	puts@PLT
	leaq	3872(%rsp), %rcx
	xorl	%esi, %esi
	movq	%rcx, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	72(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 72(%rsp)          # 4-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	64(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 64(%rsp)          # 8-byte Spill
	callq	memset@PLT
	movq	64(%rsp), %rdi          # 8-byte Reload
	leaq	.L.str.31(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	60(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 60(%rsp)          # 4-byte Spill
	callq	write@PLT
.LBB1_58:                               # %while.cond289
                                        #   Parent Loop BB1_17 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leaq	1968(%rsp), %rdi
	callq	mbedtls_ssl_close_notify@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 20540(%rsp)
	cmpl	$0, %eax
	jge	.LBB1_63
# %bb.59:                               # %while.body293
                                        #   in Loop: Header=BB1_58 Depth=2
	cmpl	$-26880, 20540(%rsp)    # imm = 0x9700
	je	.LBB1_62
# %bb.60:                               # %land.lhs.true296
                                        #   in Loop: Header=BB1_58 Depth=2
	cmpl	$-26752, 20540(%rsp)    # imm = 0x9780
	je	.LBB1_62
# %bb.61:                               # %if.then299
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	48(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 48(%rsp)          # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	48(%rsp), %rdi          # 8-byte Reload
	leaq	.L.str.32(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	44(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 44(%rsp)          # 4-byte Spill
	callq	write@PLT
	jmp	.LBB1_17
.LBB1_62:                               # %if.end305
                                        #   in Loop: Header=BB1_58 Depth=2
	jmp	.LBB1_58
.LBB1_63:                               # %while.end306
                                        #   in Loop: Header=BB1_17 Depth=1
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	32(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 32(%rsp)          # 8-byte Spill
	callq	memset@PLT
	movq	32(%rsp), %rdi          # 8-byte Reload
	leaq	.L.str.4(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	28(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 28(%rsp)          # 4-byte Spill
	callq	write@PLT
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	20540(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	$0, 20540(%rsp)
	jmp	.LBB1_17
.LBB1_64:                               # %exit
	cmpl	$0, 20540(%rsp)
	je	.LBB1_66
# %bb.65:                               # %if.then314
	leaq	784(%rsp), %rsi
	movl	20540(%rsp), %edi
	movl	$100, %edx
	callq	mbedtls_strerror@PLT
	leaq	784(%rsp), %rcx
	leaq	3872(%rsp), %rax
	xorl	%esi, %esi
	movq	%rax, %rdi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	16(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rcx, 16(%rsp)          # 8-byte Spill
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	8(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movq	%rax, 8(%rsp)           # 8-byte Spill
	callq	memset@PLT
	movl	20540(%rsp), %edx
	movq	8(%rsp), %rdi           # 8-byte Reload
	leaq	.L.str.15(%rip), %rsi
	movq	16(%rsp), %rcx          # 8-byte Reload
	movb	$0, %al
	callq	sprintf@PLT
	leaq	3872(%rsp), %rsi
	movl	$1, %edi
	movl	$256, %edx              # imm = 0x100
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	4(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB1_68
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB1_68
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 4(%rsp)           # 4-byte Spill
	callq	write@PLT
.LBB1_66:                               # %if.end323
	leaq	20520(%rsp), %rdi
	callq	mbedtls_net_free@PLT
	leaq	20528(%rsp), %rdi
	callq	mbedtls_net_free@PLT
	leaq	1040(%rsp), %rdi
	callq	mbedtls_x509_crt_free@PLT
	leaq	1024(%rsp), %rdi
	callq	mbedtls_pk_free@PLT
	leaq	1968(%rsp), %rdi
	callq	mbedtls_ssl_free@PLT
	leaq	1592(%rsp), %rdi
	callq	mbedtls_ssl_config_free@PLT
	leaq	1008(%rsp), %rdi
	callq	mbedtls_ssl_cache_free@PLT
	leaq	2408(%rsp), %rdi
	callq	mbedtls_ctr_drbg_free@PLT
	leaq	2752(%rsp), %rdi
	callq	mbedtls_entropy_free@PLT
	xorl	%edi, %edi
	callq	exit@PLT
.LBB1_68:                               # Label of block must be emitted
	popfq
	popq	%rax
	popq	%rbx
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.LBB1_69:                               # Label of block must be emitted
	popq	%rax
	movl	$4294967295, %edi       # imm = 0xFFFFFFFF
	callq	exit
.Lfunc_end1:
	.size	enclave_main, .Lfunc_end1-enclave_main
                                        # -- End function
	.p2align	4, 0x90         # -- Begin function my_debug
	.type	my_debug,@function
my_debug:                               # @my_debug
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
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB2_3
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB2_3
	popq	%rax
	subq	$4160, %rsp             # imm = 0x1040
	pushq	%rax
	movabsq	$6917529027641081855, %rax # imm = 0x5FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	ja	.LBB2_3
	movabsq	$8070450532247928831, %rax # imm = 0x6FFFFFFFFFFFFFFF
	cmpq	%rax, %rsp
	jb	.LBB2_3
	popq	%rax
	leaq	16(%rsp), %rax
	xorl	%r9d, %r9d
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	4152(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popfq
	popq	%rax
	popq	%rbx
	movq	%rdi, 4152(%rsp)
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	4148(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popfq
	popq	%rax
	popq	%rbx
	movl	%esi, 4148(%rsp)
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	4136(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popfq
	popq	%rax
	popq	%rbx
	movq	%rdx, 4136(%rsp)
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	4132(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popfq
	popq	%rax
	popq	%rbx
	movl	%ecx, 4132(%rsp)
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	4120(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popfq
	popq	%rax
	popq	%rbx
	movq	%r8, 4120(%rsp)
	movq	%rax, %rdx
	movq	%rdx, %rdi
	movl	%r9d, %esi
	movl	$4096, %edx             # imm = 0x1000
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
	movq	%rax, 8(%rsp)           # 8-byte Spill
	callq	memset@PLT
	movq	4136(%rsp), %rdx
	movl	4132(%rsp), %ecx
	movq	4120(%rsp), %r8
	movq	8(%rsp), %rdi           # 8-byte Reload
	leaq	.L.str.33(%rip), %rsi
	movb	$0, %al
	callq	sprintf@PLT
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	movl	$4096, %edx             # imm = 0x1000
	pushq	%rbx
	pushq	%rax
	pushfq
	leaq	4(%rsp), %rax
	movabsq	$4611686018427387903, %rbx # imm = 0x3FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	ja	.LBB2_1
	movabsq	$5764607523034234879, %rbx # imm = 0x4FFFFFFFFFFFFFFF
	cmpq	%rbx, %rax
	jb	.LBB2_1
	popfq
	popq	%rax
	popq	%rbx
	movl	%eax, 4(%rsp)           # 4-byte Spill
	callq	write@PLT
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
	.size	my_debug, .Lfunc_end2-my_debug
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"ssl_server"
	.size	.L.str, 11

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"\n  . Loading the server cert. and key...\n"
	.size	.L.str.1, 42

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	" failed\n  !  mbedtls_x509_crt_parse returned %d\n\n"
	.size	.L.str.2, 50

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	" failed\n  !  mbedtls_pk_parse_key returned %d\n\n"
	.size	.L.str.3, 48

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	" ok\n"
	.size	.L.str.4, 5

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"  . Bind on https://localhost:4433/ ..."
	.size	.L.str.5, 40

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"129.79.240.235"
	.size	.L.str.6, 15

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"4433"
	.size	.L.str.7, 5

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	" failed\n  ! mbedtls_net_bind returned %d\n\n"
	.size	.L.str.8, 43

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"  . Seeding the random number generator..."
	.size	.L.str.9, 43

	.type	.L.str.10,@object       # @.str.10
.L.str.10:
	.asciz	" failed\n  ! mbedtls_ctr_drbg_seed returned %d\n"
	.size	.L.str.10, 47

	.type	.L.str.11,@object       # @.str.11
.L.str.11:
	.asciz	"  . Setting up the SSL data...."
	.size	.L.str.11, 32

	.type	.L.str.12,@object       # @.str.12
.L.str.12:
	.asciz	" failed\n  ! mbedtls_ssl_config_defaults returned %d\n\n"
	.size	.L.str.12, 54

	.type	.L.str.13,@object       # @.str.13
.L.str.13:
	.asciz	" failed\n  ! mbedtls_ssl_conf_own_cert returned %d\n\n"
	.size	.L.str.13, 52

	.type	.L.str.14,@object       # @.str.14
.L.str.14:
	.asciz	" failed\n  ! mbedtls_ssl_setup returned %d\n\n"
	.size	.L.str.14, 44

	.type	.L.str.15,@object       # @.str.15
.L.str.15:
	.asciz	"Last error was: %d - %s\n\n"
	.size	.L.str.15, 26

	.type	.L.str.16,@object       # @.str.16
.L.str.16:
	.asciz	"  . Waiting for a remote connection ..."
	.size	.L.str.16, 40

	.type	.L.str.17,@object       # @.str.17
.L.str.17:
	.asciz	" failed\n  ! mbedtls_net_accept returned %d\n\n"
	.size	.L.str.17, 45

	.type	.L.str.18,@object       # @.str.18
.L.str.18:
	.asciz	"  . Performing the SSL/TLS handshake..."
	.size	.L.str.18, 40

	.type	.L.str.19,@object       # @.str.19
.L.str.19:
	.asciz	" failed\n  ! mbedtls_ssl_handshake returned %d\n\n"
	.size	.L.str.19, 48

	.type	.L.str.20,@object       # @.str.20
.L.str.20:
	.asciz	"  < Read from client:"
	.size	.L.str.20, 22

	.type	.L.str.21,@object       # @.str.21
.L.str.21:
	.asciz	" connection was closed gracefully\n"
	.size	.L.str.21, 35

	.type	.L.str.22,@object       # @.str.22
.L.str.22:
	.asciz	" connection was reset by peer\n"
	.size	.L.str.22, 31

	.type	.L.str.23,@object       # @.str.23
.L.str.23:
	.asciz	" mbedtls_ssl_read returned -0x%x\n"
	.size	.L.str.23, 34

	.type	.L.str.24,@object       # @.str.24
.L.str.24:
	.asciz	" %d bytes read\n\n%s"
	.size	.L.str.24, 19

	.type	.L.str.25,@object       # @.str.25
.L.str.25:
	.asciz	"  > Write to client:"
	.size	.L.str.25, 21

	.type	.L.str.26,@object       # @.str.26
.L.str.26:
	.asciz	"HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n<h2>mbed TLS Test Server</h2>\r\n<p>Successful connection using: "
	.size	.L.str.26, 108

	.type	.L.str.27,@object       # @.str.27
.L.str.27:
	.asciz	"/home/jaebaek/apache.txt"
	.size	.L.str.27, 25

	.type	.L.str.28,@object       # @.str.28
.L.str.28:
	.asciz	" failed\n  ! peer closed the connection\n\n"
	.size	.L.str.28, 41

	.type	.L.str.29,@object       # @.str.29
.L.str.29:
	.asciz	" failed\n  ! mbedtls_ssl_write returned %d\n\n"
	.size	.L.str.29, 44

	.type	.L.str.30,@object       # @.str.30
.L.str.30:
	.asciz	"</p>\n\n\nhandshake = %ld\n             read = %ld\nsend=%ld\n"
	.size	.L.str.30, 57

	.type	.L.str.31,@object       # @.str.31
.L.str.31:
	.asciz	"  . Closing the connection..."
	.size	.L.str.31, 30

	.type	.L.str.32,@object       # @.str.32
.L.str.32:
	.asciz	" failed\n  ! mbedtls_ssl_close_notify returned %d\n\n"
	.size	.L.str.32, 51

	.type	.L.str.33,@object       # @.str.33
.L.str.33:
	.asciz	"%s:%04d: %s"
	.size	.L.str.33, 12


	.ident	"clang version 9.0.0 (https://github.com/StanPlatinum/proofGen.git 79f770dd6b6cc9add7ccbb89e5bbf0801e4cee29)"
	.section	".note.GNU-stack","",@progbits
