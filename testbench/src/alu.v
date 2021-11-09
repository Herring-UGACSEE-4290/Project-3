`define ADD 3'b001
`define SUB 3'b010
`define AND 3'b011 
`define OR 3'b100 
`define XOR 3'b101
`define NOT 3'b110

`define LSL 3'b1x0
`define LSR 3'b1x1
`define MOV 3'b000
`define MOVT 3'b001
`define CLR 3'b010
`define SET 3'b011

module ALU(
    input [31:0] op1Reg,
    input [31:0] op2Reg,
    input immediateMode,
    input [15:0] immediate,
    input aluMode,
    input [2:0] aluFunc,
    output reg [31:0] results,
    output reg [3:0] flags
);

    wire [31:0] op2;
    assign op2 = immediateMode ? immediate : op2Reg;

    always @(*) begin
        if(aluMode) begin
            case(aluFunc)
                `ADD: {flags[1],results} = op1Reg + op2;
                `SUB: {flags[1],results} = op1Reg - op2;
                `AND: {flags[1],results} = op1Reg & op2;
                `OR: {flags[1],results} = op1Reg | op2;
                `XOR: {flags[1],results} = op1Reg ^ op2;
                `NOT: {flags[1],results} = ~op1Reg;
            endcase
        end
        else begin
            casex(aluFunc)
                `LSL: {flags[1],results} = op1Reg << immediate;
                `LSR: {flags[1],results} = op1Reg >> immediate;
                `MOV: {flags[1],results} = immediate;
                `MOVT: {flags[1],results} = immediate << 16;
                `CLR: {flags[1],results} = 0;
                `SET: {flags[1],results} = 33'h1FF;
            endcase
        end
        
        flags[0]=(~results[31]&op1Reg[31]&op2[31])|
                 (results[31]&(~op1Reg[31])&(~op2[31]));
        flags[2]=|results[31:0];
        flags[3]=results[31];
    end

endmodule