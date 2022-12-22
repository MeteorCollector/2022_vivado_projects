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


module CLU4(c,p,g,c0,ps,gs);
    output [4:1] c;
    input [4:1] p, g;
    input c0;
    output ps, gs;
    
    wire w11, w21, w22, w31, w32, w33, w41, w42, w43, w44;
    
    and(w11, p[1], c0);
    and(w21, p[2], g[1]);
    and(w22, p[2], p[1], c0);
    and(w31, p[3], g[2]);
    and(w32, p[3], p[2], g[1]);
    and(w33, p[3], p[2], p[1], c0);
    and(w41, p[4], g[3]);
    and(w42, p[4], p[3], g[2]);
    and(w43, p[4], p[3], p[2], g[1]);
    and(w44, p[4], p[3], p[2], p[1], c0);
    
    or(c[1], g[1], w11);
    or(c[2], g[2], w21, w22);
    or(c[3], g[3], w31, w32, w33);
    or(c[4], g[4], w41, w42, w43, w44);
    and(ps, p4, p3, p2, p1);
    or(gs, g[4], p[4]&g[3], p[4]&p[3]&g[2], p[4]&p[3]&p[2]&g[1]);
endmodule
