.text
    .globl main
main:
    li $t0, 0
    li $t1, 6
    li $t7, 0
 
loop:
    beq $t0, $t1, end_loop
    li $v0, 6
    syscall
    mov.s $f2, $f0
    addi $t0, $t0, 1
    li.s $f0, 0.0
    c.le.s $f0, $f2
    bc1t count
 
    j loop
 
count:
    addi $t7, $t7, 1
    j loop
 
end_loop:
 
    move $a0, $t7          
    li $v0, 1              
    syscall 
 
    la $a0, msg            
    li $v0, 4              
    syscall                
 
    
 
    li $v0, 10
    syscall
 
.data
msg: .asciiz " valores positivos"