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
module mux4to1_2(//端口声明
    output y, // 声明1个wire型输出变量y，其宽度为1位。
    input a0, a1, a2, a3, // 声明4个wire型输入变量a0-a3，其宽度为1位。
    input s0, s1 // 声明2个wire型输入变量s0、s1，其宽度为1位。
);
    assign y = (~s0 & ~s1 & a0) | (~s0 & s1 & a1) | (s0& ~s1 & a2) | (s0 & s1& a3);
endmodule
