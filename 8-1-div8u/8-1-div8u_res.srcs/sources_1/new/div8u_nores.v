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


module div8u_nores
(
input clk, //ʱ��
input rst_n, //��λ�źţ�����Ч
input [7:0] x, //�� ����
input [3:0] y, //����
input in_valid, //����Ϊ 1ʱ����ʾ����׼������ ��ʼ��������
output [7:0] q, //��
output [3:0] r, //����
output reg out_valid, //�����������ʱ�����Ϊ 1
output reg in_error //�����������Ϊ 0ʱ�����Ϊ 1
);

reg [7:0] regx;
reg [7:0] regy;
reg [19:0] regqr;
reg [3:0] i;
reg working;
reg last;
integer ix, iy, ip;

initial
begin
    working = 1'b0;
    regqr = 20'h00000;
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
        working = 1'b0; regqr = 20'h00000; in_error = 1'b0;
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
                in_error = 1'b0;
                i = 4'b0000; working = 1'b1; out_valid = 1'b0;
                regx = x; regy = y; regqr[7:0] = x; regqr[15:8] = 12'h000; last =1'b1;
                regqr = regqr << 1;
                //regx[7] = 1'b0; regy[3] = 1'b0; regqr[7] = 1'b0;// abs
            end
        end
        if (working == 1'b1 && i < 4'b1000)
        begin
            
            if (last == 1'b0)// ����һ�����������Ӽ�
            begin
                regqr[15:8] = regqr[15:8] + regy;
            end
            else
            begin
                regqr[15:8] = regqr[15:8] - regy;
                
            end
            if (regqr[12] == 1'b0) begin regqr[0] = 1'b1; last = 1'b1; end
            else begin regqr[0] = 1'b0; last = 1'b0; end
            if (i <= 4'b0111) begin regqr = regqr << 1; end
            i = i + 1;
            
            if (i == 4'b1000) 
            begin
                 if (regqr[12] == 1'b1) begin regqr[16:9] = regqr[16:9] + regy; end //�ָ�����
                
                //regp = regp >> 1; regp[15] = 1'b0;
                //regp[15] = regx[7] ^ regy[7]; regp[14] = regx[7] ^ regy[7];
                //regqr[7] = x[7] ^ y[3];// signal
                out_valid = 1'b1; 
                working = 1'b0;
            end
        end
    end
end

assign q = regqr[8:1];
assign r = regqr[12:9];
//assign iout = i;

endmodule
