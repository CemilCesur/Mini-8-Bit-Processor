`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2021 22:58:19
// Design Name: 
// Module Name: register
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


module register(input logic[2:0] A1,input logic[2:0] A2,input logic[2:0] A3,
                input CLK, input logic WE3, input logic [7:0] WD3, output logic[7:0] RD1, output logic[7:0] RD2, input logic[7:0]R7);
                
                reg [7:0] rf [7:0];
                initial rf[0] = 8'b00000000;
                initial rf[1] = 8'b00000001;
                initial rf[2] = 8'b00000010;
                initial rf[3] = 8'b00000011;
                initial rf[4] = 8'b00000100;
                initial rf[5] = 8'b00000101;
                initial rf[6] = 8'b00000110;
                initial rf[7] = 8'b00000111;
                                
                always @(posedge CLK)
                begin
                    if(WE3 == 0)
                    begin
                        RD1 <= rf[A1];
                        RD2 <= rf[A2];
                    end
                    else
                    begin
                        RD1 <= rf[A1];
                        RD2 <= rf[A2];
                        rf[A3] <= WD3;
                    end
                    rf[7] <= R7;
                end
                                         
endmodule