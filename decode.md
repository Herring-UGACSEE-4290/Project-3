# Bits 31-30
11: SYS / Branch
10: LD / ST
01: Data | Register
00: Data | Immediate

# Bit 29
Only used for Data instructions
1: ALU functions
0: Special functions

# Bits 28-25
Encodes instruction

# Bits 24-21
Used to store branch condition for B.cond instruction

# Bits 24-22
Describes return register

# Bits 21-19
Describes operand 1 register

# Bits 18-16
Describes operand 2 register

# Bits 15-0
Encodes a 16 bit immediate value