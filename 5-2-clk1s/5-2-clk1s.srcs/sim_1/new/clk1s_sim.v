`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 18:35:59
// Design Name: 
// Module Name: clk1s_sim
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

module cntr4u_tst( );
reg clk, rst;
wire clkout;
always begin // 10 ns ʱ������
cl
end
cntr4u U1 ( .CLK(CLK), .CLR(CLR), .LD(LD), .ENP(ENP),
.ENT(ENT), .D(D), .Q(cntr4uQ), .RCO(cntr4uRCO) );
initial begin
CLR = 0; LD = 0; ENP = 0; ENT =0; D = 0; // �����źų�ʼ��
#10 ; // �ȴ���λ����
CLR = 1; D = 4'b1111; #10 // ����������
#10 ;
CLR = 0; LD = 1; #10 // ���� 1111
LD = 0; ENP = 1; #10 // ���� (ENT=0)
ENT = 1; #320 // �ӷ�����32 ��ʱ������
ENT = 0; #20 // ���֣�RCO=0
$stop(1);
end
endmodule
