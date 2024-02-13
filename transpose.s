.data
mat:    .word 11, 12, 13, 14
        .word 21, 22, 23, 24
        .word 31, 32, 33, 34
        .eqv matN, 3		# nombre de lignes
        .eqv matM, 4		# nombre de colonnes
        
        .eqv printint, 1
        .eqv printchar, 11
        .eqv exit, 10
        .eqv wordBytes, 4
.text
	la s0, mat
	li s1, wordBytes
	li t0, matM
	li t1, matN
	mul s2, s1, t0 # largeur d'une ligne en bytes
	mul t2, t0, t1
	mul t2, t2, s1
	add s5, s0, t2 # fin du tableau
	add s6, s0, s2 # fin première ligne
	
	mv s3, s0
loop01:

	mv s4, s3
	loop02:
		li a7, printint
		lw a0, 0(s4)
		ecall
		
		add s4, s4, s2
		
		bge s4, s5, endLoop02
		
		li, a7, printchar
		li a0, ','
		ecall
		li a0, ' '
		ecall
		j loop02
	endLoop02:
	li, a7, printchar
	li a0, '\n'
	ecall
	
	addi s3, s3, wordBytes
	
	bge s3, s6, endLoop01
	j loop01
		
endLoop01:
	li a7, exit
	ecall	