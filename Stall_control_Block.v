//Stall Control Block 
//Group - IntelJr
//Group No.- 09
//Date - 09/09/16

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:44 09/09/2016 
// Design Name: 
// Module Name:    Stall_control_Block 
// Name:				Jay Mohta,Chintan Mehta,Adit Patel
//
//////////////////////////////////////////////////////////////////////////////////
module Stall_control_Block(ins_pm,clk,reset,stall,stall_pm);

input[19:0] ins_pm;			//inputs to stall control block
input clk,reset;

output stall,stall_pm;		//outputs of stall control block
reg stall_pm;

wire temp1,temp2,temp3,temp4,temp5;		//thse are temporary wires
wire hlt,ld,jump;
reg Q_temp1,Q_temp2,Q_temp3;

assign temp1 = ins_pm[15];					//temporary variables storing bits of ins_pm
assign temp2 = ins_pm[16];
assign temp3 = ins_pm[17];
assign temp4 = ins_pm[18];
assign temp5 = ins_pm[19];

wire temp_Q_temp1,temp_Q_temp2,temp_Q_temp3,temp_stall_pm;
assign temp_Q_temp1=(reset==1'b0)?1'b0:ld;
assign temp_Q_temp2=(reset==1'b0)?1'b0:jump;
assign temp_Q_temp3=(reset==1'b0)?1'b0:Q_temp2;
assign temp_stall_pm=(reset==1'b0)?1'b0:stall;

always@(posedge clk)						//D-Flipflop for load type instruction creating a delay of one  cycle
begin
		Q_temp1<=temp_Q_temp1;
	Q_temp2<=temp_Q_temp2;	
	Q_temp3<=temp_Q_temp3;
	stall_pm<=temp_stall_pm;
end

/*always@(posedge clk)						//for jump instruction creating a delay of two cylces
begin
		Q_temp2<=temp_Q_temp2;
	end

always@(posedge clk)
begin
		Q_temp3<=temp_Q_temp3;
	end

always@(posedge clk)							//flip flop for stall_pm
begin
		stall_pm<=temp_stall_pm;
	end
*/

assign jump= (temp5&temp4&temp3&(~Q_temp3)); 		//all the and gates
assign ld= ((~temp1)&(~temp2)&temp3&(~temp4)&temp5&(~Q_temp1));
assign hlt= ((temp1)&(~temp2)&(~temp3)&(~temp4)&temp5);

assign stall=(reset == 1'b0)? 1'b0 : (jump|ld|hlt);

endmodule
