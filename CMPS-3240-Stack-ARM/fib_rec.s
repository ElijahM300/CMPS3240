#Elijah Morris
#Lab 4
#2/24/23

.data
.global string1
string1:
	.ascii	"The %dth fibonacci number is %d!\n\0"
string2:
	.ascii	"Entering fib() with n=%d\n\0"

.text
.extern printf
.global main
main:
### SET UP FRAME RECORD ###
# Save FP and LR with pre-indexing, allocated another 16 bytes for temp.
stp	x29, x30, [sp, -16]!
# Set FP
add	x29, sp, 0

### MAIN() LOGIC ###
# Call fib(8)
mov	x0, 8
bl	fib
# Respond with prompt
add	x2, x0, 0
mov	x1, 8
ldr	x0, =string1
bl	printf

### TAKE DOWN FRAME RECORD ###
ldp	x29, x30, [sp], 16
mov	w0, 0
ret

.global fib
fib:
### SET UP FRAME RECORD ###
# Save FP and LR with pre-indexing, allocated another 16 bytes for temp.
stp	x29, x30, [sp, -32]!
# Set FP
add	x29, sp, 0
# Shadow input argument n
str	x0, [sp, 16]

### SOME PROMPTS ###
ldr	x0, =string2
ldr	x1, [sp, 16]
bl printf

### LOGIC FOR FIB() ###
ldr	x0, [sp, 16]
cmp	x0, 0
# If n == 0, return 0 ... jump to block that returns 0
beq 	return0
# If n == 1, return 1 ... jump to block that returns 1
cmp	x0, 1
beq	return1
# Logic for calc. fib(n - 2) + fib(n - 1) here. At this instruction the value for x0 
# should still hold arg1 for this call. Calculate n-2, note it's set up in x0 
# which is the argument register
sub	x0, x0, 2
# This is the call to fib(n-2)
bl	fib
str	x0, [sp, 24]
ldr	x0, [sp, 16]
sub	x0, x0, 1
bl	fib
ldr	x9, [sp, 24]
add	x0, x0, x9 
b 	return

return0:
mov	x0, 0
b	return
# return0 block jumps to the return code

return1: 
mov	x0, 1

return:
ldp	x29, x30, [sp], 32
ret
