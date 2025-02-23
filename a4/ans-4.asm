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
	
	