`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/19 16:24:50
// Design Name: 
// Module Name: Hamming_Code
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


module Hamming_Code(
    input [3:0] D,
    output [6:0] F
    );

assign F[0:0] = (~((~D[0:0] & D[1:1]) | (D[0:0] & ~D[1:1])) & D[3:3]) | (((~D[0:0] & D[1:1]) | (D[0:0] & ~D[1:1])) & ~D[3:3]);
assign F[1:1] = (~((~D[0:0] & D[2:2]) | (D[0:0] & ~D[2:2])) & D[3:3]) | (((~D[0:0] & D[2:2]) | (D[0:0] & ~D[2:2])) & ~D[3:3]);
assign F[2:2] = D[0:0];
assign F[3:3] = (~((~D[1:1] & D[2:2]) | (D[1:1] & ~D[2:2])) & D[3:3]) | (((~D[1:1] & D[2:2]) | (D[1:1] & ~D[2:2])) & ~D[3:3]);
assign F[4:4] = D[1:1];
assign F[5:5] = D[2:2];
assign F[6:6] = D[3:3];
endmodule
