; None of these should work

.start:
	THISISNTSUPPOSEDTOWORK
	
	; Load/Store Instructions -------------------------------
	LOAD
	LOAD	ASDF
	LOAD	R0
	LOAD	R0; R1
	LOAD	R0 R1
	LOAD	R0, R1, R2
	LOAD	R0, 0xFF
	LOAD	V0, V1

	STOR
	STOR	ASDF
	STOR	R0
	STOR	R0; R1
	STOR	R0 R1
	STOR	R0, R1, R2
	STOR	R0, 0xFF
	STOR	V0, V1
	;--------------------------------------------------------

	; Data Immediate Instructions ---------------------------
	MOV
	MOV		ASDF
	MOV		R0
	MOV		R0 0xFF
	MOV		R0, R1
	MOV		0xFF, R0
	MOV		R0, 0xFF, 0xDD
	MOV		V0, 0xFF

	MOVT
	MOVT	ASDF
	MOVT	R0
	MOVT	R0 0xFF
	MOVT	R0, R1
	MOVT	0xFF, R0
	MOVT	R0, 0xFF, 0xDD
	MOVT	V0, 0xFF

	ADD
	ADD		ASDF
	ADD		R0
	ADD		R0, R0
	ADD		R0, 0xFF
	ADD		R0, R0, 0xFFFFF
	ADD		R0 R0 0xFF
	ADD		R0, 0xFF, R0
	ADD		R0, R0, 0xFF, 0xDD
	ADD		V0, R0, 0xFF

	ADDS
	ADDS	ASDF
	ADDS	R0
	ADDS	R0, R0
	ADDS	R0, 0xFF
	ADDS	R0, R0, 0xFFFFE
	ADDS	R0 R0 0xFF
	ADDS	R0, 0xFF, R0
	ADDS	R0, R0, 0xFF, 0xDD
	ADDS	V0, R0, 0xFF

	SUB
	SUB		ASDF
	SUB		R0
	SUB		R0, R0
	SUB		R0, 0xFF
	SUB		R0, R0, 0xFFFFD
	SUB		R0 R0 0xFF
	SUB		R0, 0xFF, R0
	SUB		R0, R0, 0xFF, 0xDD
	SUB		V0, R0, 0xFF

	CMP
	CMP		ASDF
	CMP		R0
	CMP		R0, R0
	CMP		R0, 0xFF
	CMP		R0, R0, 0xFFFFC
	CMP		R0 R0 0xFF
	CMP		R0, 0xFF, R0
	CMP		R0, 0xFF, 0xDD
	CMP		R0, R0, 0xFF, 0xDD
	CMP		V0, R0, 0xFF

	AND
	AND		ASDF
	AND		R0
	AND		R0, R0
	AND		R0, 0xFF
	AND		R0, R0, 0xFFFFB
	AND		R0 R0 0xFF
	AND		R0, 0xFF, R0
	AND		R0, 0xFF, 0xDD
	AND		R0, R0, 0xFF, 0xDD
	AND		V0, R0, 0xFF
	
	ANDS
	ANDS	ASDF
	ANDS	R0
	ANDS	R0, R0
	ANDS	R0, 0xFF
	ANDS	R0, R0, 0xFFFFA
	ANDS	R0 R0 0xFF
	ANDS	R0, 0xFF, R0
	ANDS	R0, 0xFF, 0xDD
	ANDS	R0, R0, 0xFF, 0xDD
	ANDS	V0, R0, 0xFF

	OR
	OR		ASDF
	OR		R0
	OR		R0, R0
	OR		R0, 0xFF
	OR		R0, R0, 0xFFFEF
	OR		R0 R0 0xFF
	OR		R0, 0xFF, R0
	OR		R0, 0xFF, 0xDD
	OR		R0, R0, 0xFF, 0xDD
	OR		V0, R0, 0xFF

	ORS
	ORS		ASDF
	ORS		R0
	ORS		R0, R0
	ORS		R0, 0xFF
	ORS		R0, R0, 0xFFFEE
	ORS		R0 R0 0xFF
	ORS		R0, 0xFF, R0
	ORS		R0, 0xFF, 0xDD
	ORS		R0, R0, 0xFF, 0xDD
	ORS		V0, R0, 0xFF

	XOR
	XOR		ASDF
	XOR		R0
	XOR		R0, R0
	XOR		R0, 0xFF
	XOR		R0, R0, 0xFFFED
	XOR		R0 R0 0xFF
	XOR		R0, 0xFF, R0
	XOR		R0, 0xFF, 0xDD
	XOR		R0, R0, 0xFF, 0xDD
	XOR		V0, R0, 0xFF

	XORS
	XORS	ASDF
	XORS	R0
	XORS	R0, R0
	XORS	R0, 0xFF
	XORS	R0, R0, 0xFFFEC
	XORS	R0 R0 0xFF
	XORS	R0, 0xFF, R0
	XORS	R0, 0xFF, 0xDD
	XORS	R0, R0, 0xFF, 0xDD
	XORS	V0, R0, 0xFF

	LSL
	LSL		ASDF
	LSL		R0
	LSL		R0, R0
	LSL		R0, 3
	LSL		R0, R0, 0xFFFEB
	LSL		R0 R0 3
	LSL		R0, 3, R0
	LSL		R0, R0, 3, 5
	LSL		V0, R0, 3

	LSR
	LSR		ASDF
	LSR		R0
	LSR		R0, R0
	LSR		R0, 3
	LSR		R0, R0, 0xFFFEB
	LSR		R0 R0 3
	LSR		R0, 3, R0
	LSR		R0, R0, 3, 5
	LSR		V0, R0, 3

	CLR
	CLR		ASDF
	CLR		R0, R0
	CLR		R0, 0xFF
	CLR		0xFF

	SET
	SET		ASDF
	SET		R0, R0
	CLR		R0, 0xFF
	CLR		0xFF
	;--------------------------------------------------------

	; Data Register Instructions ----------------------------
	ADD

	ADDS

	SUB

	CMP

	AND

	ANDS

	OR

	ORS

	XOR

	XORS

	NOT
	;--------------------------------------------------------

	; System/Branch Instructions ----------------------------
	B

	B.cond

	BR

	NOP

	HALT
	;--------------------------------------------------------

	HALT