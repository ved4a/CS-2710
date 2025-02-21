.data
prompt1: .asciiz "Enter a number n (>=2): "
prompt2: .asciiz "Invalid input. Please enter an integer >= 2.\n"
prompt3: .asciiz "The nth Fibonacci number is: "

.text
.globl main
main:
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	