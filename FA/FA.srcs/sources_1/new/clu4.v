`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 15:06:37
// Design Name: 
// Module Name: clu4
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


module CLU4(c,p,g,c0);
    output [4:1] c;
    input [4:1] p, g;
    input c0;
endmodule
module CLA8 (
    output [7:0] f,
    output cout,
    input [7:0] x, y,
    input cin
);

    
    wire c1, c2 ,c3, c4, c5, c6, c7;
    wire p0, p1, p2, p3, p4, p5, p6, p7;
    wire g0, g1, g2, g3, g4, g5, g6, g7;
    fa FA1(f[0], c[0], p[0], q[0], x[0], y[0], cin);
    or(c1, g1, p1&c0);
    or(c2, g2, p2&g1, p2&p1&c0);
    or(c3, g3, p3&g2, p3&p2&g1, p3&p2&p1&c0);
    or(c4, g4, p4&g3, p4&p3&g2, p4&p3&p2&g1, p4&p3&p2&p1&c0);
    or(c5, g5, p5&g4, p5&p4&g3, p5&p4&p3&g2, p5&p4&p3&p2&g1, p5&p4&p3&p2&p1&c0);
    or(c6, g6, p6&g5, p6&p5&g4, p6&p5&p4&g3, p6&p5&p4&p3&g2, p6&p5&p4&p3&p2&g1, p6&p5&p4&p3&p2&p1&c0);
    or(c7, g7, p7&g6, p7&p6&g5, p7&p6&p5&g4, p7&p6&p5&p4&g3, p7&p6&p5&p4&p3&g2, p7&p6&p5&p4&p3&p2&g1, p7&p6&p5&p4&p3&p2&p1&c0);

endmodule
