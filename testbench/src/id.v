module InstructionDecoder (
    input [31:0] I,

    output [2:0] resultReg,
    output [2:0] op1Reg,
    output [2:0] op2Reg,

    output immediateMode,
    output [15:0] immediate,
    output aluMode,
    output [2:0] aluFunc,
    output setFlags,
    output toPC,

    output ldst, // Load Store
    output SnL, // Store not Load

    output halt,
    output en,
    output branch,
    output [3:0] branchCond
);

    assign resultReg = I[24:22];
    assign op1Reg = I[21:19];
    assign op2Reg = I[18:16];

    assign immediateMode = ~|I[31:30] | ~|I[28:26];
    assign immediate = I[15:0];
    assign aluMode = I[29];
    assign aluFunc = |I[31:30] ? I[27:25] : 3'b001;
    assign setFlags = I[28] & I[31:29] == 1;
    assign toPC = &I[31:30] & ~|I[28:26];

    assign ldst = I[31:30] == 2;
    assign SnL = I[25];

    assign halt = &I[31:30] & I[28];
    assign en = ~(&I[31:30] & I[28:27]==1);
    assign branch = ~|I[28:27] & &I[31:30];
    assign branchCond = ~I[26] ? 14 : I[24:21]; 

endmodule