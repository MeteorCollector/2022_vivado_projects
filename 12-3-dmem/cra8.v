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


module walkingcra8(
    output [7:0] f,
    output OF, SF, ZF, CF,
    output cout,
    input [7:0] x, y,
    input sub,
    input cin
);

    wire [7:0] c;
    wire [7:0] p;
    wire [7:0] q;
    wire [7:0] number;
    
    fa(f[0], c[0], p[0], q[0], x[0], number[0], cin);
    fa(f[1], c[1], p[1], q[1], x[1], number[1], c[0]);
    fa(f[2], c[2], p[2], q[2], x[2], number[2], c[1]);
    fa(f[3], c[3], p[3], q[3], x[3], number[3], c[2]);
    fa(f[4], c[4], p[4], q[4], x[4], number[4], c[3]);
    fa(f[5], c[5], p[5], q[5], x[5], number[5], c[4]);
    fa(f[6], c[6], p[6], q[6], x[6], number[6], c[5]);
    fa(f[7], c[7], p[7], q[7], x[7], number[7], c[6]);
    assign cout = c[7];
    assign number = sub ? (~y + 1'b1) : y;
    assign OF = c[7] ^ c[6];
    assign SF = f[7];
    assign ZF = (f == 8'b00000000);
    assign CF = c[7] ^ sub;
    
endmodule
