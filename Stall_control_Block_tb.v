`timescale 1us / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:11:55 09/09/2016
// Design Name:   Stall_control_Block
// Module Name:   E:/Xilinx projects/ALU_8bit/Stall_control_Block_tb.v
// Project Name:  ALU_8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Stall_control_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Stall_control_Block_tb;

	// Inputs
	reg [19:0] ins_pm;
	reg clk;
	reg reset;

	// Outputs
	wire stall;
	wire stall_pm;

	// Instantiate the Unit Under Test (UUT)
	Stall_control_Block uut (
		.ins_pm(ins_pm), 
		.clk(clk), 
		.reset(reset), 
		.stall(stall), 
		.stall_pm(stall_pm)
	);
	always #0.5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk=1'b0;
	reset=1'b1;
	ins_pm=20'h00000;
	#0.2;
	
	reset=1'b0;
	#0.6;
	
	reset=1'b1;
	#0.85;
	
	ins_pm=20'ha0000;
	#2;
	
	ins_pm=20'h00000;
	#1;
	
	ins_pm=20'hf0000;
	#3;
	
	ins_pm=20'h00000;
	#1;
	
	ins_pm=20'h88000;
	
        
		// Add stimulus here

	end
      
endmodule

