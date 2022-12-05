`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/16 19:32:35
// Design Name: 
// Module Name: barrel32_sim
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


module barrelsft8_tst();
wire [31:0] dout;
reg [31:0] din;
reg [4:0] shamt; //�ƶ�λ��
reg LR; // LR=1ʱ���ƣ� LR=0ʱ����
reg AL; // AL=1ʱ�������ƣ� AR=0ʱ�߼�����
barrelsft32 barrelsft32_inst(dout,din,shamt,LR,AL);
initial begin
#10 begin din=32'hc5c5c5c5;LR=1; shamt=3'b1; end
#20 shamt=3'b011;
#20 shamt=3'b101;
#20 shamt=3'b111;
#20 shamt=4'b1000;
#20 shamt=5'b10000;
#20 begin LR=0; AL=0; shamt=3'b1;end
#20 shamt=3'b010;
#20 shamt=3'b100;
#20 shamt=3'b111;
#20 shamt=4'b1000;
#20 shamt=5'b10000;
#20 begin LR=0; AL=1; shamt=3'b1;end
#20 shamt=3'b010;
#20 shamt=3'b100;
#20 shamt=3'b111;
#20 shamt=4'b1000;
#20 shamt=5'b10000;
#20 $stop;
end
endmodule