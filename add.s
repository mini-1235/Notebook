	.file	"add.cpp"
	.text
	.section	.text._ZSt4fabsf,"axG",@progbits,_ZSt4fabsf,comdat
	.weak	_ZSt4fabsf
	.type	_ZSt4fabsf, @function
_ZSt4fabsf:
.LFB57:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	vmovss	%xmm0, -4(%rbp)
	vmovss	-4(%rbp), %xmm0
	vmovss	.LC0(%rip), %xmm1
	vandps	%xmm1, %xmm0, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE57:
	.size	_ZSt4fabsf, .-_ZSt4fabsf
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 400000000
a:
	.zero	400000000
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 400000000
b:
	.zero	400000000
	.globl	c
	.align 32
	.type	c, @object
	.size	c, 400000000
c:
	.zero	400000000
	.globl	d
	.align 32
	.type	d, @object
	.size	d, 400000000
d:
	.zero	400000000
	.section	.rodata
.LC3:
	.string	"time=%f\n"
.LC5:
	.string	"Check Failed at %d\n"
.LC6:
	.string	"Check Passed"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5154:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	subq	$392, %rsp
	movl	$0, -400(%rbp)
	jmp	.L4
.L5:
	call	rand@PLT
	addl	$1, %eax
	vcvtsi2sdl	%eax, %xmm1, %xmm1
	vmovsd	.LC1(%rip), %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	-400(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	vmovss	%xmm0, (%rdx,%rax)
	call	rand@PLT
	addl	$1, %eax
	vcvtsi2sdl	%eax, %xmm1, %xmm1
	vmovsd	.LC1(%rip), %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	-400(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	vmovss	%xmm0, (%rdx,%rax)
	addl	$1, -400(%rbp)
.L4:
	cmpl	$99999999, -400(%rbp)
	jle	.L5
	movl	$0, -396(%rbp)
	jmp	.L6
.L9:
	movl	$0, -392(%rbp)
	jmp	.L7
.L8:
	movl	-392(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	d(%rip), %rax
	vmovss	(%rdx,%rax), %xmm1
	movl	-392(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	vmovss	(%rdx,%rax), %xmm2
	movl	-392(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	vmovss	(%rdx,%rax), %xmm0
	vmulss	%xmm0, %xmm2, %xmm0
	vaddss	%xmm0, %xmm1, %xmm0
	movl	-392(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	d(%rip), %rax
	vmovss	%xmm0, (%rdx,%rax)
	addl	$1, -392(%rbp)
.L7:
	cmpl	$99999999, -392(%rbp)
	jle	.L8
	addl	$1, -396(%rbp)
.L6:
	cmpl	$19, -396(%rbp)
	jle	.L9
	call	clock@PLT
	movq	%rax, -352(%rbp)
	movl	$0, -388(%rbp)
	jmp	.L10
.L13:
	movl	$0, -384(%rbp)
	jmp	.L11
.L12:
	movl	-384(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	vmovss	(%rdx,%rax), %xmm1
	movl	-384(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	vmovss	(%rdx,%rax), %xmm2
	movl	-384(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	vmovss	(%rdx,%rax), %xmm0
	vmulss	%xmm0, %xmm2, %xmm0
	vaddss	%xmm0, %xmm1, %xmm0
	movl	-384(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	vmovss	%xmm0, (%rdx,%rax)
	addl	$1, -384(%rbp)
.L11:
	cmpl	$99999999, -384(%rbp)
	jle	.L12
	addl	$1, -388(%rbp)
.L10:
	cmpl	$19, -388(%rbp)
	jle	.L13
	call	clock@PLT
	movq	%rax, -344(%rbp)
	movq	-344(%rbp), %rax
	subq	-352(%rbp), %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovsd	.LC2(%rip), %xmm1
	vdivsd	%xmm1, %xmm0, %xmm3
	vmovq	%xmm3, %rax
	vmovq	%rax, %xmm0
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, -380(%rbp)
	jmp	.L14
.L17:
	movl	-380(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	vmovss	(%rdx,%rax), %xmm0
	movl	-380(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	d(%rip), %rax
	vmovss	(%rdx,%rax), %xmm1
	vsubss	%xmm1, %xmm0, %xmm4
	vmovd	%xmm4, %eax
	vmovd	%eax, %xmm0
	call	_ZSt4fabsf
	vmovd	%xmm0, %eax
	movl	-380(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	d(%rip), %rdx
	vmovss	(%rcx,%rdx), %xmm0
	vmovd	%eax, %xmm5
	vdivss	%xmm0, %xmm5, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vcomisd	.LC4(%rip), %xmm0
	seta	%al
	testb	%al, %al
	je	.L15
	movl	-380(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L16
.L15:
	addl	$1, -380(%rbp)
.L14:
	cmpl	$99999999, -380(%rbp)
	jle	.L17
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, -376(%rbp)
	jmp	.L18
.L19:
	call	rand@PLT
	addl	$1, %eax
	vcvtsi2sdl	%eax, %xmm1, %xmm1
	vmovsd	.LC1(%rip), %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	-376(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	vmovss	%xmm0, (%rdx,%rax)
	call	rand@PLT
	addl	$1, %eax
	vcvtsi2sdl	%eax, %xmm1, %xmm1
	vmovsd	.LC1(%rip), %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	movl	-376(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	vmovss	%xmm0, (%rdx,%rax)
	addl	$1, -376(%rbp)
.L18:
	cmpl	$99999999, -376(%rbp)
	jle	.L19
	movl	$0, -372(%rbp)
	jmp	.L20
.L23:
	movl	$0, -368(%rbp)
	jmp	.L21
.L22:
	movl	-368(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	d(%rip), %rax
	vmovss	(%rdx,%rax), %xmm1
	movl	-368(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	vmovss	(%rdx,%rax), %xmm2
	movl	-368(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	vmovss	(%rdx,%rax), %xmm0
	vmulss	%xmm0, %xmm2, %xmm0
	vaddss	%xmm0, %xmm1, %xmm0
	movl	-368(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	d(%rip), %rax
	vmovss	%xmm0, (%rdx,%rax)
	addl	$1, -368(%rbp)
.L21:
	cmpl	$99999999, -368(%rbp)
	jle	.L22
	addl	$1, -372(%rbp)
.L20:
	cmpl	$19, -372(%rbp)
	jle	.L23
	call	clock@PLT
	movq	%rax, -352(%rbp)
	movl	$0, -364(%rbp)
	jmp	.L24
.L32:
	movl	$0, -360(%rbp)
	jmp	.L25
.L31:
	movl	-360(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -312(%rbp)
	movq	-312(%rbp), %rax
	vmovups	(%rax), %ymm0
	vmovaps	%ymm0, -304(%rbp)
	movl	-360(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -320(%rbp)
	movq	-320(%rbp), %rax
	vmovups	(%rax), %ymm0
	vmovaps	%ymm0, -272(%rbp)
	movl	-360(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -328(%rbp)
	movq	-328(%rbp), %rax
	vmovups	(%rax), %ymm0
	vmovaps	%ymm0, -240(%rbp)
	vmovaps	-304(%rbp), %ymm0
	vmovaps	%ymm0, -80(%rbp)
	vmovaps	-272(%rbp), %ymm0
	vmovaps	%ymm0, -48(%rbp)
	vmovaps	-80(%rbp), %ymm0
	vmulps	-48(%rbp), %ymm0, %ymm0
	vmovaps	%ymm0, -208(%rbp)
	vmovaps	-240(%rbp), %ymm0
	vmovaps	%ymm0, -144(%rbp)
	vmovaps	-208(%rbp), %ymm0
	vmovaps	%ymm0, -112(%rbp)
	vmovaps	-144(%rbp), %ymm0
	vaddps	-112(%rbp), %ymm0, %ymm0
	vmovaps	%ymm0, -240(%rbp)
	movl	-360(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, -336(%rbp)
	vmovaps	-240(%rbp), %ymm0
	vmovaps	%ymm0, -176(%rbp)
	vmovaps	-176(%rbp), %ymm0
	movq	-336(%rbp), %rax
	vmovups	%ymm0, (%rax)
	nop
	addl	$8, -360(%rbp)
.L25:
	cmpl	$99999999, -360(%rbp)
	jle	.L31
	addl	$1, -364(%rbp)
.L24:
	cmpl	$19, -364(%rbp)
	jle	.L32
	call	clock@PLT
	movq	%rax, -344(%rbp)
	movq	-344(%rbp), %rax
	subq	-352(%rbp), %rax
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	vmovsd	.LC2(%rip), %xmm1
	vdivsd	%xmm1, %xmm0, %xmm6
	vmovq	%xmm6, %rax
	vmovq	%rax, %xmm0
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, -356(%rbp)
	jmp	.L33
.L35:
	movl	-356(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	c(%rip), %rax
	vmovss	(%rdx,%rax), %xmm0
	movl	-356(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	d(%rip), %rax
	vmovss	(%rdx,%rax), %xmm1
	vsubss	%xmm1, %xmm0, %xmm7
	vmovd	%xmm7, %eax
	vmovd	%eax, %xmm0
	call	_ZSt4fabsf
	vmovd	%xmm0, %eax
	movl	-356(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	d(%rip), %rdx
	vmovss	(%rcx,%rdx), %xmm0
	vmovd	%eax, %xmm3
	vdivss	%xmm0, %xmm3, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vcomisd	.LC4(%rip), %xmm0
	seta	%al
	testb	%al, %al
	je	.L34
	movl	-356(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L16
.L34:
	addl	$1, -356(%rbp)
.L33:
	cmpl	$99999999, -356(%rbp)
	jle	.L35
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L16:
	movq	-8(%rbp), %r10
	.cfi_def_cfa 10, 0
	leave
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5154:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC0:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1093567616
	.align 8
.LC4:
	.long	-350469331
	.long	1058682594
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
