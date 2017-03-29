`timescale 1us / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:15:15 10/02/2016
// Design Name:   Dependency_check
// Module Name:   F:/IET/III SEM/CO LAB/Lab 5/Dependency_check/Dependency_check_tb.v
// Project Name:  Dependency_check
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dependency_check
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Dependency_check_tb;

	// Inputs
	reg [19:0] ins;
	reg clk;
	reg reset;

	// Outputs
	wire [1:0] mux_sel_a;
	wire [1:0] mux_sel_b;
	wire imm_sel;
	wire [7:0] Imm;
	wire mem_en_dec;
	wire mem_rw_dec;
	wire mem_mux_sel_dec;
	wire [4:0] RW_dec;
	wire [4:0] op_dec;

	// Instantiate the Unit Under Test (UUT)
	Dependency_check uut (
		.mux_sel_a(mux_sel_a), 
		.mux_sel_b(mux_sel_b), 
		.imm_sel(imm_sel), 
		.Imm(Imm), 
		.mem_en_dec(mem_en_dec), 
		.mem_rw_dec(mem_rw_dec), 
		.mem_mux_sel_dec(mem_mux_sel_dec), 
		.RW_dec(RW_dec), 
		.op_dec(op_dec), 
		.ins(ins), 
		.clk(clk), 
		.reset(reset)
	);
	
	
	initial begin
		// Initialize Inputs
		ins = 0;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#0.2;
      reset=0;

		#0.5;
		reset=1;
		ins=20'b00000000010001000011;
		
		#1;
		ins=20'b10100001000000100000;
		
		#2;
		ins=20'b00100001010000100100;
		
		#1;
		ins=20'b01101001100000100101;
		
		
		// Add stimulus here

	end
	always #0.5 clk = ~clk;
endmodule

