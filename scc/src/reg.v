module RegisterFile(
    input clk,
    input clk_en,
    input write_en,
    input [31:0] write_val,
    input [2:0] writeReg,
    input [2:0] op1Reg,
    input [2:0] op2Reg,
    input [29:0] nextPC,
    input writePC,

    output [31:0] out1,
    output [31:0] out2,
    output reg [29:0] PC
);

    reg [31:0] regs [7:0];
    
    wire [31:0] R0, R1, R2, R3, R4, R5, R6, R7;
    assign R0 = regs[0];
    assign R1 = regs[1];
    assign R2 = regs[2];
    assign R3 = regs[3];
    assign R4 = regs[4];
    assign R5 = regs[5];
    assign R6 = regs[6];
    assign R7 = regs[7];
   
    assign out1 = regs[op1Reg];
    assign out2 = regs[op2Reg];

    always @(posedge clk) begin
        if(clk_en & write_en) regs[writeReg] <= write_val;
        if(writePC) PC <= nextPC;
    end

endmodule