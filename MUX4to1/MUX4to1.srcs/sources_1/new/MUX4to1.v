`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/19 14:08:14
// Design Name: 
// Module Name: MUX4to1
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
module mux4to1_2(//�˿�����
    output y, // ����1��wire���������y������Ϊ1λ��
    input a0, a1, a2, a3, // ����4��wire���������a0-a3������Ϊ1λ��
    input s0, s1 // ����2��wire���������s0��s1������Ϊ1λ��
);
    assign y = (~s0 & ~s1 & a0) | (~s0 & s1 & a1) | (s0& ~s1 & a2) | (s0 & s1& a3);
endmodule
