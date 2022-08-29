`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2021 23:32:11
// Design Name: 
// Module Name: data_memory
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


module data_memory(input logic CLK, input logic MemWrite,
                   input logic[7:0] A, input logic[7:0]WD, output logic[7:0]out);
    reg [7:0] mem [255:0];
    integer i;
    initial begin  
           for(i=0;i<256;i=i+1)  
                mem[i] <= 8'b00000011;  
    end  
    always@(posedge CLK)
    begin
        if(MemWrite)
            mem[A] <= WD;
        out <= mem[A];
    end
endmodule
