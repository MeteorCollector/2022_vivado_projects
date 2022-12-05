`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 09:03:13
// Design Name: 
// Module Name: stack_with_display
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


module stack_d(
input clk,
input CLK100MHZ,
input rst_n, //��λ�źţ��͵�ƽʱ��Ч
input pop, //�����ջ��Ч�ź�
input push, //������ջ��Ч�ź�
input wire [15:0] d_din, //Ҫ��ջ������
output [6:0] SEG,
output [7:0] AN,
output reg overflow, //=1��ʾջ�����ջ�ռ�����ʱ��ջ��������
output reg underflow,
output empty //=1��ʾջ�գ�ջ�� û������ ʱ��ջ��������
);
wire [31:0] din;
reg [31:0] dout; //Ҫ����ĳ�ջ����
reg [31:0] stack[15:0]; //���� ��ջ �ռ�Ϊ 16���洢��Ԫ
reg [3:0] sp; //ջָ�룬 ������¼ջ�� ��ǰ λ��
assign din = {16'h0000, d_din};

initial
begin
    overflow = 1'b0; sp = 1'b0;
end

assign empty = (sp == 4'b0000);

always @(negedge clk)
begin
    if (rst_n) begin // flipped
        overflow <= 1'b0; sp <= 1'b0; overflow <= 1'b0; underflow <= 1'b0;
    end
    else if (pop) begin
        if (empty) begin underflow <= 1'b1; end
        else begin
            dout = stack[sp]; sp = sp - 1; overflow = 1'b0; underflow = 1'b0;
        end
    end
    else if (push) begin
        if (sp == 4'b1111) begin underflow <= 1'b0; overflow <= 1'b1; end
        else begin
            sp = sp + 1; stack[sp] = din; overflow = 1'b0; underflow = 1'b0;
        end
    end
end

seg7decimal sevenSeg (
.x(dout[31:0]),
.clk(CLK100MHZ),
.seg(SEG[6:0]),
.an(AN[7:0]),
.dp(DP) 
);

endmodule


module seg7decimal(
	input [31:0] x,
    input clk,
    output reg [6:0] seg,
    output reg [7:0] an,
    output wire dp 
	 );
	 
	 
wire [2:0] s;	 
reg [3:0] digit;
wire [7:0] aen;
reg [19:0] clkdiv;

assign dp = 1;
assign s = clkdiv[19:17];
assign aen = 8'b11111111; // all turned off initially

// quad 4to1 MUX.


always @(posedge clk)// or posedge clr)
	
	case(s)
	0:digit = x[3:0]; // s is 00 -->0 ;  digit gets assigned 4 bit value assigned to x[3:0]
	1:digit = x[7:4]; // s is 01 -->1 ;  digit gets assigned 4 bit value assigned to x[7:4]
	2:digit = x[11:8]; // s is 10 -->2 ;  digit gets assigned 4 bit value assigned to x[11:8
	3:digit = x[15:12]; // s is 11 -->3 ;  digit gets assigned 4 bit value assigned to x[15:12]
	4:digit = x[19:16]; // s is 00 -->0 ;  digit gets assigned 4 bit value assigned to x[3:0]
    5:digit = x[23:20]; // s is 01 -->1 ;  digit gets assigned 4 bit value assigned to x[7:4]
    6:digit = x[27:24]; // s is 10 -->2 ;  digit gets assigned 4 bit value assigned to x[11:8
    7:digit = x[31:28]; // s is 11 -->3 ;  digit gets assigned 4 bit value assigned to x[15:12]

	default:digit = x[3:0];
	
	endcase
	
	//decoder or truth-table for 7seg display values
	always @(*)

case(digit)


//////////<---MSB-LSB<---
//////////////gfedcba////////////////////////////////////////////           a
0:seg = 7'b1000000;////0000												   __					
1:seg = 7'b1111001;////0001												f/	  /b
2:seg = 7'b0100100;////0010												  g
//                                                                       __	
3:seg = 7'b0110000;////0011										 	 e /   /c
4:seg = 7'b0011001;////0100										       __
5:seg = 7'b0010010;////0101                                            d  
6:seg = 7'b0000010;////0110
7:seg = 7'b1111000;////0111
8:seg = 7'b0000000;////1000
9:seg = 7'b0010000;////1001
'hA:seg = 7'b0001000; 
'hB:seg = 7'b0000011; 
'hC:seg = 7'b1000110;
'hD:seg = 7'b0100001;
'hE:seg = 7'b0000110;
'hF:seg = 7'b0001110;

default: seg = 7'b0000000; // U

endcase


always @(*)begin
an=8'b11111111;
if(aen[s] == 1)
an[s] = 0;
end


//clkdiv

always @(posedge clk) begin
clkdiv <= clkdiv+1;
end


endmodule
