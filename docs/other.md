# Other Architecture Information

Other general information about the architecture.

## Instruction and Address Width

Like ARMv8, instructions have a fixed width of 32-bits, and the addressing space in memory is 32-bits.

## Registers

8 internal general-purpose registers. 3 bits to encode a register, instructions support up to 1 destination register and up to 2 source registers (9 bits total for register encoding)

## Data Width

32 bit data width supported (register and datapath supports up to 32 bits), but immediates are limited to 16 bits.

## Addressing Modes

Only three addressing modes: Immediate Mode Register Mode, and Register Offset Mode.

### Immediate Addressing

Immediate addressing uses up to a single source register and an immediate value, and the result is stored in a single destination register. 

### Register Addressing

Register addressing uses up to two source registers and stores the result into a single destination register.

### Register Offset Addressing

Register Offset addressing is the same as Register addressing, with the addition of a signed 16-bit offset to an address in a source register.

## Branch Addressing Modes

There are two additional types of addressing for branch instructions, dealing with how an immediate or register address for the branch is treated: Relative addressing and Absolute addressing.

### Relative Addressing

Relative addressing is used for the Branch Immediate (B) and Branch Conditional Immediate (B.cond) instructions, and uses the 16-bit immediate field to encode a signed address offset from the current instruction. For example, in the following code snippet, the assembler will generate a 16-bit signed integer to denote a relative address from the branch instruction to the destination of the branch:

```asm
label:
    ADD X1,X2,X3
    CMP X0,X3,X1
    B.NE label
```

In this case, we'll assume the address of the `B.NE` instruction is `0x1C`, meaning (since instructions are 4 bytes long) the address of `label` is `0x14`. When run, the assembler will generate a relative address as the 16-bit immediate for endcoding `B.NE`:

```
0x1C - 0x14 = 8
```

Since `label` comes before `B.NE`, the relative address will be -8, in 2's compliment, which is `0xFFF8`.

### Absolute Addressing

Absolute Addressing is used for the Branch Register instruction (BR), and uses a full 32-bit address to denote the next Program Counter location. This allows the programmer to jump much further in their program, with the caveats that you must load a register with the address you wish to branch to before branching. 

For example, if you wanted to branch to a subroutine which is out of range of a 16-bit signed immediate (-8192->8191 instructions), you would need to use Branch Register, which can branch to any instruction in the addressing space. say this subroutine is called `printf`, and is defined somewhere in the addressing space:

```asm
    CMP X1,X2,X3
    B.NE jmpskip
    MOV32 X0, printf
    BR X0

jmpskip:
    
    ...
    ...

...
> 8192 instructions later
...

printf:
    
    ...
    ...

```

We first use the `MOV32` instruction to load the full 32-bit address (decoded from label) into register `X0`, then we `BR X0` to our function. 

## System Flags

The system flags are Negative (N), Carry (C, Unsigned Overflow), Zero (Z), and V (Signed Overflow)
