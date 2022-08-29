`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2021 21:03:16
// Design Name: 
// Module Name: instruction_memory
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

module instruction_memory(input logic CLK,output logic [7:0] out,output logic [7:0] PC);
reg [19:0] instructionMemory[4:0];
reg [19:0] data;
reg MemtoReg, MemWrite, AluSrc	, RegWrite , Branch, Jump;
reg [1:0]RegSrc;
wire flagZ;
initial PC  =  8'b00000000;
    

initial instructionMemory[0] = 20'b00_0_000_100_001_010_00000;// r4 = r1+r2
initial instructionMemory[1] = 20'b00_1_000_101_001_00000010;// r5 = r1+2
initial instructionMemory[2] = 20'b01_1_001_110_011_00000011;// r6 = dmem[r3+3]
initial instructionMemory[3] = 20'b00_1_100_110_001_11010000;// r6 = ~r1
initial instructionMemory[4] = 20'b00_1_111_110_001_00001000;// r6 = r1 & ~00001000 => 00000001&11110111 = 00000001



assign data = instructionMemory[5];
Program_Counter pr_cntr(CLK, data[7:0], Jump, PC, PC);
control_unit ctrl(data[19:18], data[17], data[16:14], MemtoReg, MemWrite, AluSrc, RegWrite, Branch, Jump, RegSrc);
instruction datapath(data,MemtoReg, MemWrite, AluSrc, RegWrite ,RegSrc,CLK,out,PC,flagZ);
and g(PCSrc, Branch, flagZ);
fulladder fapc (PC, data[7:0], 0, PCBr);
mux2 muxPc(PC, PCBr, PCSrc, PC);
endmodule