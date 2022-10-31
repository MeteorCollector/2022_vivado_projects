`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/22 22:37:06
// Design Name: 
// Module Name: multi_8b
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


module multi_8b
(
    input clk, //ʱ��
    input rst_n, //��λ�źţ�����Ч
    input [7:0] x, //������
    input [7:0] y, //����
    input in_valid, //=1��Чʱ���˷�����ʼ����
    output [15:0] p, //�˻�
    output reg out_valid //=1��Чʱ����ʾ�˷�����������
);

reg [7:0] regx;
reg [8:0] regy;
reg [15:0] regp;
reg [3:0] i;
reg working;

initial
begin
    working = 1'b0;
    regp = 16'h0000;
    regy[0] = 1'b0;
end
always @(posedge clk)
begin
    if (rst_n == 1'b0)
    begin
        working = 1'b0; regp = 16'h0000; regy[0] = 1'b0;
    end
    else
    begin
        if (out_valid == 1'b1) begin out_valid = 1'b0; end
        if (in_valid == 1'b1 && working == 1'b0)
        begin
            i = 4'b0000; working = 1'b1; out_valid = 1'b0;
            regx = x; regy[8:1] = y[7:0]; regy[0] = 1'b0;
        end
        if (working == 1'b1 && i < 4'b1000)
        begin
            case ({regy[i+1], regy[i]})
                2'b01: begin regp[15:8] = regp[15:8] + regx[7:0]; end
                2'b10: begin regp[15:8] = regp[15:8] + (~regx[7:0] + 1); end
                default: begin end
            endcase
            regp = regp >> 1; regp[15] = regp[14];
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

