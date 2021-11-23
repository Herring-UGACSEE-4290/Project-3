
; labels do not begin with .    they end with a colon
; registers do not have bracket around them
; assembly does not need to end with a ;

start:	
		LOAD	R11, R10
		STOR	R0, R2
		MOV		R0, #0x0
		MOVT	R0, #0x0
		ADD		R6, R1, R2;
		ADDS	R6, R1, R2;
		CMP		R5, R0, #0x1
		CMP		R6, R1, R2;
		AND		R5, R0, R1; 
		ANDS	R5, R0, R1
		OR		R5, R0, R1 
		XOR		R5, R0, R1
		XORS	R5, R0, R1 
		LSL		R0, R0, #0x0
		LSR		R0, R0, #0x0 
		CLR		R0
		Set		R0 
		NOT		R0,R0 
		B	#0x20
    	B.eq	start 
    	BR  R0 
		NOP	
test:
		LOAD	R11, R10
		STOR	R0, R2
		MOV		R0, #0x0
		MOVT	R0, #0x0
		ADD		R6, R1, R2
		ADDS	R6, R1, R2
		CMP		R5, R0, #0x1
		CMP		R6, R1, R2
		AND		R5, R0, R1 
		ANDS	R5, R0, R1
		OR		R5, R0, R1 
		XOR		R5, R0, R1
		XORS	R5, R0, R1 
		LSL		R0, R0, #0x0 
		LSR		R0, R0, #0x0 
		CLR		R0
		Set		R0 
		NOT		R0,R0 
		B	#0x20
    	B.eq	start 
    	BR  R0 
		NOP
		HALT