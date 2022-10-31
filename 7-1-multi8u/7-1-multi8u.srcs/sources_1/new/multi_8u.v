`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/22 19:21:17
// Design Name: 
// Module Name: multi_8u
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


module multi_8u
(
    input clk, //时钟
    input rst_n, //复位信号，低有效
    input [7:0] x, //被乘数
    input [7:0] y, //乘数
    input in_valid, //=1有效时，乘法器开始工作
    output [15:0] p, //乘积
    //output [3:0] iout, //debug、、、、、、、、、、、、、、、、、
    output reg out_valid //=1有效时，表示乘法器结束工作
);
reg signal;
reg [7:0] regx;
reg [7:0] regy;
reg [15:0] regp;
reg [3:0] i;
reg working;

initial
begin
    working = 1'b0;
    regp = 16'h0000;
end
always @(posedge clk)
begin
    if (rst_n == 1'b0)
    begin
        working = 1'b0; regp = 16'h0000;
    end
    else
    begin
        if (out_valid == 1'b1) begin out_valid = 1'b0; end
        if (in_valid == 1'b1 && working == 1'b0)
        begin
            i = 4'b0000; working = 1'b1; out_valid = 1'b0;
            regx = x; regy = y;
        end
        if (working == 1'b1 && i < 4'b1000)
        begin
            if (y[i] == 1'b1) begin regp[15:8] = regp[15:8] + regx[7:0]; end
            regp = regp >> 1; regp[15] = 1'b0;
            i = i + 1;
            if (i == 4'b1000) 
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
