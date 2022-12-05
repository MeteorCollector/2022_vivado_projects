`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 06:14:13
// Design Name: 
// Module Name: fa
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


module fa(f,cout,p,g,x,y,cin);
    output f,cout,p,g;
    input x,y,cin;
    
assign cout = (x & y) |  (x & cin) | (y & cin);
assign f = x ^ y ^ cin;
assign g = x & y;
assign p = x | y;
endmodule
