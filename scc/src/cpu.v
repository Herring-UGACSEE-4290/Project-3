module CPU(
	input         clk,    // Core clock
	input         clk_en, // Clock enable
	input         nreset, // Active low reset
	input  [31:0] instruction_memory_v, // Instruction memory read value
	input  [31:0] data_memory_in_v,     // Data memory read value

	output  [1:0] error_indicator,
	output [31:0] instruction_memory_a, // Instruction memory address
	output        instruction_memory_en,// Instruction memory read enable
	output reg [31:0] data_memory_a,        // Data memory address
	output reg [31:0] data_memory_out_v,    // Data memory write value
	output        data_memory_read,     // Data memory read control
	output reg       data_memory_write     // Data memory write control
);

endmodule