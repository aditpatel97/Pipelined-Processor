`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Group:09 IntelJr 
// Name: Chintan,Adit,Jay Mohta
// 
// Create Date:    15:54:09 10/02/2016 
// Design Name: 
// Module Name:    Dependency_check 
//Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module Dependency_check(mux_sel_A,mux_sel_B,imm_sel,imm,mem_en_dec,mem_rw_dec,mem_mux_sel_dec,RW_dec,op_dec,ins,clk,reset);

output [1:0]mux_sel_A,mux_sel_B;
output imm_sel;
output [7:0]imm;
output mem_en_dec,mem_rw_dec,mem_mux_sel_dec;
output [4:0]RW_dec,op_dec;
input [19:0]ins;
input clk,reset;
wire temp0,temp1,temp2,temp3,temp4;
wire And_ld,And_imm,And2,And3,And4,And5,And6,And7,knor1;
wire [14:0]And1;
//wire [14:0]extended;
wire [4:0]temp;
reg [4:0]op_dec;
//reg [14:0]extended;
reg Q_temp1,Q_temp2,Q_temp3; 
reg imm_sel;
wire [4:0]i_temp1;
//wire [4:0]i_temp2;
//wire [4:0]i_temp3;
reg [4:0]R1,R2,R3,R4,R5,R6;
//reg [7:0]Imm;
wire C1,C2,C3,C4,C5,C6;
wire [4:0]A1_temp1,A1_temp2,A1_temp3;
wire A1,A2,A3,A4;
reg [4:0]ins_temp;
//temporary variables for resetting 
wire temp_Q_temp1;
wire [4:0]temp_op_dec,temp_R1,temp_R2,temp_R3,temp_R4,temp_R5,temp_R6;
wire temp_imm_sel;
wire temp_Q_temp3;	
wire [4:0]temp_ins_temp;


assign temp=ins[19:15];
assign i_temp1=ins[4:0];
//assign i_temp2[4:0]=ins[9:5];
//assign i_temp3[4:0]=ins[14:10];

assign temp0 = ins[15];					//temporary variables storing bits of ins
assign temp1 = ins[16];
assign temp2 = ins[17];
assign temp3 = ins[18];
assign temp4 = ins[19];

	assign temp_op_dec=(reset == 1'b1 )?temp:5'b0;
	
	/*always@(posedge clk)
begin
		op_dec <= temp_op_dec;
		Q_temp1<=temp_Q_temp1;
		imm_sel<=temp_imm_sel;
		Q_temp2<=temp_Q_temp2;
		Q_temp3<=temp_Q_temp3;
		ins_temp <= temp_i_temp1;
		R1 <= temp_R1;
		R2 <= temp_R2;
		R3 <= temp_R3;
		R4 <= temp_R4;
		R5 <= temp_R5;
		R6 <= temp_R6;
	
	end
	*/
	assign And_ld=((~temp1)&temp2&(~temp3)&temp4);
	assign And_imm=((~temp4)&temp3);
	assign And2=((~temp0)&(~temp1)&(~temp2)&(temp3)&(temp4));
	assign And3=((temp2)&(temp3)&(temp4));
	assign And4=((~temp0)&(~temp1)&(temp2)&(~temp3)&(temp4)&(~Q_temp1));
	
	
	assign temp_Q_temp1=(reset == 1'b1 )?And4:1'b0;
//	always@(posedge clk)						//D-Flipflop for load type instruction creating a delay of one  cycle

//	begin
//		Q_temp1<=temp_Q_temp1;
	//end

	assign knor1=(~(And2|And3|Q_temp1));
	
	//always @( posedge clk ) 
	//begin
    //extended[14:0] <= { 14'b0,knor1 };
	//end
	
	assign And1[0]=(ins[0]&knor1);
	assign And1[1]=(ins[1]&knor1);
	assign And1[2]=(ins[2]&knor1);
	assign And1[3]=(ins[3]&knor1);
	assign And1[4]=(ins[4]&knor1);
	assign And1[5]=(ins[5]&knor1);
	assign And1[6]=(ins[6]&knor1);
	assign And1[7]=(ins[7]&knor1);
	assign And1[8]=(ins[8]&knor1);
	assign And1[9]=(ins[9]&knor1);
	assign And1[10]=(ins[10]&knor1);
	assign And1[11]=(ins[11]&knor1);
	assign And1[12]=(ins[12]&knor1);
	assign And1[13]=(ins[13]&knor1);
	assign And1[14]=(ins[14]&knor1);


//assign And1[0]=(ins[0]&knor1);

	
	//assign And1[14:0]=(extended[14:0]&ins[14:0]);
	
	
	assign A1_temp1=And1[4:0];
	assign A1_temp2=And1[9:5];
	assign A1_temp3=And1[14:10];
	
	assign temp_imm_sel=(reset == 1'b1 )?And_imm:1'b0;
	
	//always@(posedge clk)						//D-Flipflop for 

	//begin
		//imm_sel<=temp_imm_sel;
	//end

	
	assign And5=(temp0&(~Q_temp2));
	wire temp_Q_temp2;
	assign temp_Q_temp2=(reset == 1'b1 )?And5:1'b0;
	
	//always@(posedge clk)						//D-Flipflop 

	//begin
		//Q_temp2<=temp_Q_temp2;
	//end

assign mem_rw_dec=Q_temp2;

assign And6=(And_ld&(~Q_temp2));

	assign temp_Q_temp3=(reset == 1'b1 )?And6:1'b0;
	
//	always@(posedge clk)						//D-Flipflop for load type 

	//begin
	//Q_temp3<=temp_Q_temp3;
//end

	assign And7=((~Q_temp2)&Q_temp3);
	assign mem_mux_sel_dec=And7;
	assign mem_en_dec=Q_temp3;
	
	//assign ins_temp[7:0]={4'b0000,i_temp1[4:0]};
	
	//assign ins_temp[7:5]=3'b000;
	//assign ins_temp[4:0]=i_temp1[4:0];
	
	assign temp_ins_temp[4:0]=(reset == 1'b1 )?i_temp1[4:0]:5'b0;
	/*always@(posedge clk)
	begin
		ins_temp <= temp_i_temp1;
	end
	*/
	//And1=([14:0]&extended[14:0]);
	assign imm[7:0]={3'b000,ins_temp[4:0]};
		
	assign temp_R1[4:0]=(reset == 1'b1 )?A1_temp2[4:0]:5'b0;
	assign temp_R2[4:0]=(reset == 1'b1 )?A1_temp3[4:0]:5'b0;
	assign temp_R3[4:0]=(reset == 1'b1 )?R2[4:0]:5'b0;
	assign temp_R4[4:0]=(reset == 1'b1 )?R3[4:0]:5'b0;
	assign temp_R5[4:0]=(reset == 1'b1 )?R4[4:0]:5'b0;
	assign temp_R6[4:0]=(reset == 1'b1 )?A1_temp1[4:0]:5'b0;
	
	assign RW_dec[4:0]=R2;//actually down

	
	/*always@(posedge clk)
begin
		R1 <= temp_R1;
		R2 <= temp_R2;
		R3 <= temp_R3[4:0];
		R4 <= temp_R4[4:0];
		R5 <= temp_R5[4:0];
		R6 <= temp_R6[4:0];
	end
*/
	always@(posedge clk)
	begin
		op_dec <= temp_op_dec;
		Q_temp1<=temp_Q_temp1;
		imm_sel<=temp_imm_sel;
		Q_temp2<=temp_Q_temp2;
		Q_temp3<=temp_Q_temp3;
		ins_temp <= temp_ins_temp;
		R1 <= temp_R1;
		R2 <= temp_R2;
		R3 <= temp_R3;
		R4 <= temp_R4;
		R5 <= temp_R5;
		R6 <= temp_R6;
	
	end


assign C1= (R3==R1)?1'b1:1'b0;
assign C2= (R4==R1)?1'b1:1'b0;
assign C3= (R5==R1)?1'b1:1'b0;
assign C4= (R3==R6)?1'b1:1'b0;
assign C5= (R4==R6)?1'b1:1'b0;
assign C6= (R5==R6)?1'b1:1'b0;

assign A1=((~C1)&C2);
assign A2=((~C1)&(~C2)&C3);
assign A3=((~C4)&C5);
assign A4=((~C4)&(~C5)&C6);

assign mux_sel_A = ((A2==1)?2'b11:((A1==1)?2'b10:((C1==1)?2'b01:2'b00)));
assign mux_sel_B = ((A4==1)?2'b11:((A3==1)?2'b10:((C4==1)?2'b01:2'b00)));



endmodule
