`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/19 14:44:40
// Design Name: 
// Module Name: FILE4to4
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


module FILE4to4(
    output [3:0] Y0,Y1,Y2,Y3,
    input [3:0] D0,D1,D2,D3,
    input [1:0] S
    );
    assign Y0 = (~S[1] & ~S[0]) ? D0 : 4'bz;
    assign Y1 = (~S[1] & S[0]) ? D1 : 4'bz;
    assign Y2 = (S[1] & ~S[0]) ? D2 : 4'bz;
    assign Y3 = (S[1] & S[0]) ? D3 : 4'bz;
endmodule
