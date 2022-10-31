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
//�˿�����
    output [3:0] d0,d1,d2,d3, //4·4λ������ź�d0~d3��
    input [3:0] d, // 4λ�����ź� d��
    input [1:0] s // 2λѡ������ź�s��
);
    assign d0 = (~s[1] & ~s[0]) ? d :4 'bz;
    assign d1 = (~s[1] & s[0]) ? d : 4'bz;
    assign d2 = (s[1] & ~s[0]) ? d : 4'bz;
    assign d3 = (s[1] & s[0]) ? d : 4'bz;
endmodule