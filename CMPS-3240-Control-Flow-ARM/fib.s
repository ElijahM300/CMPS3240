# Elijah Morris
# CMPS 3240
# Lab 3

.text
.extern printf

.global main
main:

# int n = 5
mov	x19, #5 

# int a = 0
mov 	x20, #0

# int b = 1
mov 	x21, #1

# int temp is x22

# int i = 2
mov	x23, #2

_looptop:
# for(i = 2; i <= n; i++)
# loop test (quit)
# run: i <= n ... !(i<=n) = i > n
cmp	x23, x19
bgt	_loopquit

# temp = a + b;
add 	x22, x20, x21
# a = b;
mov 	x20, x21
# b = temp;
mov	x21, x22
# Read 'b' as the answer

# i++
add	x23, x23, #1
b	_looptop

_loopquit:
# Printf()
ldr 	x0, =string1
mov	x1, x21
bl 	printf


# Exit is 'svc' with code 93. Return 0 thru x0
mov x8, #93
mov x0, #0
svc #0

### 	STATIC VARIABLE SECTION 	###
.data
.global string1
string1:
	.ascii	"%d\n"
