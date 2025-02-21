# create 2 prompts
.data
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
sw $v0, $t0	

# check if the inputted number is positive
Loop:
	bge $t0, 1, exit
	li $v0, 4
	la $a0, prompt3
	syscall
	
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	sw $v0, $t0
	
	j Loop
exit:

# do the same for the next number
# get second user input
li $v0, 4
la $a0, prompt2
syscall

# read value
li $v0, 5
syscall
sw $v0, $t1

Loop:
	bge $t1, 1, exit
	li $v0, 4
	la $a0, prompt3
	syscall
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	sw $v0, $t1
	
	j Loop
exit:
	# print prompt
	li $v0, 4
	la $a0, prompt4
	syscall
	# print the gcd
	li $v0, 1
	move $a0, $t0
	syscall
	