`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/19 14:11:13
// Design Name: 
// Module Name: MUX4to1_test
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


`timescale 10 ns/ 1 ps // ����ʱ��߶Ⱥ�ʱ�侫��
module MUX4to1_test(); // ���Դ���Ķ˿ڲ����б�Ϊ��
        reg a0,a1,a2,a3,s0,s1; // �����������Ϊreg�ͱ���
        wire y; // �����������Ϊwire�ͱ���
mux4to1_2 mux4to1_inst ( // ��Ҫ���Ե�ģ�����ʵ����
.a0(a0), .a1(a1), .a2(a2), .a3(a3), .s0(s0), .s1(s1), .y(y)
);
initial
    begin // ��ʼ���������
        s0=0;s1=0;
        a0=1;a1=0;a2=0;a3=0;#20;
        a0=0;a1=1;a2=1;a3=1;#20;
        s0=0;s1=1;
        a0=0;a1=1;a2=0;a3=0;#20;
        a0=1;a1=0;a2=1;a3=1;#20;
        s0=1;s1=0;
        a0=0;a1=0;a2=1;a3=0;#20;
        a0=1;a1=1;a2=0;a3=1;#20;
        s0=1;s1=1;
        a0=0;a1=0;a2=0;a3=1;#20;
        a0=1;a1=1;a2=1;a3=0;#20;
    end
endmodule