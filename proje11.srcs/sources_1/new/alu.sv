`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2021 22:55:14
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(input logic [2:0]ALUControl,
input logic[7:0]a,b, 
output logic [7:0]result,output logic flagZ);
wire [7:0] n1,n2,n3,n4,n5,n6,n7,n8;
wire cout;
and g1[7:0](n3,a,b);
or g2[7:0](n4,a,b);
xor g3[7:0](n6,a,b);
and g4[7:0](n8,a,~b);
assign n5=~a;
fulladder fulladder2(.a(b),.b(~a),.cin(1),.s(n7),.cout(cout));
mux2 muks2(.d0(b),.d1(~b),.s(ALUControl[0]),.y(n1));
fulladder fulladder1(.a(a),.b(n1),.cin(ALUControl[0]),.s(n2),.cout(cout));

mux8 muks8(.d0(n2),.d1(n2),.d2(n3),.d3(n4),.d4(n5),.d5(n6),.d6(n7),.d7(n8),.s(ALUControl),.y(result));
and g5(flagZ,~result[7],~result[6],~result[5],~result[4],
            ~result[3],~result[2],~result[1],~result[0]);

endmodule