`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/30 11:52:35
// Design Name: 
// Module Name: CLA4
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


module CLA4(
    output [3:0] f,
    output cout,
    output [3:0] savedcout,
    input [3:0] x, y,
    input cin
    );
    
wire [3:0] p;
wire [3:0] g;
wire [4:1] co;
wire [3:0] ci;
wire [3:0] tmp;// cout of fas are useless

fa(f[0],tmp[0],p[0],g[0],x[0],y[0],cin);
fa(f[1],tmp[1],p[1],g[1],x[1],y[1],co[1]);
fa(f[2],tmp[2],p[2],g[2],x[2],y[2],co[2]);
fa(f[3],tmp[3],p[3],g[3],x[3],y[3],co[3]);
CLU4(co,p,g,cin,ps,gs);
assign cout = co[4];
assign savedcout[3] = co[4];
assign savedcout[2] = co[3];
assign savedcout[1] = co[2];
assign savedcout[0] = co[1];

endmodule
