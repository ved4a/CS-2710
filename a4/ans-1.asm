# create variables n, sum, count
# create a prompt message for user input!
.data
n: .word 0
count: .word 0
sum: .word 0
prompt: .asciiz "Enter a number: "

.text
.globl main
main:
# print prompt
li $v0, 4
la $a0, prompt
syscall

# read integer and store in 'n'
li $v0, 5
syscall
sw $v0, n

# initialize count, sum to 0
li $t0, 0
li $t1, 0

# load 'n' into a register
lw $t2, n

# run a loop
Loop:
	bge $t0, $t2, exit
	addi $t0, $t0, 1
	add, $t1, $t1, $t0
	
	j Loop
exit:
	# store sum back in memory
	sw $t1, sum
	
	# print sum
	li $v0, 1
	move $a0, $t1
	syscall

# indicate end of program
li $v0, 10
syscall