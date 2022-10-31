`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 19:12:19
// Design Name: 
// Module Name: div8u_nores
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


module div32u_nores
(
input clk,
input rst_n,
input [31:0] x,
input [15:0] y,
input in_valid,
output [31:0] q,
output [15:0] r,
output reg out_valid,
output reg in_error
);

reg [31:0] regx;
reg [31:0] regy;
reg [79:0] regqr;
reg [6:0] i;
reg working;
reg last;
integer ix, iy, ip;

initial
begin
    working = 1'b0;
    regqr = 80'h00000000000000000000;
    in_error = 1'b0;
    last = 1'b1;
end
/*
always @(*)
begin
    if (x == 8'h00 || x == 8'h80 || y == 4'h0 || y == 4'h8)
    begin
        regqr = 8'h00;
        in_error = 1'b1;
    end
end
*/
always @(posedge clk)
begin
    if (rst_n == 1'b0)
    begin
        working = 1'b0; regqr = 80'h0000000000000000000; in_error = 1'b0;
    end
    else
    begin
        if (out_valid == 1'b1) begin out_valid = 1'b0; end
        if (in_valid == 1'b1 && working == 1'b0)
        begin
            if (x == 32'h00000000 || x == 32'h80000000 || y == 16'h0000 || y == 16'h8000)
            begin
                regqr = 80'h00;
                in_error = 1'b1;
            end
            else
            begin
                in_error = 1'b0;
                i = 4'b0000; working = 1'b1; out_valid = 1'b0;
                regx = x; regy = y; regqr[31:0] = x; regqr[79:32] = 48'h000000000000; last =1'b1;
                regqr = regqr << 1;
                //regx[7] = 1'b0; regy[3] = 1'b0; regqr[7] = 1'b0;// abs
            end
        end
        if (working == 1'b1 && i < 6'b100000)
        begin
            
            if (last == 1'b0)//
            begin
                regqr[79:32] = regqr[79:32] + regy;
            end
            else
            begin
                regqr[79:32] = regqr[79:32] - regy;
                
            end
            if (regqr[48] == 1'b0) begin regqr[0] = 1'b1; last = 1'b1; end
            else begin regqr[0] = 1'b0; last = 1'b0; end
            if (i <= 4'b0111) begin regqr = regqr << 1; end
            i = i + 1;
            
            if (i == 4'b1000) 
            begin
                 if (regqr[48] == 1'b1) begin regqr[79:33] = regqr[79:33] + regy; end //???????
                
                //regp = regp >> 1; regp[15] = 1'b0;
                //regp[15] = regx[7] ^ regy[7]; regp[14] = regx[7] ^ regy[7];
                //regqr[7] = x[7] ^ y[3];// signal
                out_valid = 1'b1; 
                working = 1'b0;
            end
        end
    end
end

assign q = regqr[32:1];
assign r = regqr[48:33];
//assign iout = i;

endmodule
