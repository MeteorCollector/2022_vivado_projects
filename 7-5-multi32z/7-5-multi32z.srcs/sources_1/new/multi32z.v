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


module multi32z
(
    input [31:0] x,
    input [31:0] y,
    output [63:0] p
);

reg [31:0] regx;
reg [31:0] regy;
reg [32:0] regp [64:0];
integer i;
integer j;
initial
begin
    for(j=0; j<=32; j=j+1)
    begin
        regp[j] = 64'h0000000000000000;
    end
end
always @(*)
begin
    regx = x; j = x; regy = y;
    for (i=0; i<32; i=i+1)
    begin
        if (regy[i] == 1'b1) begin regp[i+1] = regp[i] + j; end
        else begin regp[i+1] = regp[i]; end
        j = j << 1;
    end
    //regp[8] = x * y;
end

assign p = regp[32];

endmodule
