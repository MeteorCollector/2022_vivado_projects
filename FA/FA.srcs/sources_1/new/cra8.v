`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 06:35:06
// Design Name: 
// Module Name: cra8
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


module cra8(f,cout,x,y,cin);
    output [7:0] f;
    output cout;
    input [7:0] x, y;
    input cin;
    wire c[7:0];
    wire p[7:0];
    wire q[7:0];
    fa(f[0], c[0], p[0], q[0], x[0], y[0], cin);
    fa(f[1], c[1], p[1], q[1], x[1], y[1], c[0]);
    fa(f[2], c[2], p[2], q[2], x[2], y[2], c[1]);
    fa(f[3], c[3], p[3], q[3], x[3], y[3], c[2]);
    fa(f[4], c[4], p[4], q[4], x[4], y[4], c[3]);
    fa(f[5], c[5], p[5], q[5], x[5], y[5], c[4]);
    fa(f[6], c[6], p[6], q[6], x[6], y[6], c[5]);
    fa(f[7], c[7], p[7], q[7], x[7], y[7], c[6]);
    assign cout = c[7];
    
endmodule
