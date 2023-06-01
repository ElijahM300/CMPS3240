# Elijah Morris
# CMPS 3240
# Lab 2

.text
.global _start
_start:
	# long long int r0 = ???
	# generally ... x prefix for PTRs
	# * POINTERS are always 'x' ... mem 64 bits  
	mov x0, 0xffffffffffffffff
	# 'mov' - Right to left 
	# MIPS: addi $t0 $0 0xfffffff
	# int r1 = ....
	mov w1, 0xffffffff
_a1:
	mov x3, #12
	mov x4, 0xfffffffffffffffe
	add x5, x3, x4
_a2:
	ldr x0, =badger
_b1:
	ldr x2, [x0]
	add x2, x2, 3
_b2:
	str x2, [x0]
_b3:
	ldr x1, =coyote
	ldr w2, [x1,#8]
	add w2, w2, #100
	str w2, [x1,#8]
_b4:
	ldr x4, =fox
	ldr w0, [x1, #0]
	ldr w2, [x1, #4]
	ldr w3, [x1, #8]
	ldr w5, [x1, #12]
	ldr w6, [x1, #16]
	ldr w7, [x1, #20]
	str w0, [x4, #0]
	str w2, [x4, #4]
	str w3, [x4, #8]
	str w5, [x4, #12]
	str w6, [x4, #16]
	str w7, [x4, #20]
		
_b5:
	mov x8, #93
	mov x0, #0
	svc #0

.data
.global badger
badger:
	.word	7
.global eagle
eagle:
	.word 0

.global coyote
coyote:
	.word	0
	.word	2
	.word	4
	.word	6
	.word	8
	.word	10

.global fox
.comm fox, 200, 4
