// Begin no errors
	.arch armv8-a
	.file	"main.c"
	.text
	.align	2
	.global	even
	.type	even, %function
even:
// End no errors
	stp	x29, x30, [sp, -32]!
	str	x0, [x29, 16]
	ldr	x0, [x29, 16]
	cmp	x0, #1 
	bne	recursion
	mov	x0, #0
	b	alldone
recursion:
	ldr	x0, [x29, 16]
	sub	x0, x0, #1
	bl	even
	add	x0, x0, #2
alldone:
	ldp	x29, x30, [sp], 32	
	ret
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
answer:
	bl	printf
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
