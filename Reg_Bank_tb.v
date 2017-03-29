`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:57:17 08/29/2016
// Design Name:   Reg_Bank
// Module Name:   E:/Xilinx projects/ALU_8bit/Reg_Bank_tb.v
// Project Name:  ALU_8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Reg_Bank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Reg_Bank_tb;

	// Inputs
	reg [19:0] ins;
	reg [4:0] RW_dm;
	reg [7:0] ans_ex;
	reg [7:0] mux_ans_dm;
	reg [7:0] ans_wb;
	reg [7:0] imm;
	reg [1:0] mux_sel_A;
	reg [1:0] mux_sel_B;
	reg imm_sel;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] A;
	wire [7:0] B;

	// Instantiate the Unit Under Test (UUT)
	Reg_Bank uut (
		.ins(ins), 
		.RW_dm(RW_dm), 
		.ans_ex(ans_ex), 
		.mux_ans_dm(mux_ans_dm), 
		.ans_wb(ans_wb), 
		.imm(imm), 
		.mux_sel_A(mux_sel_A), 
		.mux_sel_B(mux_sel_B), 
		.imm_sel(imm_sel), 
		.clk(clk), 
		.reset(reset), 
		.A(A), 
		.B(B)
	);
always #0.5
		clk=~clk;
	initial begin
		// Initialize Inputs
		ins = 20'b00000001010011000101;
		RW_dm = 5'h05;
		ans_ex = 8'h01;
		mux_ans_dm = 8'h02;
		ans_wb = 8'h03;
		imm = 8'h04;
		mux_sel_A = 2'b00;
		mux_sel_B = 2'b00;
		imm_sel = 0;
		clk = 0;
		reset = 1;
		
		#0.2
		reset = 0;
		
		#0.5
		reset = 1;
		
		#1
		RW_dm = 5'h06;
		mux_ans_dm = 8'h05;
		
		#1
		RW_dm = 5'h07;
		mux_sel_A = 2'h1;
		
		#1
		mux_sel_A = 2'h2;
		mux_sel_B = 2'h3;
		// Wait 100 ns for global reset to finish
		#1
		
		imm_sel = 1;
        
		// Add stimulus here

	end

      
endmodule

