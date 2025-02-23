.data
initial_prompt: .asciiz "Enter a number n >= 2 : "
incorrect_input_prompt: .asciiz "Please enter a number >= 2.\n"
result_prompt: .asciiz "The nth Fibonacci number is "

.text
.globl main
main:
	# ask prompt
	li $v0, 4
	la $a0, initial_prompt
	syscall
	
	# get user input
	li $v0, 5
	syscall
	lw $t0, $v0 # store n in $t0
	
	# check if n < 2
	blt $t0, 2, invalid_input
	
	# set variables x, y
	li $t1, 0 # x = 0
	li $t2, 1 # y = 1

invalid_input:
	li $v0, 4
	la $a0, incorrect_input_prompt
	syscall
	
	j main	