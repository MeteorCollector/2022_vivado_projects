`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 14:06:24
// Design Name: 
// Module Name: div8u_res
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


module div8u_res
(
input clk, //时钟
input rst_n, //复位信号，低有效
input [7:0] x, //被 除数
input [3:0] y, //除数
input in_valid, //输入为 1时，表示数据准备好了 开始除法运算
output [7:0] q, //商
output [3:0] r, //余数
output reg out_valid, //除法运算结束时，输出为 1
output reg in_error //被除数或除数为 0时，输出为 1
);

reg [7:0] regx;
reg [7:0] regy;
reg [15:0] regqr;
reg [3:0] i;
reg working;
integer ix, iy, ip;

initial
begin
    working = 1'b0;
    regqr = 16'h0000;
    in_error = 1'b0;
end

always @(*)
begin
    if (x == 8'h00 || x == 8'h80 || y == 4'h0 || y == 4'h8)
    begin
        regqr = 8'h00;
        in_error = 1'b1;
    end
end

always @(posedge clk)
begin
    if (rst_n == 1'b0)
    begin
        working = 1'b0; regqr = 16'h0000; in_error = 1'b0;
    end
    else
    begin
        if (out_valid == 1'b1) begin out_valid = 1'b0; end
        if (in_valid == 1'b1 && working == 1'b0)
        begin
            if (x == 8'h00 || x == 8'h80 || y == 4'h0 || y == 4'h8)
            begin
                regqr = 8'h00;
                in_error = 1'b1;
            end
            else
            begin
                i = 4'b0000; working = 1'b1; out_valid = 1'b0;
                in_error = 1'b0;
                regx = x; regy = y; regqr[7:0] = x; regqr[15:8] = 8'h00;
                //regx[7] = 1'b0; regy[3] = 1'b0; regqr[7] = 1'b0;// abs
            end
        end
        if (working == 1'b1 && i <= 4'b1000)
        begin
            regqr[15:8] = regqr[15:8] - regy;
            if (regqr[15] == 1'b0)
            begin
                regqr = regqr << 1;
                regqr[0] = 1'b1;
            end
            else
            begin
                regqr[15:8] = regqr[15:8] + regy;
                regqr = regqr << 1;
                regqr[0] = 1'b0;
            end
            i = i + 1;
            
            if (i == 4'b1001) 
            begin
                //regp = regp >> 1; regp[15] = 1'b0;
                //regp[15] = regx[7] ^ regy[7]; regp[14] = regx[7] ^ regy[7];
                //regqr[7] = x[7] ^ y[3];// signal
                out_valid = 1'b1; 
                working = 1'b0;
            end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        end
    end
end

assign q = regqr[7:0];
assign r = regqr[12:9];
assign myreg = regqr[15:0];
//assign iout = i;

endmodule
