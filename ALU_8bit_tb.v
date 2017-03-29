`timescale 30us / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:22:06 08/14/2016
// Design Name:   ALU_8bit
// Module Name:   E:/Xilinx projects/ALU_8bit/ALU_8bit_tb.v
// Project Name:  ALU_8bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_8bit
//

// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_8bit_tb;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg [7:0] data_in;
	reg [4:0] op_dec;
	reg clk;
	reg mem_en_dec;
	reg mem_rw_dec;
	reg mem_mux_sel_dec;
	reg [4:0] RW_dec;
	reg reset;

	// Outputs
	wire [3:0] flag_ex;
	wire [7:0] ans_ex;
	wire [7:0] data_out;
	wire [7:0] B_Bypass;
	wire mem_en_ex;
	wire mem_rw_ex;
	wire mem_mux_sel_ex;
	wire [4:0] RW_ex;

	// Instantiate the Unit Under Test (UUT)
	ALU_8bit uut (
		.A(A), 
		.B(B), 
		.data_in(data_in), 
		.op_dec(op_dec), 
		.clk(clk), 
		.mem_en_dec(mem_en_dec), 
		.mem_rw_dec(mem_rw_dec), 
		.mem_mux_sel_dec(mem_mux_sel_dec), 
		.RW_dec(RW_dec), 
		.reset(reset), 
		.flag_ex(flag_ex), 
		.ans_ex(ans_ex), 
		.data_out(data_out), 
		.B_Bypass(B_Bypass), 
		.mem_en_ex(mem_en_ex), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_mux_sel_ex(mem_mux_sel_ex), 
		.RW_ex(RW_ex)
	);

	always #0.05 clk=~clk;  //clk will change every 5us
	initial begin
		//The values of reset is changing according to the values mentioned
		// Initialize Inputs
		clk = 0;
		reset = 1;
		
		// Wait 0.2 us for global reset to finish
		#0.02;
		
		reset = 0;
		
		#0.06;
		reset = 1;
		
		#0.02;
		//changing values with a delay of 1us in test bench
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b00000;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;
		#0.1;
		
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b00001;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b00010;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b00100;
		clk = 1;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
        
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b00101;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b00110;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b00111;
		clk = 1;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b01000;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b01001;
		clk = 1;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
        
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b01010;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b01100;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;
		
		
		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b01101;
		clk = 1;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b01110;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b01111;
		clk = 1;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
        
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b10000;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b10001;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b10100;
		clk = 1;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b10101;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b10110;
		clk = 1;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
        
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b10111;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'h40;
		B = 8'hC0;
		data_in = 8'h08;
		op_dec = 5'b11000;
		mem_en_dec = 0;
		mem_rw_dec = 0;
		mem_mux_sel_dec = 0;
		RW_dec = 5;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'hC0;
		B = 8'h01;
		data_in = 8'h08;
		op_dec = 5'b11001;
		clk = 1;
		mem_en_dec = 1;
		mem_rw_dec = 1;
		mem_mux_sel_dec = 1;
		RW_dec = 10;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'hC0;
		B = 8'h01;
		data_in = 8'h08;
		op_dec = 5'b11010;
		clk = 1;
		mem_en_dec = 1;
		mem_rw_dec = 1;
		mem_mux_sel_dec = 1;
		RW_dec = 10;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'hC0;
		B = 8'h01;
		data_in = 8'h08;
		op_dec = 5'b11011;
		clk = 1;
		mem_en_dec = 1;
		mem_rw_dec = 1;
		mem_mux_sel_dec = 1;
		RW_dec = 10;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'hC0;
		B = 8'h01;
		data_in = 8'h08;
		op_dec = 5'b11100;
		clk = 1;
		mem_en_dec = 1;
		mem_rw_dec = 1;
		mem_mux_sel_dec = 1;
		RW_dec = 10;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'hC0;
		B = 8'h01;
		data_in = 8'h08;
		op_dec = 5'b11101;
		clk = 1;
		mem_en_dec = 1;
		mem_rw_dec = 1;
		mem_mux_sel_dec = 1;
		RW_dec = 10;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'hC0;
		B = 8'h01;
		data_in = 8'h08;
		op_dec = 5'b11110;
		clk = 1;
		mem_en_dec = 1;
		mem_rw_dec = 1;
		mem_mux_sel_dec = 1;
		RW_dec = 10;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Initialize Inputs
		A = 8'hC0;
		B = 8'h01;
		data_in = 8'h08;
		op_dec = 5'b11111;
		clk = 1;
		mem_en_dec = 1;
		mem_rw_dec = 1;
		mem_mux_sel_dec = 1;
		RW_dec = 10;


		// Wait 1 us for global reset to finish
		#0.1;
		
		// Add stimulus here

	end
      
endmodule