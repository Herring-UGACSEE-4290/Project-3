# Decode

This document describes what each bit in the instruction encoding represents.

## Bits 31-30 - First Level Decode
11: SYS / Branch
10: LD / ST
01: Data | Register
00: Data | Immediate

## Bit 29 - ALU/Special encoding for Data instructions
Only used for Data instructions
1: ALU functions
0: Special functions

## Bits 28-25 - Second Level Decode

Data | ALU Functions - 28 is 'set flags' which sets the 'NCZV' flags with the ALU result; 27-25 is the ALU operation encoding
SYS / Branch - General 2nd level encoding
LD / ST - General 2nd level encoding

## Bits 27-25 - ALU Operation Commands

001: Add
010: Sub
011: And
100: Or
101: Xor
110: Not

## Bits 24-21
Used to store branch condition for B.cond instruction

## Bits 24-22
Encodes destination/target register

## Bits 21-19
Encodes operand 1 register

## Bits 18-16
Encodes operand 2 register

## Bits 15-0
16 bit immediate value