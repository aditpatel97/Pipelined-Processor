`timescale 1us / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:57:02 08/22/2016
// Design Name:   Program_Counter
// Module Name:   E:/Xilinx projects/ALU_8bit/Program_Counter_tb.v
// Project Name:  ALU_8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Program_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Program_Counter_tb;

	// Inputs
	reg [7:0] jmp_loc;
	reg pc_mux_sel;
	reg stall;
	reg stall_pm;
	reg reset;
	reg clk;

	// Outputs
	wire [19:0] ins;
	wire [19:0] ins_pm;
	wire [7:0] current_address;

	// Instantiate the Unit Under Test (UUT)
	Program_Counter uut (
		.ins(ins), 
		.ins_pm(ins_pm), 
		.current_address(current_address), 
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel), 
		.stall(stall), 
		.stall_pm(stall_pm), 
		.reset(reset), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		jmp_loc = 0;
		pc_mux_sel = 1'b1;
		stall = 0;
		stall_pm = 0;
		reset = 1'b1;
		clk = 0;
		
		#2;
		reset = 1'b0;
		
		#5;
		reset = 1'b1;
		
		#3;
		pc_mux_sel = 1'b0;
		jmp_loc = 8'b0000_1000;
		
		#30;
		stall = 1'b1;
		
		#20;
		stall = 1'b0;
		
		#10;
		pc_mux_sel = 1'b1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   
	always #5 clk = ~clk;
	
endmodule

