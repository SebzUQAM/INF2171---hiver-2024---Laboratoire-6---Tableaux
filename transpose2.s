        .data
l1:     .word 11, 12, 13, 14
l2:     .word 21, 22, 23, 24
l3:     .word 31, 32, 33, 34
mat:    .dword l1, l2, l3
        .eqv matN, 3		# nombre de lignes
        .eqv matM, 4		# nombre de colonnes
        
        .eqv printint, 1
        .eqv printchar, 11
        .eqv exit, 10
        .eqv wordBytes, 4
        .eqv dwordBytes, 8
.text
	la s0, mat
	li t0, matN
	li t1, matM
	li t2, dwordBytes
	li t3, wordBytes
	mul t4, t0, t2
	add s1, s0, t4 # fin de nat
	mul s2, t1, t3 # longeur en bytes d'une ligne
	
	li s3, 0
loop01:
	mv s4, s0
	loop02:
		ld s5, 0(s4)
		add s5, s5, s3
		
		li a7, printint
		lw a0, 0(s5)
		ecall
		
		addi s4, s4, dwordBytes
		
		bge s4, s1, endLoop02
		
		li a7, printchar
		li a0, ','
		ecall
		
		li a7, printchar
		li a0, ' '
		ecall
		
		j loop02
	endLoop02:
	li a7, printchar
	li a0, '\n'
	ecall
	
	addi s3, s3, wordBytes
	
	bge s3, s2, endLoop01
	j loop01
endLoop01:
	li a7, exit
	ecall	
