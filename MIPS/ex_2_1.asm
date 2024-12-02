.data
posi: .asciiz " valor(es) positivo(s)\n"
negat: .asciiz " valor(es) negativo(s)\n"
par: .asciiz " valor(es) par(es)\n"
impar: .asciiz " valor(es) impar(es)\n"

.text
    .globl main
main:
    li $t0, 0
    li $t1, 5
    li $t5, 0
    li $t6, 0
    li $t7, 0
    li $t8, 0
    li $t9, 0
loop:
    beq $t0, $t1, end_loop
    
    li $v0, 5
    syscall
    move $t8, $v0
    
    bgt $t8, $zero, count_positive
    blt $t8, $zero, count_negative

    andi $t2, $t8, 1
    beq $t2, $zero, count_even
    j count_odd

    addi $t0, $t0, 1
    j loop

count_positive:
    addi $t9, $t9, 1
    andi $t2, $t8, 1
    beq $t2, $zero, count_even_positive
    j count_odd_positive

count_negative:
    addi $t7, $t7, 1
    andi $t2, $t8, 1
    beq $t2, $zero, count_even_negative
    j count_odd_negative

count_even_positive:
    addi $t6, $t6, 1
    addi $t0, $t0, 1
    j loop

count_odd_positive:
    addi $t5, $t5, 1
    addi $t0, $t0, 1
    j loop

count_even_negative:
    addi $t6, $t6, 1
    addi $t0, $t0, 1
    j loop

count_odd_negative:
    addi $t5, $t5, 1
    addi $t0, $t0, 1
    j loop

count_even:
    addi $t6, $t6, 1
    addi $t0, $t0, 1
    j loop

count_odd:
    addi $t5, $t5, 1
    addi $t0, $t0, 1
    j loop

end_loop:

    move $a0, $t6
    li $v0, 1
    syscall

    la $a0, par
    li $v0, 4
    syscall

    move $a0, $t5
    li $v0, 1
    syscall

    la $a0, impar
    li $v0, 4
    syscall

    move $a0, $t9
    li $v0, 1
    syscall

    la $a0, posi
    li $v0, 4
    syscall

    move $a0, $t7
    li $v0, 1
    syscall

    la $a0, negat
    li $v0, 4
    syscall

    li $v0, 10
    syscall