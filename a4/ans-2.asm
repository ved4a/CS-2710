# create 2 prompts
.data
prompt1: .asciiz "Enter the first number: "
prompt2: .asciiz "Enter the second number: "
prompt3: .asciiz "Please enter a positive number.\n"

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
	