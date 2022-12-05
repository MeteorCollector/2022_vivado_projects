`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/14 15:17:49
// Design Name: 
// Module Name: stack
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

module stack(
input clk,
input rst_n, //��λ�źţ��͵�ƽʱ��Ч
input pop, //�����ջ��Ч�ź�
input push, //������ջ��Ч�ź�
input wire [31:0] din, //Ҫ��ջ������
output reg [31:0] dout, //Ҫ����ĳ�ջ����
output reg overflow, //=1��ʾջ�����ջ�ռ�����ʱ��ջ��������
output reg underflow,
output empty //=1��ʾջ�գ�ջ�� û������ ʱ��ջ��������
);
reg [31:0] stack[15:0]; //���� ��ջ �ռ�Ϊ 16���洢��Ԫ
reg [3:0] sp; //ջָ�룬 ������¼ջ�� ��ǰ λ��

initial
begin
    overflow = 1'b0; sp = 1'b0;
end

assign empty = (sp == 4'b0000);

always @(negedge clk)
begin
    if (~rst_n) begin
        overflow <= 1'b0; sp <= 1'b0; underflow <= 1'b0; overflow <= 1'b0;
    end
    else if (pop) begin
        if (empty) begin underflow <= 1'b1; overflow <= 1'b0; end
        else begin
            dout <= stack[sp]; sp <= sp - 1; underflow <= 1'b0; overflow <= 1'b0;
        end
    end
    else if (push) begin
        if (sp == 4'b1111) begin underflow <= 1'b0; overflow <= 1'b1; end
        else begin
            sp <= sp + 1; stack[sp] <= din; underflow <= 1'b0; overflow <= 1'b0;
        end
    end
end
endmodule
