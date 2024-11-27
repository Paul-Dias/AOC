.text
    .globl	main
main:
    li $v0, 5
    syscall
    move $t0, $v0
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    li $v0, 5
    syscall
    move $t2, $v0

    bgt $t0, $t1, t0_maior
    bgt $t1, $t2, t1_maior
    bgt $t2, $t1, t2_maior

    t0_maior:
        bgt $t0, $t2, print_t0
    
    t1_maior:
        bgt $t1, $t0, print_t1
       
    t2_maior:
        bgt $t2, $t0, print_t2  
    
    print_t0:
        la $a0, msg
        li $v0, 4
        syscall
        move $a0, $t0
        li $v0, 1
        syscall
        j end

    print_t1:
        la $a0, msg
        li $v0, 4
        syscall

        move $a0, $t1
        li $v0, 1
        syscall
        j end

    print_t2:
        la $a0, msg
        li $v0, 4
        syscall
        move $a0, $t2
        li $v0, 1
        syscall
        j end

    end:
        li $v0, 10
        syscall 

.data
msg:	.asciiz	"Maior: "

   