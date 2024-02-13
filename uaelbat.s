.data
tab:	.word 10, 10, -6, 20, 1, 1, 8, 800, -800, -2
	.eqv length, 10

	.eqv printInt, 1
	.eqv printChar, 11
	.eqv exit, 10
	.eqv wordBytes, 4

.text
	la s0, tab
	li t0, length
	li s2, wordBytes
	mul s1, t0, s2
	add s1, s0, s1
	
loop:
	sub s1, s1, s2
	
	blt s1, s0, end
	
	li a7, printInt
	lw a0, 0(s1)
	ecall
	
	li a7, printChar
	li a0, ' '
	ecall
	
	j loop
	
end:
	
	li a7, exit
	ecall