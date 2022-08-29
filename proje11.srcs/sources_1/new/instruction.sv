`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2021 22:54:50
// Design Name: 
// Module Name: instruction
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

module instruction( input logic [19:0] data, input logic MemtoReg, MemWrite, AluSrc	, RegWrite ,
                    input logic[1:0] RegSrc,input logic CLK,
                    output logic [7:0] muxRes ,input [7:0]PC,output logic flagZ);
reg [7:0] RD1, RD2;
wire[2:0] A1, A2;
wire[7:0] ALURes;
wire[7:0] ReadData;
mux2_3 muxRa(data[10:8],3'b111,RegSrc[0],A1);
mux2_3 muxRb(data[7:5],data[13:11],RegSrc[1],A2);
register rgstr(A1,A2, data [13:11], CLK, RegWrite, muxRes, RD1, RD2, PC);
wire[7:0] SrcB;
mux2 muxImm(RD2,data[7:0],AluSrc,SrcB);
alu alu1(data[16:14],RD1, SrcB, ALURes,flagZ);
data_memory d_m(CLK,MemWrite,ALURes,RD2,ReadData);
mux2 muxMem(ALURes, ReadData, MemtoReg, muxRes);
endmodule