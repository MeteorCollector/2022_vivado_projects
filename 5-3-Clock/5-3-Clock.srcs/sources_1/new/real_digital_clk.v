`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/09 21:08:46
// Design Name: 
// Module Name: digitalclk
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


module digitalclk (
//�˿�����
input clk,
input rst, //��λ����Ч��00:00:00
input ld, // =1ʱ���������ó�ֵ��=0ʱ��������ʱ
input set_h, //��ť���º�����Сʱ��ֵ
input set_m, //��ť���º����÷��ӳ�ֵ
input set_s, //��ť���º�����������ֵ
input [3:0] data_h, //���ó�ֵ��λ��ʹ��BCD���ʾ
input [3:0] data_l, //���ó�ֵ��λ��ʹ��BCD���ʾ
output reg[6:0] O_seg, //�߶����������ֵ����ʾ����
output [7:0] lit, //�߶�����ܿ���λ������ʱ���֡���
output [2:0] ledout //���3ɫָʾ��
);

reg [3:0] hour [1:0];
reg [3:0] min [1:0];
reg [3:0] sec [1:0];
wire clk1s;
reg [11:0] i;
reg [7:0] neglit;
reg [3:0] dig_T;
reg [2:0] blink;

clk1s myclk(clk, 1'b0, clk1s);

always@(posedge clk)
begin
	i<=i+1'b1;
	if(i==12'b111111111111)
	begin
		i=12'b000000000000;
		neglit=neglit<<1;
		if(neglit==8'b00000000)//modify here!
		    neglit<=8'b00000001;
    end
end

always @(negedge clk1s)
begin
    
    if (blink > 0) begin blink = blink - 1; end
    
    if (rst == 1'b1)
    begin
        hour[0] = 4'b0000; hour[1] = 4'b0000; min[0] = 4'b0000; min[1] = 4'b0000; sec[0] = 4'b0000; sec[1] = 4'b0000;
    end
    
    if (ld == 1'b1)
    begin
        case ({set_h, set_m, set_s})
            3'b100: begin hour[1] = data_h; hour[0] = data_l; end
            3'b010: begin min[1] = data_h; min[0] = data_l; end
            3'b001: begin sec[1] = data_h; sec[0] = data_l; end
        endcase
    end
    
    if (ld == 1'b0 && rst == 1'b0)
    begin
        sec[0] = sec[0] + 1;
        if (sec[0] >= 4'b1010)
        begin
            sec[0] = 4'b0000;
            sec[1] = sec[1] + 1;
            if (sec[1] >= 4'b0110)
            begin
                sec[1] = 4'b0000;
                min[0] = min[0] + 1;
                if (min[0] >= 4'b1010)
                begin
                    min[0] = 4'b0000;
                    min[1] = min[1] + 1;
                    if (min[1] >= 4'b0110)
                    begin
                        min[1] = 4'b0000;
                        blink = 4'b0101;
                        hour[0] = hour[0] + 1;
                        if (hour[0] >= 4'b1010 || (hour[0] >= 4'b0100 && hour[1] == 4'b0010))
                        begin
                            hour[0] = 4'b0000;
                            hour[1] = hour[1] + 1;
                            
                            if (hour[1] >= 4'b0011)
                            begin
                                hour[1] = 4'b0000;
                                
                            end
                        end
                    end
                end
            end
        end
    end
end

always@(*)
    begin
        case({neglit})
		  8'b00000001: dig_T = sec[0];
		  8'b00000010: dig_T = sec[1];
		  8'b00000100: dig_T = 4'b1111;
		  8'b00001000: dig_T = min[0];
		  8'b00010000: dig_T = min[1];
		  8'b00100000: dig_T = 4'b1111;
		  8'b01000000: dig_T = hour[0];
		  8'b10000000: dig_T = hour[1];
		  default: dig_T = 1'b0;
        endcase
        case({dig_T})
            4'b0000: O_seg = 7'b1000000;
            4'b0001: O_seg = 7'b1111001;
            4'b0010: O_seg = 7'b0100100;
            4'b0011: O_seg = 7'b0110000;
            4'b0100: O_seg = 7'b0011001;
            4'b0101: O_seg = 7'b0010010;
            4'b0110: O_seg = 7'b0000010;
            4'b0111: O_seg = 7'b1111000;
            4'b1000: O_seg = 7'b0000000;
            4'b1001: O_seg = 7'b0010000;
            default: O_seg = 7'b1111111;
            //4'b1010: O_seg = 7'b0001000;
            //4'b1011: O_seg = 7'b0000011;
            //4'b1100: O_seg = 7'b1000110;
            //4'b1101: O_seg = 7'b0100001;
            //4'b1110: O_seg = 7'b0000110;
            //4'b1111: O_seg = 7'b0001110;
        endcase
    end
    
assign lit = ~neglit;
assign ledout = (blink % 2 == 1) ? blink : 3'b000;

endmodule
