`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/30 11:51:57
// Design Name: 
// Module Name: CLA8
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


module CLA8(
    output [7:0] f,
    output cout,
    output [7:0] savedcout,
    input [7:0] x, y,
    input cin
    );
    
wire cinterval;
CLA4(f[3:0],cinterval,savedcout[3:0],x[3:0],y[3:0],cin);
CLA4(f[7:4],cout,savedcout[7:4],x[7:4],y[7:4],cinterval);

endmodule
