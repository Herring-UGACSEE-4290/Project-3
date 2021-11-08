start:	
		MOV	R0, #0x0
		MOV	R1, #0xe
		MOV	R2, #0xd; "hello this is a comment!!"
		MOV	R3, #0xc
		MOV	R4, #0xb
		
		ADD		R5, R0, #0x1
		ADD		R6, R1, R2
		SUBS	R7, R0, R1
		B.AL    start
		
test:
		ADD 	R7, R1, R2 
		AND 	R6, R7, R3; .: this is a comment!
		ORR 	R5, R5, R6
		SUB 	R4, R6, R7

		NOP
		NOP
		NOP
		NOP
				
		HALT
