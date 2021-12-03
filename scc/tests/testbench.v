`timescale  10ms/1ms

module testbench();

    // dump waveform event
	event START_LOG;
	initial begin
		@(START_LOG);
		$dumpvars(0, testbench); // dump CPU variables
	end

    // Clocks
    reg main_clk = 0;
    reg core_clk = 0;
    reg mem_clk = 0;

    // Clock setup
    always #1 main_clk = ~main_clk;
    always #2 mem_clk = ~mem_clk;
    always #4 core_clk = ~core_clk;
    
    
    // CPU registers and wires
    wire clk_en = 1;				  // Clock enable signal
	reg         nreset;               // Active low reset
	reg [31:0] instruction_memory_v;  // Instruction memory read value
	reg [31:0] data_memory_in_v;      // Data memory read value
	wire [31:0] data_memory_out_v;    // Data memory write value
	wire  [1:0] error_indicator;      // 0 is HALT, 1 is ERROR
	wire [31:0] instruction_memory_a; // Instruction memory address
	wire        instruction_memory_en;// Instruction memory read enable
	wire [31:0] data_memory_a;        // Data memory address
	wire        data_memory_read;     // Data memory read control
	wire        data_memory_write;    // Data memory write control

    CPU cpu(
        .clk(core_clk),
        .clk_en(clk_en),
		.nreset(nreset),
		.data_memory_a(data_memory_a),
		.data_memory_read(data_memory_read),
		.data_memory_write(data_memory_write),
		.data_memory_in_v(data_memory_in_v),
		.data_memory_out_v(data_memory_out_v),
		.instruction_memory_en(instruction_memory_en),
		.instruction_memory_a(instruction_memory_a),
		.instruction_memory_v(instruction_memory_v),
		.error_indicator(error_indicator)
    );

    // Define Instruction and Data Memory
    reg [7:0] inst_memory [0:2**16 - 1];
    reg [7:0] data_memory [0:2**16 - 1];

    // Define Instruction Memory Behavior
    always @(posedge mem_clk or negedge nreset) begin
        if (~nreset) instruction_memory_v <= 32'hC8000000; // Set instruction to NOP if reset
		else if(instruction_memory_en) begin
            instruction_memory_v[ 7: 0] <= inst_memory[instruction_memory_a[15:0]];
			instruction_memory_v[15: 8] <= inst_memory[instruction_memory_a[15:0]+1];
			instruction_memory_v[23:16] <= inst_memory[instruction_memory_a[15:0]+2];
			instruction_memory_v[31:24] <= inst_memory[instruction_memory_a[15:0]+3];
        end
    end

    // Define Data Memory Behavior
    always @ (posedge mem_clk) begin
		if(data_memory_read) begin
			data_memory_in_v[ 7: 0] <= data_memory[data_memory_a[15:0]];
			data_memory_in_v[15: 8] <= data_memory[data_memory_a[15:0]+1];
			data_memory_in_v[23:16] <= data_memory[data_memory_a[15:0]+2];
			data_memory_in_v[31:24] <= data_memory[data_memory_a[15:0]+3];
		end
		if(data_memory_write) begin
			data_memory[data_memory_a[15:0]+0] <= data_memory_out_v[ 7: 0];
			data_memory[data_memory_a[15:0]+1] <= data_memory_out_v[15: 8];
			data_memory[data_memory_a[15:0]+2] <= data_memory_out_v[23:16];
			data_memory[data_memory_a[15:0]+3] <= data_memory_out_v[31:24];
		end
    end

    // Import Test Case, Error Logic, Display

    reg [8*128:0] PROGRAM; // Setup register for test program name (8 bits for character, 128 character limit)

	initial begin
		nreset <= 0;

        // Check for value program file argument
		if(!$value$plusargs("PROGRAM=%s",PROGRAM)) begin
			$display("%sPlease specify the test case file", "[ERROR]");
			$finish;
		end

        // Display the file name
		$display("%sTest case: %0s", "[LOG]", PROGRAM);
		
        // Read contents of file into instruction and data memory
        $readmemh(PROGRAM, inst_memory);
        $readmemh(PROGRAM, data_memory);

		-> START_LOG;
		repeat (6) @(posedge main_clk);
		nreset <= 1;

		forever @ (posedge core_clk)
			if(error_indicator == 2'b01) begin // If HALT
				$display("%sApollo has landed", "[LOG]");
				$finish;
			end
			else if(error_indicator == 2'b10) begin // If ERROR
				$display("%sHouston, we got a problem", "[ERROR]");
				$finish;
			end
	end

endmodule