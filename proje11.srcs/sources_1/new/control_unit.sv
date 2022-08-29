`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2021 23:32:44
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input logic[1:0] op, input logic I, input logic[2:0] cmd,
    output reg MemtoReg, MemWrite, AluSrc, RegWrite, Branch, Jump,
    output reg[1:0] RegSrc
    );
    always @(*)
    begin
        case(op)
        2'b00:
            if(I==0)
            begin
                MemtoReg = 0;
                MemWrite = 0;
                AluSrc = 0;
                RegWrite = 1 ;
                RegSrc = 2'B00;
                Branch = 0;
                Jump = 0;
            end
            else
            begin
                MemtoReg = 0;
                MemWrite = 0;
                AluSrc = 1;
                RegWrite = 1 ;
                RegSrc = 2'B00;
                Branch = 0;
                Jump = 0;
            end
        2'b01:
            if(I == 0 & cmd == 3'b001)
                begin
                MemtoReg = 1;
                MemWrite = 0;
                AluSrc = 0;
                RegWrite = 1 ;
                RegSrc = 2'B00;
                Branch = 0;
                Jump = 0;
            end
            else if(I == 1 & cmd == 3'b001)
                begin
                MemtoReg = 1;
                MemWrite = 0;
                AluSrc = 1;
                RegWrite = 1 ;
                RegSrc = 2'B00;
                Branch = 0;
                Jump = 0;
            end
            else if(I == 0 & cmd == 3'b010)
                begin
                MemtoReg = 1;
                MemWrite = 1;
                AluSrc = 0;
                RegWrite = 0;
                RegSrc = 2'b10;
                Branch = 0;
                Jump = 0;
            end
            else if(I == 1 & cmd == 3'b010)
                begin
                MemtoReg = 1;
                MemWrite = 1;
                AluSrc = 1;
                RegWrite = 0;
                RegSrc = 2'b10;
                Branch = 0;
                Jump = 0;
            end
        2'b10:
            begin
                MemtoReg = 0;
                MemWrite = 0;
                AluSrc = 1;
                RegWrite = 0;
                RegSrc = 2'b11;
                Branch = 1;
                Jump = 0;
            end
        2'b11:
            begin
                MemtoReg = 0;
                MemWrite = 0;
                AluSrc = 0;
                RegWrite = 0;
                RegSrc = 2'b00;
                Branch = 0;
                Jump = 1;
            end
        endcase
        end
endmodule
