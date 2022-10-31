`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/19 18:45:47
// Design Name: 
// Module Name: Hamming_decode
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
//////////////////////////////////////////////////////////////////////////////////endmodule

module Hamming_Decode(
    output [2:0] F,
    input [6:0] D
    );
    
// ommited

assign F[0:0] = (~((~D[0:0] & D[1:1]) | (D[0:0] & ~D[1:1])) & D[3:3]) | (((~D[0:0] & D[1:1]) | (D[0:0] & ~D[1:1])) & ~D[3:3]);
assign F[1:1] = (~((~D[0:0] & D[2:2]) | (D[0:0] & ~D[2:2])) & D[3:3]) | (((~D[0:0] & D[2:2]) | (D[0:0] & ~D[2:2])) & ~D[3:3]);
assign F[2:2] = D[0:0];
endmodule

