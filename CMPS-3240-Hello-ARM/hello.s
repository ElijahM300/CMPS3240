.text
.global _start
_start:
	mov x1, #7
	add x2, x1, x1
	# This is a comment
	# Operation 64 is sys_write 
	mov x8, #64
	# sys_write takes 1 argument, which file descriptor to print to. 1 is screen.
	mov x0, #1
	# Pointer to string 
	ldr x1, =msg
	# Length of string
	ldr x2, =len
	# Syscall
	svc #0
	mov x8, #93
	mov x0, #0
	svc #0
# Declare the following as data, not instructions
.data 
# For debugging, a variable called msg
.global msg 
msg:
    .ascii "hello world\n"
# Code to reference length of string pointed to by msg 
len = . - msg
