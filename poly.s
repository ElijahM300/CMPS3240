/* Start section of no errors */
	.arch armv8-a
	.file	"poly.c"
	.text
	.align	2
	.global	mypoly
	.type	mypoly, %function
mypoly:
.LFB0:
	.cfi_startproc
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
/* End section of no errors */
	str	x0, [sp, 16]
	str	x1, [sp, 12]
	str	x2, [sp, 8]
	str	x3, [sp, 4]
	str	w4, [sp]
	str	wzr, [sp, 16]
	b	.L2
.L3:
	ld1 	{v0.2s}, [x1], 8
	ld1 	{v1.2s}, [x2], 8
	ld1 	{v2.2s}, [x3], 8
	fmul 	v0.2s, v0.2s, v0.2s
	fadd 	v0.2s, v0.2s, v1.2s
	fadd 	v0.2s, v0.2s, v2.2s
	st1 	{v0.2s}, [x0], 8
	ld1 	{v3.2s}, [x1], 8
	ld1 	{v4.2s}, [x2], 8
	ld1 	{v5.2s}, [x3], 8
	fmul 	v3.2s, v3.2s, v3.2s
	fadd 	v3.2s, v3.2s, v4.2s
	fadd 	v3.2s, v3.2s, v5.2s
	st1 	{v3.2s}, [x0], 8
	add	w0, w0, 4
	str	w0, [sp, 16]
.L2:
	ldr	w0, [sp, 16]
	ldr	w1, [sp]
	cmp	w0, w1
	blt	.L3
/* Start section of no errors */
	nop
	nop
	add	sp, sp, 64
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	mypoly, .-mypoly
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
