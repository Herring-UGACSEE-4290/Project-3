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

## System Flags

The system flags are Negative (N), Carry (C, Unsigned Overflow), Zero (Z), and V (Signed Overflow)
