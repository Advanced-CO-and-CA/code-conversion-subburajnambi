@ BSS section
.bss
.data
A_DIGIT: .byte 0x43
H_DIGIT: .byte 0
.text
.globl main

main:

	//LOAD INPUT
	
	LDR R0,=A_DIGIT
	
	LDRB R0,[R0]
	
	MOV R1,#-0x41+0xA+'0'
	
	//Assume that A_DIGIT contains the ASCII representation of a hexadecimal digit (i.e., 7 bits with MSB=0)
	
	AND R0,R0,#0x7F	
	
	SUB R0,#'0'
	
	CMP R0,#0x0A
	
	BLT UPDATE_OUTPUT	
	
	ADD R0,R1

	UPDATE_OUTPUT:
	
	 LDR R2,=H_DIGIT
	 
	 STRB R0,[R2]