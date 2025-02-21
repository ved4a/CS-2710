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