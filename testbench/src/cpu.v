`include "id.v"
`include "alu.v"
`include "reg.v"

module CPU(
	input         clk,    // Core clock
	input         clk_en, // Clock enable
	input         nreset, // Active low reset
	input  [31:0] instruction_memory_v, // Instruction memory read value
	input  [31:0] data_memory_in_v,     // Data memory read value

	output  [3:0] error_indicator,
	output [31:0] instruction_memory_a, // Instruction memory address
	output        instruction_memory_en,// Instruction memory read enable
	output [31:0] data_memory_a,        // Data memory address
	output [31:0] data_memory_out_v,    // Data memory write value
	output  [1:0] data_memory_s,        // Data memory read/write size
	output        data_memory_read,     // Data memory read control
	output        data_memory_write     // Data memory write control
);

    //Decode signals
    reg [31:0] I;
    wire [2:0] resultReg, op1Reg, op2Reg;
    wire immediateMode, aluMode;
    wire [15:0] immediate;
    wire [2:0] aluFunc;
    wire setFlags;
    wire ldst; // Load Store
    wire SnL; // Store not Load
    wire halt;
    wire en;
    wire branch;
    wire [3:0] branchCond;
    wire toPC;

    //ALU signals
    wire [3:0] aluFlag;

    //Register File signals
    wire writeEnable;
    wire [31:0] results, op1, op2;

    reg [29:0] PC;
    reg [3:0] PSTATE;
    
    reg nreset_sync;
	always @ ( posedge clk or negedge nreset) begin
		if(~nreset) nreset_sync <= 0;
		else nreset_sync <= 1;
	end
	
	assign npe_stop = clk_en & ~|error_indicator & nreset_sync;

	// enable instruction read 
	assign instruction_memory_en = nreset_sync;
    assign instruction_memory_a = {PC, 2{0}};
    assign error_indicator = halt;

/*****************************************************************************/
/*
Instruction Fetch
*/
    wire N, Z, C, V;
    assign N = PSTATE[3];
    assign Z = PSTATE[2];
    assign C = PSTATE[1];
    assign V = PSTATE[0];

    reg doJump;
	always @ (posedge clk or negedge nreset_sync) begin
        doJump = 0;
        
        if(~nreset_sync) PC <= 29'h0;
        else begin
            if(npe_stop) 
                if(branch) begin
                    case(branchCond)
                        4'b0000: doJump = Z;
                        4'b0001: doJump = ~Z;
                        4'b0010: doJump = C;
                        4'b0011: doJump = ~C;
                        4'b0100: doJump = N;
                        4'b0101: doJump = ~N;
                        4'b0110: doJump = V;
                        4'b0111: doJump = ~V;
                        4'b1000: doJump = C & ~Z;
                        4'b1001: doJump = ~C | Z;
                        4'b1010: doJump = N == V;
                        4'b1011: doJump = N != V;
                        4'b1100: doJump = ~Z & N == V;
                        4'b1101: doJump = Z | N != V;
                        4'b1110: doJump = 1;
                        default: doJump = 0;
                    endcase
                    if(doJump) begin
                        if(~immediateMode) PC = results;
                    end
                end
                else begin
                    PC = PC + 1;
                end
        end
	end

	always @ (*) begin
		if (~nreset_sync) I = 32'hC8000000;
		else I = instruction_memory_v;
	end

	wire  [3:0] decode_err;

// ID
    InstructionDecoder ID (
        .I(I),

        .resultReg(resultReg),
        .op1Reg(op1Reg),
        .op2Reg(op2Reg),

        .immediateMode(immediateMode),
        .immediate(immediate),
        .aluMode(aluMode),
        .aluFunc(aluFunc),
        .setFlags(setFlags),
        .toPC(toPC),

        .ldst(ldst), // Load Store
        .SnL(SnL), // Store not Load
        .writeEnable(writeEnable),

        .halt(halt),
        .en(en),
        .branch(branch),
        .branchCond(branchCond)
    );

//Register File
    RegisterFile RF(
        .clk(clk),
        .clk_en(clk_en),
        .write_en(en & writeEnable),
        .write_val(~ldst ? results : data_memory_in_v),
        .writeReg(resultReg),
        .op1Reg(op1Reg),
        .op2Reg(op2Reg),

        .out1(op1),
        .out2(op2)
    );
    
//ALU
    ALU ALU1(
        .op1Reg(toPC ? PC : op1),
        .op2Reg(op2),
        .immediateMode(immediateMode),
        .immediate(immediate),
        .aluMode(aluMode),
        .aluFunc(aluFunc),
        .results(results),
        .flags(aluFlag)
    );
    
//Execute
    always @(*) begin
        if(toPC & doJump) PC = results[31:2];
        if(setFlags) PSTATE = aluFlag;
        
    end

//Write Back
    assign data_memory_read = ~data_memory_write
    always @(*) begin
        if(ldst) begin;
            data_memory_a = results;
            if(SnL) begin
                data_memory_write = 1;
                data_memory_out_v = op2;
            end
            else begin
                data_memory_write = 0;
            end
        end
        else data_memory_write = 0;
    end

endmodule