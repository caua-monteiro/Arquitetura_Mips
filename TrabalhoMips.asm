#s7 = Tamanho do Vetor
#

.data
	Vec:
	   .align 2
	   .space 400
	endl:
	   .asciiz "\n"
	space:
	    .asciiz " "

.text 
j main
Sort:
	li $t0, 0 #Indice do Vetor
	li $t1, 0 #Var = inicio
	add $t2, $s7, $zero #Var = Fim
	subi $t2, $t2, 1
	li $t3, 0 #Var = i
	div $t4, $s7, 2
	addi $t4, $t4, 1
	#$t5 => Var = j
	FOR_i:
	
		addi $t5, $t1, 1
		FOR_MAIOR:
			bgt $t5, $t2, Fora_maior
			
			mul $t6, $t5, 4
			subi $t7, $t6, 4
			
			lw $t8, Vec($t6)
			lw $t9, Vec($t7)
			ble $t9, $t8, SemTroca01
			sw $t9, Vec($t6)
			sw $t8, Vec($t7)
			SemTroca01: 
			addi $t5, $t5, 1
				
			j FOR_MAIOR
		#////////////////////////////////////
		Fora_maior:
		subi $t5, $t2, 1
		FOR_MENOR:
			blt $t5, $t1, out_for
		
			mul $t6, $t5, 4
			addi $t7, $t6, 4
			
			lw $t8, Vec($t6)
			lw $t9, Vec($t7)
			bge $t9, $t8, SemTroca02
			
			sw $t9, Vec($t6)
			sw $t8, Vec($t7)
			
			SemTroca02: 
			subi $t5, $t5, 1
	
			j FOR_MENOR
		out_for:
		addi $t1, $t1, 1
		subi $t2, $t2, 1
		addi $t3, $t3, 1
	bne $t3, $t4, FOR_i
	
	jr $ra
fat:
	
	lw $t1, Vec($t0)
	lw $t9, Vec($t0)
	li $t2, 1
	
	beq $t1, $zero, Exit
	beq $t1, 1, Igual1
	
	Loop:
		mul $t1, $t1, $t2
		addi $t2, $t2, 1
		bne $t2, $t9, Loop
		j Exit
	Igual1:
		li $t1, 1 
	Exit:
	sw $t1, Vec($t0)
	jr $ra
main:
	addi $t0, $zero, 0
	addi $s7, $zero, 0

	leitura:

	li $v0, 5
	syscall
	sw $v0, Vec($t0)
	jal fat
	addi $t0, $t0, 4
	addi $s7, $s7, 1
	

	bne $v0, $zero, leitura

	subi $s7, $s7, 1
	
	jal Sort
	
	li $t0, 0
	li $t9, 0
	
	Escrita:
	
	li $v0, 1
	lw $a0, Vec($t0) 
	syscall
	li $v0, 4
	la $a0, space
	syscall
	beq $s7, 1, fim
	addi $t9, $t9, 1
	addi $t0, $t0, 4
	
	bne $t9, $s7, Escrita
	
	fim:
	li $v0, 10
	syscall
