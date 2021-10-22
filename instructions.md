# MOV
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   0   0   0  [targ reg]   x   x   x   x   x   x  [------------------- immediate --------------------]
    >> Moves a 16 bit immediate value into the lower 2 bytes of a target register
```

# MOVT
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   0   0   0  [targ reg]   x   x   x   x   x   x  [------------------- immediate --------------------]
    >> Moves a 16 bit immediate value into the upper 2 bytes of a target register
```

# NOP
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   0   1   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Does nothing
```

# LOAD
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   0   x   x   x   x   0  [targ reg]  [pntr reg]   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Loads the value from memory at location of the pointer register into the target register
```

# STOR
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
1    0   x   x   x   x   1  [targ reg]  [pntr reg]   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Stores the value of the target register to the location in memory of the pointer register
```

# ADD (REG)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   0   0   1  [dest reg]  [op 1 reg]  [op 2 reg]  x    x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Adds the values of the operand registers and stores this to the destination register
```

# ADD (IMM)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   0   0   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
    >> Adds the values of the operand register and immediate value and stores this to the destination register
```

# ADDS (REG) --- SETS FLAGS
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   1   0   0   1  [dest reg]  [op 1 reg]  [op 2 reg]  x    x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Adds the values of the operand registers and stores this to the destination register
```

# ADDS (IMM) --- SETS FLAGS
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   1   0   0   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
    >> Adds the values of the operand register and immediate value and stores this to the destination register
```

# SUB (REG)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   0   1   0  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Subtracts operand 2 from operand 1 and stores this to the destination register
```
# SUB (IMM)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   0   1   0  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
    >> Subtracts the immediate value from operand 1 and stores this to the destination register
```

# CMP [SUBS (REG)] --- SETS FLAGS
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   1   0   1   0  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Subtracts operand 2 from operand 1 and stores this to the destination register
```

# AND (REG)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   0   1   1  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Performs a logical and on the operand registers and stores the result in the destination register
```

# AND (IMM)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   0   1   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
    >> Performs a logical and on the operand register and the immediate and stores the result in the destination register
```

# OR (REG)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   1   0   0  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Performs a logical or on the operand registers and stores the result in the destination register
```

# OR (IMM)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   1   0   0  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
    >> Performs a logical or on the operand register and the immediate and stores the result in the destination register
```

# XOR (REG)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   1   0   1  [dest reg]  [op 1 reg]  [op 2 reg]   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Performs a logical xor on the operand registers and stores the result in the destination register
```

# XOR (IMM)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   1   0   1  [dest reg]  [op 1 reg]   x   x   x  [------------------- immediate --------------------]
    >> Performs a logical xor on the operand register and the immediate and stores the result in the destination register
```

# NOT
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   1   1   0   1   1   0  [dest reg]  [op 1 reg]   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Stores the 1's compliment of the operand into the destination register
```

# B (IMM)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   0   0   0   0   x   x   x   x   x   x   x   x   x  [------------------- immediate --------------------]
    >> Branches to an offset defined by the immediate (signed)
```


# B.cond (IMM)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   0   0   0   1  [ cond flags ]   x   x   x   x   x  [------------------- immediate --------------------]
    >> Branches to an offset defined by the immediate (signed) only if the proper condition flags are set
```


# BR (REG)
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   0   0   1   0  [targ reg]   x   x   x   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Branches to an offset defined by the value of the target register
```


# HALT
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 1   1   x   1   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Sets a flag to stop the CPU
```


# LSL
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   1   x   0  [dest reg]  [shft reg]   x   x   x  [------------------- immediate --------------------]
    >> Left shifts the shift register by the value in immediate and stores it in the destination register
```

# LSR
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   1   x   1  [dest reg]  [shft reg]   x   x   x  [------------------- immediate --------------------]
    >> Right shifts the shift register by the value in immediate and stores it in the destination register
```


# CLR
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   0   1   0  [targ reg]  x   x   x   x   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Clears the entire contents of the target register
```

# SET
```
31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
 0   0   0   x   0   1   1  [targ reg]  x   x   x   x   x   x   x   x   x   x   x   x   x  x  x  x  x  x  x  x  x  x  x
    >> Sets all bits of the entire contents of the target register
```


# ALU COMMANDS:
```
001: Add
010: Sub
011: And
100: Or
101: Xor
110: Not
```


