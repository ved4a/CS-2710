.data
prompt1: .asciiz "Enter a number n (>=2): "
prompt2: .asciiz "Invalid number. Please try again.\n"
prompt3: .asciiz "The nth Fibonacci number is: "

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $a0 # n -> $t0

    # check validity
    blt $t0, 2, invalid_input

    # base cases
    beq $t0, 0, return_zero
    beq $t0, 1, return_one

    li $t1, 0  # x = 0
    li $t2, 1  # y = 1
    li $t3, 1  # counter = 1

Loop:
    beq $t3, $t0, return_fib

    add $t4, $t1, $t2 # z = x + y
    move $t1, $t2 # x = y
    move $t2, $t4 # y = z

    addi $t3, $t3, 1 # counter++
    j Loop

return_fib:
    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 1
    move $a0, $t2 # y is the fib #
    syscall

    # exit
    li $v0, 10
    syscall

return_zero:
    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 1
    li $a0, 0
    syscall

    li $v0, 10
    syscall

return_one:
    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 1
    li $a0, 1
    syscall

    li $v0, 10
    syscall

invalid_input:
    li $v0, 4
    la $a0, prompt2
    syscall

    j main
