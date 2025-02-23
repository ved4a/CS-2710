.data
prompt: .asciiz "Enter an integer: "
error_prompt: .asciiz "Integer out of 32-bit range.\n"
hex_prefix: .asciiz "0x"
hex_digits: .asciiz "0123456789ABCDEF"
newline: .asciiz "\n"

.text
.globl main
main:
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# load min, max values in registers
	li $t1, -2147483648
	li $t2, 2147483647
	
	# check bounds
	blt $t0, $t1, invalid_input
	bgt $t0, $t2, invalid_input
	
	# print the prefix
	li $v0, 4
	la $a0, hex_prefix
	syscall
	
	# convert integer to hexa
	li $t1, 28 # shift, starting from first 4-bit chunk
	
	hex_loop:
		# isolate chunk by shifting by $t1 bits
		srl $t2, $t0, $t1
		andi $t2, $t2, 0xF # mask
		
		# convert to ASCII: index and load
		la $t3, hex_digits
		add $t2, $t2, $t3
		lbu $a0, 0($t2)
		
		# print
		li $v0, 11
		syscall
		
		# shift to next
		subi $t1, $t1, 4
		bgez $t1, hex_loop
		
		# print a new line
		li $v0, 4
		la $a0, newline
		syscall
		
		# exit program
		li $v0, 10
		syscall		
	
	invalid_input:
		li $v0, 4
		la $a0, error_prompt
		syscall
		
		j main
	
	
	