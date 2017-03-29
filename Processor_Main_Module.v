`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Team IntelJr
// Engineer: Jay Mohta, Chintan Mehta, Adit Patel
// 
// Create Date:    15:51:55 10/03/2016 
// Design Name: 
// Module Name:    Processor_Main_Module 
// Project Name: 
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
module Processor_Main_Module(data_in,clk,reset,data_out,ins,A,B,current_address,ans_ex,mux_ans_dm,ans_wb,interrupt);

input [7:0] data_in;
input clk;
input interrupt;
input reset;
output [7:0] data_out;


				// output for verification:

output [19:0] ins;
output [7:0] A;
output [7:0] B;
output [7:0] current_address;
output [7:0] ans_ex;
output [7:0] mux_ans_dm;
output [7:0] ans_wb;

 wire [4:0]op_dec,RW_dec,RW_dm,RW_ex;
 wire mem_en_dec,mem_rw_dec,mem_mux_sel_ex,mem_mux_sel_dec,mem_en_ex,mem_rw_ex,stall,pc_mux_sel,stall_pm,imm_sel;
 wire [1:0]mux_sel_A,mux_sel_B;
 wire [3:0]flag_ex;
 wire [7:0]B_Bypass,jmp_loc,imm;
 wire [19:0] ins_pm;

ALU_8bit alu(A,B,data_in,op_dec,clk,mem_en_dec,mem_rw_dec,mem_mux_sel_dec,RW_dec,reset,flag_ex,ans_ex,data_out,B_Bypass,
mem_en_ex,mem_rw_ex,mem_mux_sel_ex,RW_ex);

Data_mem data_mem_call(mux_ans_dm,RW_dm,ans_ex,B_Bypass,RW_ex,mem_en_ex,mem_rw_ex,mem_mux_sel_ex,clk,reset );

Dependency_check dep_check(mux_sel_A,mux_sel_B,imm_sel,imm,mem_en_dec,mem_rw_dec,mem_mux_sel_dec,RW_dec,op_dec,ins,clk,reset);

Program_Counter prog_counter_call(jmp_loc,pc_mux_sel,stall,stall_pm,reset,clk,ins,ins_pm,current_address);

Reg_Bank reg_bank_call(ins,RW_dm,ans_ex,mux_ans_dm,ans_wb,imm,mux_sel_A,mux_sel_B,imm_sel,clk,reset,A,B);

Jump_Control_Block jmp_ctrl_block(pc_mux_sel,jmp_loc,ins,clk, interrupt,current_address, flag_ex, reset);

Stall_control_Block stl_ctrl_call(ins_pm,clk,reset,stall,stall_pm);

Write_Back wb_call(clk,reset,mux_ans_dm,ans_wb);


endmodule

