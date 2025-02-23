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
	move $t0, $v0 # store n in $t0
	
	# check if n < 2
	blt $t0, 2, invalid_input
	
	# set variables x, y, counter
	li $t1, 0 # x = 0
	li $t2, 1 # y = 1
	li $t3, 1 # counter = 0
	
	check_n:
		# check if counter < n	
		blt $t3, $t0, fib_loop
	
		# return y
		li $v0, 4
		la $a0, result_prompt
		syscall
	
		li $v0, 1
		move $a0, $t2
		syscall
	
		# end program
		li $v0, 10
		syscall
	
	fib_loop:
		add $t4, $t1, $t2 # set z = x + y
		move $t1, $t2 # x = y
		move $t2, $t4 # y = z
		
		addi $t3, $t3, 1
		
		j check_n		

	invalid_input:
		li $v0, 4
		la $a0, incorrect_input_prompt
		syscall
		
		j main	