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
	sw	a0, [sp, 16]
	sw	a1, [sp, 12]
	sw	a2, [sp, 8]
	sw	a3, [sp, 4]
	sw	w4, [sp]
	sw	wzr, [sp, 16]
	j	.L2
.L3:
	ldr 	{v0.2s}, [x1, 4]
	ldr 	{v1.2s}, [x2, 4]
	ldr 	{v2.2s}, [x3, 4]
	mul 	{v0.2s}, {v0.2s}, {v0.2s}
	add 	{v0.2s}, {v0.2s}, {v1.2s}
	add 	{v0.2s}, {v0.2s}, {v2.2s}
	sw 	{v0.2s}, [x0, 4]
	sw 	{v3.2s}, [x0, 4]
	add	w0, w0, 1
	sw	w0, [sp, 16]
.L2:
	ldr	w0, [sp, 16]
	ldr	w1, [sp]
	blt	w0, w1, .L3
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
