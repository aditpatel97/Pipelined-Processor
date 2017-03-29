`timescale 1us / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Team IntelJr
// Engineer: Jay Mohta, Chintan Mehta, Adit Patel
// 
// Create Date:    12:15:10 10/05/2016 
// Design Name: 
// Module Name:    Write_Back 
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
module Write_Back(clk,reset,mux_ans_dm,ans_wb);

input clk,reset;
input [7:0]mux_ans_dm;
output reg [7:0]ans_wb;

wire [7:0]temp_ans_wb;
assign temp_ans_wb=(reset==1'b0)?8'h00:mux_ans_dm;
always@(posedge clk)
begin
	ans_wb<=temp_ans_wb;
end

endmodule
