`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.07.2021 02:22:25
// Design Name: 
// Module Name: micro_tb
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


module micro_tb();
logic CLK;
logic [7:0] out;
logic [7:0] PC;
instruction_memory dut(CLK,out,PC);
initial begin
CLK = 0;
forever #50 CLK = ~CLK;
end
endmodule
