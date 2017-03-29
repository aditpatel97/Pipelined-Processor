`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Team IntelJr
// Engineer: Jay Mohta, Chintan Mehta, Adit Patel
// 
// Create Date:    14:31:46 08/08/2016 
// Design Name: 
// Module Name:    ALU_8bit 
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
module ALU_8bit(A,B,data_in,op_dec,clk,mem_en_dec,mem_rw_dec,mem_mux_sel_dec,RW_dec,reset,flag_ex,ans_ex,data_out,B_Bypass,
mem_en_ex,mem_rw_ex,mem_mux_sel_ex,RW_ex);

//inputs

input [7:0]A,B,data_in;
input [4:0]op_dec,RW_dec;
input clk,mem_en_dec,mem_rw_dec,mem_mux_sel_dec,reset;

//outputs

output reg [7:0]data_out,B_Bypass;
output reg [7:0]ans_ex;
output reg [4:0]RW_ex;
output wire[3:0]flag_ex;
output reg mem_en_ex,mem_rw_ex,mem_mux_sel_ex;

//datatypes

wire [7:0]add,i_add;
wire overflow_add,carry_add;
wire [7:0]ct;

wire [7:0]ans_temp;

wire [7:0]data_temp_out;

wire [7:0]sub,i_sub;
wire overflow_sub,carry_sub;
wire [7:0]cs;

wire [7:0]temp_B,i_B;

wire [7:0]ans_and;

wire [7:0]ans_or;

wire [7:0]ans_xor;

wire [7:0]ans_not;

wire [7:0]ans_ls;

wire [7:0]ans_rs;

wire [7:0]ans_rsa;

wire [3:0]flag_temp;

wire [7:0]ans_ld;

wire	[7:0] temp_ans_ex;
wire  [7:0] temp_data_out;
wire	[7:0]temp_B_Bypass;
wire	temp_mem_en_ex;
wire	temp_mem_rw_ex;
wire	temp_mem_mux_sel_ex;
wire	[4:0]temp_RW_ex;
reg [3:0]temp_flag;

assign {ct[0],add[0]}=A[0]+B[0];      //Block assigning value after addition operation on 
                                      //both operands  
assign {ct[1],add[1]}=A[1]+B[1]+ct[0];
assign {ct[2],add[2]}=A[2]+B[2]+ct[1];
assign {ct[3],add[3]}=A[3]+B[3]+ct[2];
assign {ct[4],add[4]}=A[4]+B[4]+ct[3];
assign {ct[5],add[5]}=A[5]+B[5]+ct[4];
assign {ct[6],add[6]}=A[6]+B[6]+ct[5];
assign {ct[7],add[7]}=A[7]+B[7]+ct[6];
assign overflow_add=ct[7]^ct[6];
assign carry_add=ct[7];
assign i_add=add;

assign {cs[0],sub[0]}=A[0]+ans_not[0]+1'b1;           //Block assigning value after subtraction operation on 
                                                     //both operands
assign {cs[1],sub[1]}=A[1]+ans_not[1]+cs[0];
assign {cs[2],sub[2]}=A[2]+ans_not[2]+cs[1];
assign {cs[3],sub[3]}=A[3]+ans_not[3]+cs[2];
assign {cs[4],sub[4]}=A[4]+ans_not[4]+cs[3];
assign {cs[5],sub[5]}=A[5]+ans_not[5]+cs[4];
assign {cs[6],sub[6]}=A[6]+ans_not[6]+cs[5];
assign {cs[7],sub[7]}=A[7]+ans_not[7]+cs[6];
assign overflow_sub=cs[7]^cs[6];
assign carry_sub=cs[7];
assign i_sub=sub;                             

assign temp_B=B;            //assignment of value of B         
assign i_B=temp_B;           

assign ans_and=A&B;         //assignment of A and B

assign ans_or=A|B;          //assignment of A or B  

assign ans_xor=A^B;    //assignment of A xor B

assign ans_not=~(B);      //assignment of compliment of B

assign ans_ls=A<<B;        //left shift operation

assign ans_rs=A>>B;    //right shift operation

assign ans_rsa=(B[2:0] == 3'b000) ? ans_rs : 
((B[2:0] == 3'b001) ? {A[7],ans_rs[6:0]}:
((B[2:0] == 3'b010)?{A[7],A[7],ans_rs[5:0]}:
((B[2:0] == 3'b011)?{A[7],A[7],A[7],ans_rs[4:0]}:
((B[2:0] == 3'b100)?{A[7],A[7],A[7],A[7],ans_rs[3:0]}:
((B[2:0] == 3'b101)?{A[7],A[7],A[7],A[7],A[7],ans_rs[2:0]}:
((B[2:0] == 3'b110)?{A[7],A[7],A[7],A[7],A[7],A[7],ans_rs[1:0]}:
((B[2:0] == 3'b111)?{A[7],A[7],A[7],A[7],A[7],A[7],A[7],ans_rs[0]}:A[7:0]))))))) ;        //arithematic right shift operation

assign ans_ld=A;                //holding value of operand A
assign ans_temp=(op_dec==5'b00000) ? add :  // assignment for ADD operation for opcode=0
((op_dec==5'b00001) ? sub :                 // assignment for SUB operation for opcode=1
((op_dec==5'b00010) ? temp_B :              // MOV operation for opcode=2
((op_dec==5'b00100) ? ans_and :            // AND operation for opcode=4
((op_dec==5'b00101) ? ans_or :               // OR operation for opcode=5
((op_dec==5'b00110) ? ans_xor  :             // XOR operation for opcode=6
((op_dec==5'b00111) ? ans_not :              // NOT operation for opcode=7
((op_dec==5'b01000) ? i_add :                 // ADI operation for opcode=8
((op_dec==5'b01001) ? i_sub :                 // SBI operation for opcode=9
((op_dec==5'b01010) ? i_B :                   // MVI operation for opcode=10
((op_dec==5'b01100) ? ans_and :                // assignment for ANI operation 
((op_dec==5'b01101) ? ans_or :                 // assignment for ORI operation
((op_dec==5'b01110) ? ans_xor :                 // assignment for XRI operation
((op_dec==5'b01111) ? ans_not :                  // assignment for NTI operation
((op_dec==5'b10000) ? ans_ex :                   // assignment for RET operation
((op_dec==5'b10001) ? ans_ex :                   // assignment for HLT operation
((op_dec==5'b10100) ? ans_ld:                        // assignment for Loading operation
((op_dec==5'b10101) ? A:                        // assignment for ST operation
((op_dec==5'b10110) ? data_in :                  // assignment for data in 
((op_dec==5'b10111) ? ans_ex :                   // assignment for holding previous answer 
((op_dec==5'b11000) ? ans_ex :
((op_dec==5'b11001) ? ans_ls :
((op_dec==5'b11010) ? ans_rs :
((op_dec==5'b11011) ? ans_rsa :
((op_dec==5'b11100) ? ans_ex :
((op_dec==5'b11101) ? ans_ex :
((op_dec==5'b11110) ? ans_ex :ans_ex
 ))))))))))))))))))))))))));

assign flag_temp=(op_dec==16||op_dec==17) ? 4'b0000 :  //algorithms for holding and resetting flag
((op_dec==2||op_dec==4||op_dec==5||op_dec==6||op_dec==7||op_dec==10||op_dec==12||op_dec==13||op_dec==14||op_dec==15||op_dec==22||op_dec==25||op_dec==26||op_dec==27) ? {ans_temp[0]^ans_temp[1]^ans_temp[2]^ans_temp[3]^ans_temp[4]^ans_temp[5]^ans_temp[6]^ans_temp[7],1'b0,~(ans_temp[0]|ans_temp[1]|ans_temp[2]|ans_temp[3]|ans_temp[4]|ans_temp[5]|ans_temp[6]|ans_temp[7]),1'b0} :
((op_dec==0||op_dec==8) ? {(ans_temp[0]^ans_temp[1]^ans_temp[2]^ans_temp[3]^ans_temp[4]^ans_temp[5]^ans_temp[6]^ans_temp[7]),overflow_add,~(ans_temp[0]|ans_temp[1]|ans_temp[2]|ans_temp[3]|ans_temp[4]|ans_temp[5]|ans_temp[6]|ans_temp[7]),carry_add} :
((op_dec==1||op_dec==9) ? {(ans_temp[0]^ans_temp[1]^ans_temp[2]^ans_temp[3]^ans_temp[4]^ans_temp[5]^ans_temp[6]^ans_temp[7]),overflow_sub,~(ans_temp[0]|ans_temp[1]|ans_temp[2]|ans_temp[3]|ans_temp[4]|ans_temp[5]|ans_temp[6]|ans_temp[7]),carry_sub} :
temp_flag)));


//assign flag_ex=flag_temp;

/*always @(posedge clk)
begin
	temp_flag=flag_temp;
end
*/
assign flag_ex=flag_temp;

//assign data_temp_out = (op_dec==5'b10111||op_dec==5'b11000||op_dec==5'b11001||op_dec==5'b11010||op_dec==5'b11011||op_dec==5'b11100||op_dec==5'b11101||op_dec==5'b11110||op_dec==5'b11111) ? 8'b01000000 : 8'b00000000;
assign data_temp_out = (op_dec==5'b10111) ? A : data_out;

assign temp_ans_ex=(reset==1'b0)?8'b00000000 : ans_temp;
assign temp_B_Bypass=(reset==1'b0)?8'b00000000 : B;
assign temp_data_out=(reset==1'b0)?8'b00000000 : data_temp_out;
assign temp_mem_en_ex=(reset==1'b0)?1'b0 : mem_en_dec; 
assign temp_mem_rw_ex=(reset==1'b0)?1'b0 : mem_rw_dec;
assign temp_mem_mux_sel_ex=(reset==1'b0)?1'b0 : mem_mux_sel_dec;
assign temp_RW_ex=(reset==1'b0)?5'b00000 : RW_dec;


always@(posedge clk) //beginning Of Sequential block for creating memory or to hold a value

	begin                         //for setting the data bits 
		 ans_ex<=temp_ans_ex;     
		 B_Bypass<=temp_B_Bypass;
		 data_out<=temp_data_out;
		mem_en_ex<=temp_mem_en_ex;
		mem_rw_ex<=temp_mem_rw_ex;
		mem_mux_sel_ex<=temp_mem_mux_sel_ex;
		RW_ex<=temp_RW_ex;
		temp_flag=flag_temp;
	end
  

  //End of sequential block

endmodule