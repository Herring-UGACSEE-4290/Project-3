
;#labels do not begin with .    they end with a colon
;#registers do not have bracket around them
;#assembly does not need to end with a ;

start:	
		LOAD	R11, R10
		STOR	R0, R2
		MOV		R0, #0x0;
		MOVT	R0, #0x0;
		ADD		R6, R1, R2;
		ADDS	R6, R1, R2; missing
		CMP		R5, R0, #0x1;
		CMP		R6, R1, R2;
		AND		R5, R0; missing
		ANDS	R5, R0;
		OR		R5, R0; missing
		XOR		R5, R0;
		XORS	R5, R0; missing
		LSL		R0, #0x0; missing
		LSR		R0, #0x0; missing
		CLR		R0;
		Set		R0, #0x0; missing
		NOT		R0; missing
		B	#0x20;
    	B.eq	Label, #0x20; missing
    	BR  R0; missing
		NOP;	
test:
		LOAD	R11, R10 ; 
		STOR	R0, R2 ; 
		MOV		R0, #0x0;
		MOVT	R0, #0x0;
		ADD		R6, R1, R2;
		ADDS	R6, R1, R2; missing
		CMP		R5, R0, #0x1;
		CMP		R6, R1, R2;
		AND		R5, R0; missing
		ANDS	R5, R0;
		OR		R5, R0; missing
		XOR		R5, R0;
		XORS	R5, R0; missing
		LSL		R0, #0x0; missing
		LSR		R0, #0x0; missing
		CLR		R0;
		Set		R0, #0x0; missing
		NOT		R0; missing
		B	#0x20;
    	B.eq	Label, #0x20; missing
    	BR  R0; missing
		NOP;
		HALT;