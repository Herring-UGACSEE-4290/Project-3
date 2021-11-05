module RegisterFile(
    input clk,
    input clk_en,
    input write_en,
    input [31:0] write_val,
    input [2:0] writeReg,
    input [2:0] op1Reg,
    input [2:0] op2Reg,

    output [31:0] out1,
    output [31:0] out2
);

    reg [31:0] regs [7:0];
   
    assign out1 = regs[op1Reg];
    assign out2 = regs[op2Reg];

    always @(posedge clk) begin
        if(clk_en & write_en) regs[writeReg] = write_val;
    end

endmodule