`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 20:17:49
// Design Name: 
// Module Name: div8b
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


module div32b
(
input clk,
input rst_n,
input [31:0] x, //?? ????
input [15:0] y, //????
input in_valid, //
output [31:0] q, //??
output [15:0] r, //????
output reg out_valid, //
output reg in_error
);

reg [18:0] regx;
reg [47:0] regy;
reg [79:0] regqr;
reg tmp;
reg [47:0] negy;
reg [31:0] finalq;
reg [31:0] finalr;
integer i;
reg working;
reg opt;

initial
begin
    working = 1'b0;
    regqr = 80'h00000;
    in_error = 1'b0;
    opt = 1'b0;
end


always @(posedge clk)
begin
    if (rst_n == 1'b0)
    begin
        working = 1'b0; regqr = 80'h00000; in_error = 1'b0;
    end
    else
    begin
        if (out_valid == 1'b1) begin out_valid = 1'b0; end
        if (in_valid == 1'b1 && working == 1'b0)
        begin
            if (x == 32'h00 || y == 16'h0)
            begin
                regqr = 32'h00;
                in_error = 1'b1;
                finalr = 16'b0;
                finalq = 32'b0;
            end
            else
            begin
                in_error = 1'b0;
                i = 0; working = 1'b1; out_valid = 1'b0;
                regx = x; regy[15:0] = y; regqr[31:0] = x; regqr[79:32] = (x[31] == 1'b1) ? 48'hffffffffffff : 48'h000000000000; //opt = regx[7] ^ regy[3];// operation depends on whether same signal or not
                regy[47:16] = (y[15] == 1'b1) ? 8'hff : 8'h00;
                negy = ~regy + 1;
                finalr = regqr[47:32];
                finalq = regqr[31:0];
                //regqr = regqr << 1;
                //regx[7] = 1'b0; regy[3] = 1'b0; regqr[7] = 1'b0;// abs
            end
        end
        if (working == 1'b1 && i < 33)
        begin
            if (i == 0) begin opt = x[31] ^ y[15]; end
            else begin opt = ~regqr[0]; end
            if (opt == 1'b0)
            begin
                regqr[79:32] = regqr[79:32] + negy[47:0];
            end
            else
            begin
                regqr[79:32] = regqr[79:32] + regy[47:0];
            end
            tmp = ~(regqr[79] ^ y[15]);
            if (i == 32) begin regqr[31:0] = {regqr[30:0], 1'b0}; end
            else begin regqr[79:0] = {regqr[78:0], 1'b0}; end
            regqr[0] = tmp;
            i = i + 1;
            finalr = regqr[79:32];
            finalq = regqr[31:0];
            
            if (i == 33) 
            begin// ????
                if (x[31] != y[15]) begin finalq = finalq + 1; end
                if (finalr[31] != x[31]) 
                begin
                if (finalr[31] == 1'b1) begin finalr = finalr + y; end
                else begin finalr = finalr - y; end
                end
                
                //regp = regp >> 1; regp[15] = 1'b0;
                //regp[15] = regx[7] ^ regy[7]; regp[14] = regx[7] ^ regy[7];
                //regqr[7] = x[7] ^ y[3];// signal
                out_valid = 1'b1; 
                working = 1'b0;
            end
        end
    end
end

assign q = finalq;
assign r = finalr;
//assign myreg = regqr;
//assign iout = i;

endmodule