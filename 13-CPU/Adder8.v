`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/02 14:54:48
// Design Name: 
// Module Name: Adder8
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
module Adder32 (
output [31:0] f,
output OF, SF, ZF, CF,
output cout,
input [31:0] x, y,
input sub,
input cin
);

wire [31:0] number;
wire [31:0] cs;
wire cint1, cint2, cint3;
CLA8 cla1(f[7:0],cint1,cs[7:0],x[7:0],number[7:0],sub);
CLA8 cla2(f[15:8],cint2,cs[15:8],x[15:8],number[15:8],cint1);
CLA8 cla3(f[23:16],cint3,cs[23:16],x[23:16],number[23:16],cint2);
CLA8 cla4(f[31:24],cout,cs[31:24],x[31:24],number[31:24],cint3);

assign cin = 1'b0;//undefined in simulations
assign number = sub ? ~y : y;
assign OF = cs[31] ^ cs[30];// | ((sub==1'b1) & (y==32'h80000000));
assign SF = f[31];
assign ZF = (f == 32'h00000000);
assign CF = cout ^ sub;

endmodule