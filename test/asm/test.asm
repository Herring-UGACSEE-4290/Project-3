.start	
		MOVZ	X0, #0x0
		MOVZ	X1, #0xe
		MOVZ	X2, #0xd; "hello this is a comment!!"
		MOVZ	X3, #0xc
		MOVZ	X4, #0xb
		
		ADD		X5, X0, #0x1
		ADD		X6, X1, X2
		SUBS	X7, X0, X1
		B.AL    start
		
test:
		ADD 	X9, X1, X2 
		AND 	X10, X9, X3; .: this is a comment!
		ORR 	X11, X5, X9
		SUB 	X12, X9, X7

		NOP
		NOP
		NOP
		NOP
				
		YIELD