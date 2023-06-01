// Begin no errors
	.arch armv8-a
	.file	"main.c"
	.text
	.align	2
	.global	even
	.type	even, %function
even:
// End no errors
	stp	x29, x30, [sp], 32
	str	a0, [x29, 8]
	ldr	a0, [x29, 8]
	bne	t0, #1, recursion
	move	v0, #0
	j	alldone
recursion:
	ldr	t0, [x29, 8]
	addi	t0, t0, -1
	jal	even
	add	v0, v0, #2
alldone:
	ldp	x29, x30, [sp, 32]	
	jr 	ra
	.size	even, .-even
	.section	.rodata
	.align	3
.LC0:
	.string	"The 179th even number is %d"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	mov	w0, 179
	bl	even
	str	w0, [x29, 28]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	ldr	w1, [x29, 28]
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
