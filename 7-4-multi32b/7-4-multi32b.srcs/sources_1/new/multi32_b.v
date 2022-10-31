`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/25 22:11:33
// Design Name: 
// Module Name: multi32_b
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


module multi32b
(
    input clk,
    input rst_n,
    input [31:0] x,
    input [31:0] y,
    input in_valid,
    output [63:0] p,
    output reg out_valid
);

reg [31:0] regx;
reg [32:0] regy;
reg [63:0] regp;
reg [6:0] i;
reg working;

initial
begin
    working = 1'b0;
    regp = 64'h0000000000000000;
    regy[0] = 1'b0;// ¸¨ÖúÎ»
end
always @(posedge clk)
begin
    if (rst_n == 1'b0)
    begin
        working = 1'b0; regp = 64'h0000000000000000; regy[0] = 1'b0;
    end
    else
    begin
        if (out_valid == 1'b1) begin out_valid = 1'b0; end
        if (in_valid == 1'b1 && working == 1'b0)
        begin
            i = 6'b0000; working = 1'b1; out_valid = 1'b0;
            regx = x; regy[8:1] = y[7:0]; regy[0] = 1'b0;
        end
        if (working == 1'b1 && i < 7'b0100000)
        begin
            case ({regy[i+1], regy[i]})
                2'b01: begin regp[63:32] = regp[63:32] + regx[15:0]; end
                2'b10: begin regp[63:32] = regp[63:32] + (~regx[15:0] + 1); end
                default: begin end
            endcase
            regp = regp >> 1; regp[63] = regp[62];
            i = i + 1;
            if (i == 7'b0100000) 
            begin 
                //regp[15] = regx[7] ^ regy[7]; regp[14] = regx[7] ^ regy[7]; 
                out_valid = 1'b1; 
            end
        end
    end
end

assign p = regp;
assign iout = i;

endmodule


