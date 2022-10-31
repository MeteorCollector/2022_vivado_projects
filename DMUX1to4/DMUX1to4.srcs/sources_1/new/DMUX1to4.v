`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/19 14:24:14
// Design Name: 
// Module Name: DMUX1to4
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


module DMUX1to4(
//端口声明
    output [3:0] d0,d1,d2,d3, //4路4位的输出信号d0~d3。
    input [3:0] d, // 4位输入信号 d。
    input [1:0] s // 2位选择控制信号s。
);
    assign d0 = (~s[1] & ~s[0]) ? d :4 'bz;
    assign d1 = (~s[1] & s[0]) ? d : 4'bz;
    assign d2 = (s[1] & ~s[0]) ? d : 4'bz;
    assign d3 = (s[1] & s[0]) ? d : 4'bz;
endmodule