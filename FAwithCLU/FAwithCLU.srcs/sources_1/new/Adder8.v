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


module Adder8 (
output [7:0] f,
output OF, SF, ZF, CF,
output cout,
input [7:0] x, y,
input sub,
input cin
);

wire [7:0] number;
wire [7:0] cs;
CLA8(f,cout,cs,x,number,cin);

assign number = sub ? (~y + 1'b1) : y;
assign OF = cs[7] ^ cs[6];
assign SF = f[7];
assign ZF = (f == 8'b00000000);
assign CF = cs[7] ^ sub;

endmodule
