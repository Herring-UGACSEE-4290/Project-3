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
		ADD 	R9, R1, R2 
		AND 	R10, R9, R3; .: this is a comment!
		ORR 	R11, R5, R9
		SUB 	R12, R9, R7

		NOP
		NOP
		NOP
		NOP
				
		HALT
