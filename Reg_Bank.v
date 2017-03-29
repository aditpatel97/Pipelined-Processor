// Group N0.- 09
//Group name - Inteljr
//LAB - 3 - Registr Bank for microprocessor 
//date - 1/09/16

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:31:31 08/29/2016 
// Design Name: 
// Module Name:    Reg_Bank 
// Project Name: MIPS Processor
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Reg_Bank(ins,RW_dm,ans_ex,mux_ans_dm,ans_wb,imm,mux_sel_A,mux_sel_B,imm_sel,clk,reset,A,B);

//inputs
input[19:0] ins;
input[4:0] RW_dm;
input[7:0] ans_ex,mux_ans_dm,ans_wb,imm;
input[1:0] mux_sel_A,mux_sel_B;
input imm_sel,clk,reset;

//output
output[7:0] A,B;


wire[7:0] temp_B;

reg [7:0] R_Bank[0:31];

wire[4:0] RA,RB;
reg[7:0] reg_A,reg_B;

assign RA=ins[9:5];
assign RB=ins[4:0];

initial begin

	R_Bank[0]<=8'h0;	//reg bank initialization
	R_Bank[1]<=8'h1;
	R_Bank[2]<=8'h2;
	R_Bank[3]<=8'h3;
	R_Bank[4]<=8'h4;
	R_Bank[5]<=8'h5;
	R_Bank[6]<=8'h6;
	R_Bank[7]<=8'h7;
	R_Bank[8]<=8'h8;
	R_Bank[9]<=8'h9;
	R_Bank[10]<=8'ha;
	R_Bank[11]<=8'hb;
	R_Bank[12]<=8'hc;
	R_Bank[13]<=8'hd;
	R_Bank[14]<=8'he;
	R_Bank[15]<=8'hf;
	R_Bank[16]<=8'h10;
	R_Bank[17]<=8'h11;
	R_Bank[18]<=8'h12;
	R_Bank[19]<=8'h13;
	R_Bank[20]<=8'h14;
	R_Bank[21]<=8'h15;
	R_Bank[22]<=8'h16;
	R_Bank[23]<=8'h17;
	R_Bank[24]<=8'h18;
	R_Bank[25]<=8'h19;
	R_Bank[26]<=8'h1a;
	R_Bank[27]<=8'h1b;
	R_Bank[28]<=8'h1c;
	R_Bank[29]<=8'h1d;
	R_Bank[30]<=8'h1e;
	R_Bank[31]<=8'h1f;
end

assign A = (mux_sel_A ==2'b00)?reg_A:((mux_sel_A ==2'b01)?ans_ex : ((mux_sel_A ==2'b10)?mux_ans_dm:ans_wb));//MUX A
assign temp_B = (mux_sel_B[1] == 0) ? ((mux_sel_B[0] == 0) ? reg_B: ans_ex) : ((mux_sel_B[0] == 0) ? mux_ans_dm: ans_wb);//MUX B
assign B = (imm_sel==1'b0)?temp_B:imm;//Imm MUX

always@(posedge clk)
begin
	if(reset==1'b0)		//reset condition
	begin
		reg_A <= 8'b00000000;
		reg_B <= 8'b00000000;
	end
	else
	begin
	reg_A <= R_Bank[RA];
	reg_B <= R_Bank[RB];
	R_Bank[RW_dm]<=mux_ans_dm;
	end
end


endmodule
