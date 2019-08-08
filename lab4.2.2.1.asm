lab 4_1
	.data
fibs: .word 0 : 12
size: .word 12
	.text
	.globl main
main:
	la $t0, fibs
	la $t5, size
	lw $t5, 0($t5)
	li $t2, 1
	add.d $f0, $f2, $f4
	sw $t2, 0($t0)
	sw $t2, 4($t0)
	addi $t1, $t5, -2
loop:	lw $t3, 0($t0)
	lw $t4, 4($t0)
	add $t2, $t3, $t4
	sw $t2, 8($t0)
	addi $t0, $t0, 4
	addi $t1, $t1, -1
	bgtz $t1, loop
	la $a0, fibs
	add $a1, $zero, $t5
	j print
	li $v0, 10
	syscall

.data
space: .asciiz " "
head:  .asciiz "Fibonacci numbers are: \n"
	.text

print:	add $t0, $zero, $a0
	add $t1, $zero, $a1
	la $a0, head
	li $v0, 4
	syscall
out:	lw $a0, 0($t0)
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	addi $t0, $t0, 4
	addi $t1, $t1, -1
	bgtz $t1, out
	jr $ra



LAB 4_2

	 .text
	 .globl main
main:
	la  $a0, array
	addi $a1,$0,0
	addi $sp,$sp,-4
	sw $ra,0($sp)
	jal swap
	lw $ra,0($sp)
	addi $sp,$sp,-4
	jr $ra
swap:	add $t1,$a1,$a1
	add $t1,$t1,$t1
	add $t1,$a0,$t1
	lw $t0, 0($t1)
	lw $t2, 4(t1)
	sw $t2, 0(t1)
	sw $t0, 4(t1)
	jr $ra

	.data
array	.word 5 , 4, 3, 2, 1




LAB 4_3


.data
prompt1: .asciiz "Enter the sequence index\n"
prompt2: .asciiz "The Fibonacci value is:\n"
.text
li $v0, 4
la $a0, prompt1
syscall
li $v0, 5
syscall
move $a0, $v0
jal fibonacci
move $a1, $v0 
li $v0, 4
la $a0, prompt2
syscall
li $v0, 1
move $a0, $a1
syscall
li $v0, 10
syscall
fibonacci:
addi $sp, $sp, -12
sw $ra, 8($sp)
sw $s0, 4($sp)
sw $s1, 0($sp)
move $s0, $a0
li $v0, 1 
ble $s0, 0x2, fibonacciExit # check terminal condition
addi $a0, $s0, -1 
jal fibonacci
move $s1, $v0 # store result of f(n-1) to s1
addi $a0, $s0, -2 # set args for recursive call to f(n-2)
jal fibonacci
add $v0, $s1, $v0 # add result of f(n-1) to it
fibonacciExit:
lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12
notejr $ra


LAB 4_4


	.data
n:	.word 7
	
	.text
 	.globl main
main:	li $t0,1
	li $t1,1
	lw $t2,n
	beq $t2,1,ap
	beq $t2,2,bp
	addiu $t3,$t2,-1
loop:	add $t4,$t0,$t1
	move $t0,$t1
	move $t1,$t4
	addiu $t3,$t3,-1
	beq $t3,1,Exit
	j loop
ap:	move $a0,$t0
	j Exit
bp:	move $a0,$t1
Exit:	move $a0,$t4
	li $v0,1
	syscall
	jr $ra














