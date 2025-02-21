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

fibonacci:
	# base case(s)_ fib(2) = fib(3) = 1
	beq $a0, 2, base_case
	beq $a0, 3, base_case
	
	# push the return addy and $a0 to stack
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	
	# compute fib(n-1)
	addi $a0, $a0, -1
	jal fibonacci
	move $t1, $v0 # for storage
	
	# compute fib(n-2)
	lw $a0, $0($sp) # restore original n
	addi $a0, $a0, -2
	jal fibonacci
	move $t2, $v0 # for storage
	
	# final
	add $v0, $t1, $t2
	
	# restore $ra
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra

base_case:
	li $v0, 1
	jr $ra