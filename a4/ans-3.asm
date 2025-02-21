.data
n: .word 0
prompt1: .asciiz "Enter a number n: "
prompt2: .asciiz "Please enter a positive number.\n"
prompt3: .asciiz "The nth Fibonacci number is: "

.text
.globl main
main:
li $v0, 4
la $a0, prompt1
syscall

li $v0, 5
syscall
sw $v0, n
lw $t0, n

PositiveCheck:
	# if n >= 2, start recursive step
	bge $t0, 2, recurse

	# < 1 so prompt again
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	sw $v0, n
	lw $t0, n
	
	j PositiveCheck
recurse:
	lw $a0, n
	jal fibonacci # separate fun.
	move $t1, $v0
	
	# print result
	li $v0, 4
	la $a0, prompt3
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	# exit
	li $v0, 10
	syscall
	
