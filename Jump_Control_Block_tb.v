`timescale 1us / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:05:47 09/12/2016
// Design Name:   Jump_Control_Block
// Module Name:   E:/Xilinx projects/ALU_8bit/Jump_Control_Block_tb.v
// Project Name:  ALU_8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Jump_Control_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////


module Jump_Control_Block_tb;

	// Inputs
	reg [19:0] ins;
	reg clk;
	reg interrupt;
	reg [7:0] current_address;
	reg [3:0] flag_ex;
	reg reset;

	// Outputs
	wire pc_mux_sel;
	wire [7:0] jmp_loc;

	// Instantiate the Unit Under Test (UUT)
	Jump_Control_Block uut (
		.pc_mux_sel(pc_mux_sel), 
		.jmp_loc(jmp_loc), 
		.ins(ins), 
		.clk(clk), 
		.interrupt(interrupt), 
		.current_address(current_address), 
		.flag_ex(flag_ex), 
		.reset(reset)
	);

	always #0.5 clk = ~clk;
	initial begin
		clk=0;
		// Initialize Inputs
		ins = 20'h00000;
		interrupt = 0;
		current_address = 8'h01;
		flag_ex = 4'h8;
		reset = 1'b1;


		#0.3;
       ins = 20'h00000;
		interrupt = 0;
		current_address = 8'h01;
		flag_ex = 4'h8;
		reset = 1'b0;
 
	#0.4;
	    ins = 20'h00000;
		interrupt = 0;
		current_address = 8'h01;
		flag_ex = 4'h8;
		reset = 1'b1;
 
		// Add stimulus here
	#1;
	    ins = 20'h00000;
		interrupt = 1;
		current_address = 8'h01;
		flag_ex = 4'h8;
		reset = 1'b1;
  #1;
      ins = 20'h00008;
		interrupt = 0;
		current_address = 8'h01;
		flag_ex = 4'h8;
		reset = 1'b1;
  #1;
      ins = 20'hc0008;
		interrupt = 0;
		current_address = 8'h04;
		flag_ex = 4'h8;
		reset = 1'b1;
  
	 #1;
	   ins = 20'h80008;
		interrupt = 0;
		current_address = 8'h04;
		flag_ex = 4'h8;
		reset = 1'b1;
  
   #1;
	
	   ins = 20'hf8008;
		interrupt = 0;
		current_address = 8'h04;
		flag_ex = 4'h8;
		reset = 1'b1;
    #1;
	   ins = 20'hf8008;
		interrupt = 0;
		current_address = 8'h04;
		flag_ex = 4'ha;
		reset = 1'b1;
    
	end
      
endmodule

