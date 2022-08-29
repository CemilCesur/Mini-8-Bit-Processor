`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2021 22:57:24
// Design Name: 
// Module Name: fulladder2
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


module fulladder2(input logic a, b, cin,
output logic s, cout);

 assign s=a^b^cin;
 assign cout= (a^b)&cin|a&b;
endmodule

