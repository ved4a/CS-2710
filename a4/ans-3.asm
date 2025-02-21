.data
prompt1: .asciiz "Enter a number n (>=2): "
prompt2: .asciiz "Invalid number. Please try again.\n"
prompt3: .asciiz "The nth Fibonacci number is: "

.text
.globl main
main:
	li $a0, 4
	la $a0, prompt1
	syscall
	
	li $a0, 5
	syscall
	move $t0, $a0
	
	# base cases
	beq $t0, 0, return_zero
	beq $t0, 1, return_one
	
	# invalid input
	blt $t0, 0, invalid_input
	
	# iterative step
	li $t1, 0 # x = 0
	li $t2, 1 # y = 1
	li $t3, 1 # counter set to 1
	Loop:
		beq $t0, 1, return_fib
		add $t4, $t1, $t2 # z = x + y
		add $t1, $t2, 0 # x = y
		add $t2, $t4, 0 # y = z
		
		add $t3, $t3, 1 # increment count
		
		j Loop
	return_fib:
		
		  		