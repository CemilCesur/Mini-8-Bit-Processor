`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2021 15:17:08
// Design Name: 
// Module Name: Program Counter
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


module Program_Counter(input logic CLK, input reg[7:0]data_addr, input reg Jump, input reg[7:0]PC, output reg[7:0] PC_1);
    always@(posedge CLK)
        PC = PC + 8'b00000001;
        mux2 muxPC(PC,(PC+data_addr),Jump, PC_1);
endmodule
