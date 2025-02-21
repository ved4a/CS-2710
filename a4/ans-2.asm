# create 2 prompts
.data
x: .word 0
y: .word 0
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
prompt3: .asciiz "Please enter a positive number.\n"
prompt4: .asciiz "The GCD is: "

.text
.globl main
main:
# get first user input
li $v0, 4
la $a0, prompt1
syscall

# read value
li $v0, 5
syscall
sw $v0, x
lw $t0, x	

# check if the inputted number is positive
Loop1:
	bge $t0, 1, exit1
	li $v0, 4
	la $a0, prompt3
	syscall
	
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	sw $v0, x
	lw $t0, x
	
	j Loop1
exit1:

# do the same for the next number
# get second user input
li $v0, 4
la $a0, prompt2
syscall

# read value
li $v0, 5
syscall
sw $v0, y
lw $t1, y

Loop2:
	bge $t1, 1, exit2
	li $v0, 4
	la $a0, prompt3
	syscall
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	sw $v0, y
	lw $t1, y
	
	j Loop2
exit2:

# gcd calculation
Loop3:
	# if x,y are equal just return x
	beq $t0, $t1, exit3
	# if x < y, let y = y -x
	blt $t0, $t1, if
	# if x > y, let x = x - y
	sub $t0, $t0, $t1
	
	j Loop3
if:
	sub $t1, $t1, $t0
	j Loop3
exit3:
	# print prompt
	li $v0, 4
	la $a0, prompt4
	syscall
	# print the gcd
	li $v0, 1
	move $a0, $t0
	syscall
	
	# end of program
	li $v0, 10
	syscall
	