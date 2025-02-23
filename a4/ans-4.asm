.data
prompt: .asciiz "Enter an integer: "
error_prompt: .asciiz "Integer out of 32-bit range.\n"
hex_prefix: .asciiz "0x"
hex_digits: .asciiz "0123456789ABCDEF"
newline: "\n"

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
	
	invalid_input:
		li $v0, 4
		la $a0, error_prompt
		syscall
		
		j main
	
	
	