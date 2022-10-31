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


`timescale 10 ns/ 1 ps // 设置时间尺度和时间精度
module MUX4to1_test(); // 测试代码的端口参数列表为空
        reg a0,a1,a2,a3,s0,s1; // 输入变量声明为reg型变量
        wire y; // 输出变量声明为wire型变量
mux4to1_2 mux4to1_inst ( // 对要测试的模块进行实例化
.a0(a0), .a1(a1), .a2(a2), .a3(a3), .s0(s0), .s1(s1), .y(y)
);
initial
    begin // 初始化输入变量
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