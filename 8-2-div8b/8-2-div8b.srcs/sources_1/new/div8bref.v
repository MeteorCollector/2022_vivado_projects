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


module div8bref
(
input clk, //时钟
input rst_n, //复位信号，低有效
input [7:0] x, //被除数
input [3:0] y, //除数
input in_valid, //输入为1时，表示数据准备好了 开始除法运算
output [7:0] q, //商
output [3:0] r, //余数
output reg out_valid, //除法运算结束时，输出为 1
output reg in_error //被除数或除数为 0时，输出为 1
);
    reg working;
    reg [7:0] reg_x;
    reg [7:0] reg_y;
    reg [5:0] count;
    reg [7:0] reg_q;
    reg [7:0] reg_r;
    reg [7:0] reg_b;
    wire [7:0] reg_r2;
    reg r_sign,sign;
    wire [8:0] sub_add = r_sign ? ({reg_r,reg_q[7]} + {1'b0,reg_b}):
                                ({reg_r,reg_q[7]} - {1'b0,reg_b});
    assign reg_r2 = r_sign? reg_r + reg_b : reg_r;
    assign r = x[7] ? (~reg_r2 + 1) : reg_r2;
    assign q = (x[7] ^ y[3]) ? (~reg_q + 1) : reg_q;
    
    always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        count <= 0;
        working <= 0;
    end
    else begin
        if (in_valid) begin
            reg_r <= 8'b0;
            r_sign <= 0;
            if(x[7]==1) begin
                reg_q <= ~x+1;
            end
            else reg_q <= x;
            if (y[3]==1) begin
                reg_b <= ~{4'hf, y}+1;
            end
            else reg_b <= {4'h0, y};
            count <= 0;
            working <= 1;
        end
        else if (working) begin
            reg_r <= sub_add[7:0];
            r_sign <= sub_add[8];
            reg_q <= {reg_q[6:0],~sub_add[8]};
            count <= count+1;
            if (count==7) working <= 0;
        end
    end
    end    
endmodule

