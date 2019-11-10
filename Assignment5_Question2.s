.global main
.data
STRING: .ascii "11010010"
NUMBER: .byte 0x00
ERROR:  .byte 0xFF
.text

main: 
	LDR R1,=STRING
	LDR R2,=NUMBER
	LDR R3,=ERROR
	EOR R4,R4,R4
	EOR R0,R0,R0
	MOV R5,#'0'
	MOV R6,#'8'
	
	//ITERATE FOR 8 BITS
	ITERATE:
	    //Do shift to left by 1 bit
		LSL R4,R4,#1
		ADD R0,R0,#1
		LDRB R7,[R1],#1
		CMP R7,#'1'
			BGT END
		SUB R7,R7,R5
		ORR R4,R7
		CMP R0,#8
			BNE ITERATE		
		EOR R0,R0,R0
		
		//STORE THE OUTPT
		STRB R0,[R3]
		STRB R4,[R2]
	END:
