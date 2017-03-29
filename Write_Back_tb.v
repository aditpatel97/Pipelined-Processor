`timescale 1us / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:23:52 10/05/2016
// Design Name:   Write_Back
// Module Name:   F:/IET/III SEM/CO LAB/Main/Processor/Write_Back_tb.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Write_Back
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Write_Back_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] mux_ans_dm;

	// Outputs
	wire [7:0] ans_wb;

	// Instantiate the Unit Under Test (UUT)
	Write_Back uut (
		.clk(clk), 
		.reset(reset), 
		.mux_ans_dm(mux_ans_dm), 
		.ans_wb(ans_wb)
	);
	always #0.5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		mux_ans_dm = 8'hff;

		// Wait 100 ns for global reset to finish
		#0.2;
		reset=1'b0;
		#0.4;
		reset=1'b1;
		#0.5;
		mux_ans_dm=8'hff;
		#0.4;
		mux_ans_dm=8'h0f;
		
        
		// Add stimulus here
	
	end
      
endmodule

