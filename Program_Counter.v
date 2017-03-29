`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Team IntelJr.
// Engineer: Jay Mohta, Chintan Mehta, Adit Patel
// 
// Create Date:    14:48:36 08/22/2016 
// Design Name: 
// Module Name:    Program_Counter 
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
module Program_Counter(jmp_loc,pc_mux_sel,stall,stall_pm,reset,clk,ins,ins_pm,current_address);
//outputs
output [19:0] ins, ins_pm;	
output [7:0] current_address;

//inputs
input [7:0] jmp_loc;
input pc_mux_sel, stall, stall_pm, reset, clk;

//8 bit register
reg [7:0] address_hold, next_address;
reg [19:0]Ins_temp;

wire [7:0] current_address_temp;
wire en;
//temporary variables
wire [7:0]temp_address_hold,temp_next_address;    
reg init;		
wire [19:0]temp_wire;
wire [19:0]temp_ins;
wire [7:0]temp_current_address;
//wire init_temp;

//using inbuilt ROM memory module 
pc_im prog_mem (
  .clka(clk), // input clka
  .ena(en), // input ena
  .addra(current_address), // input [7 : 0] addra
  .douta(temp_wire) // output [19 : 0] douta
);

assign en = 1;
assign temp_address_hold=(reset==1 )? current_address:8'b0;
assign temp_next_address=(reset==1 )? current_address+1'b1:8'b0;
assign temp_ins =(reset==1)?ins:20'b0;
//assign init_temp= ( )

always@(posedge clk)    //program counter block 
begin                   
		address_hold <= temp_address_hold;             //generates new instruction at every positive edge of clk
		next_address <= temp_next_address;      //increment block increments address
		Ins_temp<=temp_ins;
		init<=reset;
	end                                                //register will pass the address to next_address


assign current_address_temp = (stall == 1'b1) ? address_hold : next_address;  //mux to either hold the current address or select next address

assign temp_current_address = (pc_mux_sel == 1'b0) ? current_address_temp : jmp_loc;
assign current_address= ( init== 1'b1)?temp_current_address :8'b0;
assign ins = (stall_pm == 1'b1) ? Ins_temp : temp_wire;   //mux to either pass current instruction or dummy (i.e.0) instruction
assign ins_pm= (init== 1'b1) ? ins : 20'b0;

endmodule
