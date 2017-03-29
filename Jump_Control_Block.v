//Jump Control Block 
//Group - IntelJr
//Group No.- 09
//Date - 13/09/16

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:47 09/12/2016 
// Design Name:		Jump Control block for processor 
// Module Name:    Jump_Control_Block 
//  Name: chintan,mohta,adit.
// 
//////////////////////////////////////////////////////////////////////////////////
module Jump_Control_Block(pc_mux_sel,jmp_loc,ins,clk, interrupt,current_address, flag_ex, reset);

input[19:0] ins;			//inputs to stall control block
input clk,reset,interrupt;
input [7:0]current_address;
input [3:0]flag_ex;
output pc_mux_sel;   		//outputs 
output [7:0]jmp_loc;

wire JC,JNC,JZ,JNZ,JMP,RET;
wire temp0,temp1,temp2,temp3,temp4;
wire [7:0]jumpaddress,jumpaddress1;
reg sel_mux_0;
wire [7:0]current_address1;
reg [7:0]current_address2;
wire [3:0]flag_ex1;
reg [3:0]flag_ex2;
wire [3:0]final_flag;
wire and0,and1,and2,and3;

//temporary variables for reset loic 
wire temp_sel_mux_0;
wire [7:0]temp_current_address2;
wire [3:0]temp_flag_ex2; 

assign jumpaddress = ins[7:0];

assign flag0=final_flag[0];           //splitting the bits of final flag 
assign flag1=final_flag[1];


assign temp0 = ins[15];					//temporary variables storing bits of ins
assign temp1 = ins[16];
assign temp2 = ins[17];
assign temp3 = ins[18];
assign temp4 = ins[19];

assign JC = ((~temp0)&(~temp1)&temp2&temp3&temp4);    //conditional jump statements 		
assign JNC = ((~temp1)&(temp0)&(temp2)&(temp3)&(temp4));
assign JZ = ((~temp0)&(temp1)&(temp2)&(temp3)&(temp4));
assign JNZ = ((temp0)&(temp1)&temp2&temp3&temp4);
assign JMP = ((~temp0)&(~temp1)&(~temp2)&temp3&temp4);     //unconditional jump

assign temp_sel_mux_0=(reset==1)? interrupt:1'b0;

always@(posedge clk)
begin
		sel_mux_0 <= temp_sel_mux_0;
		current_address2 <= temp_current_address2; 		//we assign current_address2 as current_address1
		flag_ex2 <= temp_flag_ex2;                //we assign flag_ex2 as flag_ex1

end

assign jumpaddress1= (sel_mux_0==1'b0) ? jumpaddress : 8'hf0; //when sel_mux_0 is 1 programs jump to interrupt location

assign temp_current_address2=(reset==1)?current_address1:8'b0;
                                                              //8'hf0
/*always@(posedge clk)
begin
		current_address2 <= temp_current_address2; 		//we assign current_address2 as current_address1
		flag_ex2 <= temp_flag_ex2;                //we assign flag_ex2 as flag_ex1

end
*/
assign current_address1 =(interrupt==1'b0) ? current_address2 :current_address; //if interrupt is 0 feedback is given to 
																				//current_address1			
assign temp_flag_ex2=(reset==1)?flag_ex1:4'b0;

/*always@(posedge clk)
begin
flag_ex2 <= temp_flag_ex2;                //we assign flag_ex2 as flag_ex1 
end
*/
assign flag_ex1= (interrupt==1'b0) ?flag_ex2:flag_ex;	//when interrupt occurs(is 1) program feedback 
                                                        //flag_ex1
assign RET = ((~temp0)&(~temp1)&(~temp2)&(~temp3)&temp4);

assign final_flag= (RET==1'b0)?flag_ex:flag_ex2; 

assign jmp_loc=(RET==0) ? jumpaddress1:current_address2;

assign and0=(JC&(flag0));
assign and1=(JNC&(~flag0));
assign and2=(JZ&(flag1));
assign and3=(JNZ&(~flag1));

assign pc_mux_sel= (and0|and1|and2|and3|RET|JMP|sel_mux_0);//in case of RET,conditional and unconditional jump 
															//instructions pc_mux_sel will be 1 else 0								


endmodule
