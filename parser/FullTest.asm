
#Label:s do not begin with .    they end with a colon
#registers do not have bracket around them
#assembly does not need to end with a ;

start:	
Label:
    	LOAD	R11, R10
		LOAD	R11, R10
		LOAD	R11, R10
		LOAD	R3, R2, #0x20

Label:
    	STOR	R0, R2
		STOR	R0, R2
		STOR	R0, R2 "hello this is a comment!!"
		STOR    R1, R2, #0x20

Label:
    	MOV		R0, #0x0;
		MOV		R0, #0x0;
		MOV		R2, #0xd; "hello this is a comment!!"
		MOV		R3, #0xc;
		MOV		R4, #0xb;

Label:	
        MOVT	R0, #0x0;
		MOVT	R0, #0x0;
		MOVT	R2, #0xd; "hello this is a comment!!"
		MOVT	R3, #0xc;
		MOVT	R4, #0xb;

Label:	
        ADD		R5, R0, #0x1;
		ADD		R6, R1, R2;
		ADD		R6, R1, R2; "hello this is a comment!!"

Label:	
        ADDS	R5, R0, #0x1;
		ADDS	R6, R1, R2;
		ADDS	R6, R1, R2; "hello this is a comment!!"
		
Label:	
        SUBS	R5, R0, #0x1;
		SUBS	R5, R0, #0x1;
		SUBS	R6, R1, R2;
		SUBS	R6, R1, R2; "hello this is a comment!!"

Label:	
        CMP		R5, R0, #0x1;
		CMP		R5, R0, #0x1;
		CMP		R6, R1, R2;
		CMP		R6, R1, R2; "hello this is a comment!!"

Label:	
        AND		R5, R0;
		AND		R5, R0;
		AND		R5, R0;	"hello this is a comment!!"

Label:	
        ANDS	R5, R0;
		ANDS	R5, R0;
		ANDS	R5, R0;	"hello this is a comment!!"

Label:	
        OR		R5, R0;
		OR		R5, R0;
		OR		R5, R0;	"hello this is a comment!!"

Label:	
        XOR		R5, R0;
		XOR		R5, R0;
		XOR		R5, R0;	"hello this is a comment!!"

Label:	
        XORS	R5, R0;
		XORS	R5, R0;
		XORS	R5, R0;	"hello this is a comment!!"

Label:	
        LSL		R0, #0x0;
		LSL		R0, #0x0;
		LSL		R0, #0x0; "hello this is a comment!!"

Label:	
        LSR		R0, #0x0;
		LSR		R0, #0x0;
		LSR		R0, #0x0; "hello this is a comment!!"

Label:	
        CLR		R0;
		CLR		R0;
		CLR		R0; "hello this is a comment!!"

Label:	
        Set		R0, #0x0;
		Set		R0, #0x0;
		Set		R0, #0x0; "hello this is a comment!!"

Label:	
        NOT		R0;
		NOT		R0;
		NOT		R0; "hello this is a comment!!"

Label:	
        B	#0x20;
		B	#0x20;
		B	#0x20; "hello this is a comment!!"

Label:	
        B.eq	Label:, #0x20;
		B.eq	#0x20;
		B.eq	#0x20; "hello this is a comment!!"

Label:	
        BR		R0;
		BR		R0;
		BR		R0; "hello this is a comment!!"

Label:	
        NOP;
		NOP;
		NOP; "hello this is a comment!!"

Label:	
        HALT;
		HALT;
		HALT; "hello this is a comment!!"






		
test:
Label:	
        LOAD	R11, [R10]
		LOAD	R11, [R10]
		LOAD	R11, [R10]
		LOAD	R3, [R2, #0x20]

Label:	
        STOR	R0, [R2]
		STOR	R0, [R2]
		STOR	R0, [R2] "hello this is a comment!!"
		STOR    R1, [R2, #0x20]

Label:	
        MOV		R0, #0x0;
		MOV		R0, #0x0;
		MOV		R2, #0xd; "hello this is a comment!!"
		MOV		R3, #0xc;
		MOV		R4, #0xb;

Label:	
        MOVT	R0, #0x0;
		MOVT	R0, #0x0;
		MOVT	R2, #0xd; "hello this is a comment!!"
		MOVT	R3, #0xc;
		MOVT	R4, #0xb;

Label:	
        ADD		R5, R0, #0x1;
		ADD		R6, R1, R2;
		ADD		R6, R1, R2; "hello this is a comment!!"

Label:	
        ADDS	R5, R0, #0x1;
		ADDS	R6, R1, R2;
		ADDS	R6, R1, R2; "hello this is a comment!!"
		
Label:	
        SUBS	R5, R0, #0x1;
		SUBS	R5, R0, #0x1;
		SUBS	R6, R1, R2;
		SUBS	R6, R1, R2; "hello this is a comment!!"

Label:	
        CMP		R5, R0, #0x1;
		CMP		R5, R0, #0x1;
		CMP		R6, R1, R2;
		CMP		R6, R1, R2; "hello this is a comment!!"

Label:	
        AND		R5, R0;
		AND		R5, R0;
		AND		R5, R0;	"hello this is a comment!!"

Label:	
        ANDS	R5, R0;
		ANDS	R5, R0;
		ANDS	R5, R0;	"hello this is a comment!!"

Label:	
        OR		R5, R0;
		OR		R5, R0;
		OR		R5, R0;	"hello this is a comment!!"

Label:	
        XOR		R5, R0;
		XOR		R5, R0;
		XOR		R5, R0;	"hello this is a comment!!"

Label:	
        XORS	R5, R0;
		XORS	R5, R0;
		XORS	R5, R0;	"hello this is a comment!!"

Label:	
        LSL		R0, #0x0;
		LSL		R0, #0x0;
		LSL		R0, #0x0; "hello this is a comment!!"

Label:	
        LSR		R0, #0x0;
		LSR		R0, #0x0;
		LSR		R0, #0x0; "hello this is a comment!!"

Label:	
        CLR		R0;
		CLR		R0;
		CLR		R0; "hello this is a comment!!"

Label:	
        Set		R0, #0x0;
		Set		R0, #0x0;
		Set		R0, #0x0; "hello this is a comment!!"

Label:	
        NOT		R0;
		NOT		R0;
		NOT		R0; "hello this is a comment!!"

Label:	
        B	#0x20;
		B	#0x20;
		B	#0x20; "hello this is a comment!!"

Label:	
        B.eq	Label:, #0x20;
		B.eq	#0x20;
		B.eq	#0x20; "hello this is a comment!!"

Label:	
        BR		R0;
		BR		R0;
		BR		R0; "hello this is a comment!!"

Label:	
        NOP;
		NOP;
		NOP; "hello this is a comment!!"

Label:	
        HALT;
		HALT;
		HALT; "hello this is a comment!!"