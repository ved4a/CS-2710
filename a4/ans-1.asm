# create variables n, sum, count
# create a prompt message for user input!
.data
n: .word 0
sum: .word 0
count: .word 0
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

# initialize sum, count to 0
li $t0, 0
sw $t0, sum

li $t1, 0
sw $t1, count

# run a loop
Loop:
	bge count, n, EXIT
	add count, count, 1
	add, sum, sum, count
	
	j Loop
exit: