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


module div8bnew
(
input sysclk,
input clk, //时钟
input rst_n, //复位信号，低有效
input [7:0] x, //被 除数
input [3:0] y, //除数
input in_valid, //输入为 1时，表示数据准备好了 开始除法运算
output [7:0] q, //商
output [3:0] r, //余数
output reg out_valid, //除法运算结束时，输出为 1
output reg in_error, //被除数或除数为 0时，输出为 1
output [6:0] O_seg,
output [7:0] lit
);

leddisplay leddisplay(sysclk, q[3:0], q[7:4], r[3:0], 4'b0, y[3:0], 4'b0, x[3:0], x[7:4], O_seg, lit);

reg [7:0] regx;
reg [11:0] regy;
reg [19:0] regqr;
reg tmp;
reg [11:0] negy;
reg [7:0] finalq;
reg [7:0] finalr;
integer i;
reg working;
reg opt;
reg display;

reg working2;
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
wire [7:0] tmpq;
wire [7:0] tmpr;

initial
begin
    working = 1'b0;
    regqr = 20'h00000;
    in_error = 1'b0;
    opt = 1'b0;
end
/*
always @(*)
begin
    if (x == 8'h00 || y == 4'h0)
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
        working = 1'b0; regqr = 20'h00000; in_error = 1'b0; display = 1'b0;
    end
    else
    begin
        if (out_valid == 1'b1) begin out_valid = 1'b0; end
        if (in_valid == 1'b1 && working == 1'b0)
        begin
            display = 1'b0;
            //out_valid = 1'b0;
            if (x == 8'h00 || y == 4'h0)
            begin
                regqr = 8'h00;
                in_error = 1'b1;
                finalr = 4'b0;
                finalq = 8'b0;
            end
            else
            begin
                in_error = 1'b0;
                i = 0; working = 1'b1; out_valid = 1'b0;
                regx = x; regy[3:0] = y; regqr[7:0] = x; regqr[19:8] = (x[7] == 1'b1) ? 12'hfff : 12'h000; //opt = regx[7] ^ regy[3];// operation depends on whether same signal or not
                regy[11:4] = (y[3] == 1'b1) ? 8'hff : 8'h00;
                negy = ~regy + 1;
                finalr = regqr[11:8];
                finalq = regqr[7:0];
                //regqr = regqr << 1;
                //regx[7] = 1'b0; regy[3] = 1'b0; regqr[7] = 1'b0;// abs
            end
        end
        if (working == 1'b1 && i < 9)
        begin
            if (i == 0) begin opt = x[7] ^ y[3]; end// 第一次判断被除数和除数符号进行加减
            else begin opt = ~regqr[0]; end// 之后根据前一次上商交替加减
            if (opt == 1'b0)
            begin
                regqr[19:8] = regqr[19:8] + negy[11:0]; // regqr - [19:8]为余数, [7:0]为余数/商；regy - 算术拓展后的y； neqy - 算术拓展后的-y补码
            end
            else
            begin
                regqr[19:8] = regqr[19:8] + regy[11:0];
            end
            tmp = ~(regqr[19] ^ y[3]);// 判断中间余数与除数符号异同进行上商
            if (i == 8) begin regqr[7:0] = {regqr[6:0], 1'b0}; end// 最后一次仅有Q寄存器左移，不影响余数
            else begin regqr[19:0] = {regqr[18:0], 1'b0}; end// 整体左移
            regqr[0] = tmp;// 将商置入寄存器首位
            i = i + 1;
            finalr = regqr[15:8];
            finalq = regqr[7:0];
            
            if (i == 9) 
            begin// 修正
                /*
                if (x[7] != y[3]) begin finalq = finalq + 1; end
                if (finalr[7] != x[7]) 
                begin
                if (finalr[7] == 1'b1) begin finalr = finalr + y; end
                else begin finalr = finalr - y; end
                end
                */
                //regp = regp >> 1; regp[15] = 1'b0;
                //regp[15] = regx[7] ^ regy[7]; regp[14] = regx[7] ^ regy[7];
                //regqr[7] = x[7] ^ y[3];// signal
                out_valid = 1'b1;
                display = 1'b1;
                working = 1'b0;
            end
        end
    end
end



assign reg_r2 = r_sign ? reg_r + reg_b : reg_r;
assign tmpr = x[7] ? (~reg_r2 + 1) : reg_r2;
assign tmpq = (x[7] ^ y[3]) ? (~reg_q + 1) : reg_q;
    
    always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 0;
        working2 <= 0;
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
                working2 <= 1;
            end
        else if (working2) begin
            reg_r <= sub_add[7:0];
            r_sign <= sub_add[8];
            reg_q <= {reg_q[6:0],~sub_add[8]};
            count <= count+1;
            if (count==7) working2 <= 0;
        end
    end
    end    

assign q = (display == 1'b1) ? tmpq : finalq;
assign r = (display == 1'b1) ? tmpr : finalr;


//assign iout = i;

endmodule