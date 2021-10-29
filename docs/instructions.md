# Instructions

This document details the encoding for each instruction in the instruction set. Instructions are organized by type, and the encodings/operands of each instruction are labelled with the following:

- [dest reg] - Encoding for the 'target' register of an instruction, or the final destination register of whatever data is being operated on.
- [pntr reg] - Encoding for the 'pointer' register of an instruction, or the address of memory to be written to/read from.
- [shft reg] - Encoding for the 'shift' register of an instruction, or the register to shift in LSL/LSR operations.
- [op 1/2 reg] - Encoding for the 'Operand' register(s) of an instruction, or the registers used in an arithmetic operation.
- [cond flags] - Encoding for the 'Condition Flags' of a conditional instruction. These define the conditions at which an instruction is executed (a branch is taken on the case of conditional branch). A list of conditions and their encoding can be found [here](https://developer.arm.com/documentation/den0024/a/The-A64-instruction-set/Data-processing-instructions/Conditional-instructions?lang=en).
- [immediate] - A 16-bit unsigned immediate value to be used as an operand in the instruction.
- [offset] - A 16-bit signed immediate value denoting the offset in Register Offset addressing.

## Load/Store Instructions

Instructions which operate with addresses to access (load to and store from) memory. These instructions use Register Offset addressing.

### LOAD

Loads the value from memory at location of the address in the pointer register (+/- offset) into the target register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   0   x   x   x   x   0  [dest reg]  [pntr reg]   x   x   x  [-------------------- offset ----------------------]
```

### STOR

Stores the value of the target register to the location in memory of the address in the pointer register (+/- offset).

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
1    0   x   x   x   x   1  [dest reg]  [pntr reg]   x   x   x  [-------------------- offset ----------------------]
```

## Data Immediate Instructions

Instructions which operate on/with data directly, using an immediate value for at least one operand and register values for other operands.

### MOV

Moves a 16 bit immediate value into the lower 2 bytes of a target register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   0   0   0  [dest reg]   x   x   x   x   x   x  [------------------- immediate --------------------]
```

### MOVT

Moves a 16 bit immediate value into the upper 2 bytes of a target register

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   0   0   1  [dest reg]   x   x   x   x   x   x  [------------------- immediate --------------------]
```

### ADD (IMM)

 Adds the values of the operand register and immediate value and stores this to the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   0   0   0   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### ADDS (IMM) --- SETS FLAGS

Adds the values of the operand register and immediate value and stores this to the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   1   0   0   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### SUB (IMM)

Subtracts the immediate value from operand 1 and stores this to the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   0   0   1   0  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### CMP [SUBS] (IMM) --- SETS FLAGS

Subtracts the immediate value from operand 1 and stores this to the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   1   0   1   0  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### AND (IMM)

Performs a logical and on the operand register and the immediate and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   0   0   1   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### ANDS (IMM) --- SETS FLAGS

Performs a logical and on the operand register and the immediate and stores the result in the destination register

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   1   0   1   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### OR (IMM)

Performs a logical or on the operand register and the immediate and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   0   1   0   0  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### ORS (IMM) --- SETS FLAGS

Performs a logical or on the operand register and the immediate and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   1   1   0   0  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### XOR (IMM)

Performs a logical xor on the operand register and the immediate and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   0   1   0   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### XORS (IMM) --- SETS FLAGS

Performs a logical xor on the operand register and the immediate and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   1   1   1   0   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
```

### LSL

 Left shifts the shift register by the value in immediate and stores it in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   1   x   0  [dest reg]  [shft reg]   x   x   x  [------------------- immediate --------------------]
```

### LSR

Right shifts the shift register by the value in immediate and stores it in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   1   x   1  [dest reg]  [shft reg]   x   x   x  [------------------- immediate --------------------]
```

### CLR

Clears the entire contents of the target register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   0   1   0  [dest reg]  x   x   x   x   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x 
```

### SET

Sets all bits of the entire contents of the target register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   0   1   1  [dest reg]  x   x   x   x   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x 
```

## Data Register Instructions

Instructions which operate on/with data directly, using register values for all operands.

### ADD (REG)

Adds the values of the operand registers and stores this to the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   0   0   1  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### ADDS (REG) --- SETS FLAGS

Adds the values of the operand registers and stores this to the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   1   0   0   1  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### SUB (REG)

Subtracts operand 2 from operand 1 and stores this to the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   0   1   0  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### CMP [SUBS] (REG) --- SETS FLAGS

Subtracts operand 2 from operand 1 and stores this to the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   1   0   1   0  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### AND (REG)

Performs a logical and on the operand registers and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   0   1   1  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### ANDS (REG) --- SETS FLAGS

Performs a logical and on the operand registers and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   1   0   1   1  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### OR (REG)

Performs a logical or on the operand registers and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   1   0   0  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### ORS (REG) --- SETS FLAGS

Performs a logical or on the operand registers and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   1   1   0   0  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### XOR (REG)

Performs a logical xor on the operand registers and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   1   0   1  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### XORS (REG) --- SETS FLAGS

Performs a logical xor on the operand registers and stores the result in the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   1   1   0   1  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### NOT

Stores the 1's compliment of the operand into the destination register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   1   1   0  [dest reg]  [op 1 reg]   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

## System/Branch Instructions

System and Branch instructions. Includes conditional/unconditional branching, no op, and other special instructions for the CPU.

### B (IMM)

Branches to an offset defined by the immediate (signed).

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   0   0   0   0   x   x   x   x   x   x   x   x   x  [------------------- immediate --------------------]
```

### B.cond (IMM)

Branches to an offset defined by the immediate (signed) only if the proper condition flags are set.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   0   0   0   1  [ cond flags ]   x   x   x   x   x  [------------------- immediate --------------------]
```


### BR (REG)

Branches to an offset defined by the value of the target register.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   0   0   1   0  [dest reg]   x   x   x   x   x   x  [-------------------- offset ----------------------]
```

### NOP

Does nothing, literally!

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   0   1   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```

### HALT

Sets a flag to stop the CPU.

```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   1   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
```
