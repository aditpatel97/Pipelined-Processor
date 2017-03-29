`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:54:27 10/17/2016
// Design Name:   Processor_Main_Module
// Module Name:   F:/Processor/Processor_Main_Module_tb.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Processor_Main_Module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Processor_Main_Module_tb;

	// Inputs
	reg [7:0] data_in;
	reg clk;
	reg reset;
	reg interrupt;

	// Outputs
	wire [7:0] data_out;
	wire [19:0] ins;
	wire [7:0] A;
	wire [7:0] B;
	wire [7:0] current_address;
	wire [7:0] ans_ex;
	wire [7:0] mux_ans_dm;
	wire [7:0] ans_wb;

	// Instantiate the Unit Under Test (UUT)
	Processor_Main_Module uut (
		.data_in(data_in), 
		.clk(clk), 
		.reset(reset), 
		.data_out(data_out), 
		.ins(ins), 
		.A(A), 
		.B(B), 
		.current_address(current_address), 
		.ans_ex(ans_ex), 
		.mux_ans_dm(mux_ans_dm), 
		.ans_wb(ans_wb), 
		.interrupt(interrupt)
	);

	initial
begin
data_in = 0;
interrupt = 0;
clk = 0;
reset = 1;
#200; reset = 0;
#500; reset = 1;
end
always
#500 clk = ~clk;
      
endmodule

