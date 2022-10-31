`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/22 23:48:31
// Design Name: 
// Module Name: multi8z
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


module multi_8z
(
    input sysclk,
    input [7:0] x,
    input [7:0] y,
    output [15:0] p,
    output [6:0] O_seg,
    output [7:0] lit
);

reg [15:0] regx;
reg [7:0] regy;
reg [15:0] regp [8:0];
integer i;
integer j;
leddisplay display(sysclk, regp[8][3:0], regp[8][7:4], regp[8][11:8], regp[8][15:12], regx[3:0], regx[7:4], regy[3:0], regy[7:4], O_seg, lit);
initial
begin
    for(j=0; j<8; j=j+1)
    begin
        regp[j] = 16'h0000;
    end
end
always @(*)
begin
    regx = x; j = x; regy = y;
    for (i=0; i<8; i=i+1)
    begin
        if (regy[i] == 1'b1) begin regp[i+1] = regp[i] + j; end
        else begin regp[i+1] = regp[i]; end
        j = j << 1;
    end
    //regp[8] = x * y;
end

assign p = regp[8];

endmodule
