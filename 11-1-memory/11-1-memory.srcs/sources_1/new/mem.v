`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/14 09:37:41
// Design Name: 
// Module Name: mem
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


module mem1(
input CLK100MHZ,
input clk,
input wren, //�洢��дʹ���źţ��ߵ�ƽʱ����д������
input [7:0] d_in, //�½���д������
input [7:0] addr_in, //��ַ
output [7:0] in_display,
output [6:0] SEG,
output [7:0] AN
);
assign in_display = d_in;
reg [31:0] mem1024 [1023:0]; //���� 4kB�Ĵ洢��
reg [31:0] outtmp;
wire [31:0] din = {24'h000000, d_in};
wire [9:0] inaddr = {2'b00, addr_in};
wire [9:0] outaddr = {2'b00, addr_in};
reg [31:0] dout1; //ʱ���½��أ�����д��ʹ��Ϊ�͵�ƽʱ���
reg [15:0] dout2; //ʱ�������أ���дʹ���źŵ͵�ƽʱ������������ 16λ����
reg [7:0] dout3; //�洢����Ч�� дʹ���źŵ͵�ƽʱ��� �� 8λ����
reg csen; //�洢����Ч�źţ��ߵ�ƽʱ����洢����д����
initial //��ʼ���洢������
begin
    csen = 1'b0;
    $readmemh("D:/Projects/Vivado_Projects/11-1-memory/sort1.txt", mem1024); //���������ļ� sort1.txt
    csen = 1'b1;
end

always @(*)
begin
    outtmp = mem1024[outaddr];
    if (csen & ~wren) begin
        dout3 <= outtmp[7:0];
    end
end

always @(posedge clk)
begin
    if (csen & ~wren) begin
        dout2 <= outtmp[15:0];
    end
end

always @(negedge clk)
begin
    if (csen) begin
        if (~wren) begin dout1 <= outtmp[31:0]; end
        else begin mem1024[inaddr] <= din[31:0]; end
    end
end

seg7 sevenSeg(
.x(dout1[31:0]),
.clk(CLK100MHZ),
.seg(SEG[6:0]),
.an(AN[7:0])
);

endmodule

/*
module mem2( // using distributed ram
input clk,
input csen, //�洢����Ч�źţ��ߵ�ƽʱ����洢����д����
input wren, //�洢��дʹ���źţ��ߵ�ƽʱ����д������
input [31:0] din, //�½���д������
input [9:0] inaddr, //д���ַ
input [9:0] outaddr, //��ȡ ��ַ
output reg [31:0] dout1, //ʱ���½��أ�����д��ʹ��Ϊ�͵�ƽʱ���
output reg [15:0] dout2, //ʱ�������أ���дʹ���źŵ͵�ƽʱ������������ 16λ����
output reg [7:0] dout3 //�洢����Ч�� дʹ���źŵ͵�ƽʱ��� �� 8λ����
);
//reg [31:0] mem1024 [1023:0]; //���� 4kB�Ĵ洢��
wire [9:0] addr;
wire [31:0] outtmp;
assign addr = wren ? inaddr : outaddr;
blk_ram memblk(.clka(clk),.ena(csen),.wea(wren),.addra(addr),.dina(din),.douta(outtmp));

//initial //��ʼ���洢������
//begin
//    $readmemh("sort1.txt",mem1024); //���������ļ� sort1.txt
//end

always @(*)
begin
    if (csen & ~wren) begin
        dout3 <= outtmp[7:0];
    end
end

always @(posedge clk)
begin
    if (csen & ~wren) begin
        dout2 <= outtmp[15:0];
    end
end

always @(negedge clk)
begin
    if (csen) begin
        if (~wren) begin dout1 <= outtmp[31:0]; end
        //else begin mem1024[inaddr] <= din[31:0]; end
    end
end
endmodule
/*/

/*
module mem3( // using block ram
input clk,
input csen, //�洢����Ч�źţ��ߵ�ƽʱ����洢����д����
input wren, //�洢��дʹ���źţ��ߵ�ƽʱ����д������
input [31:0] din, //�½���д������
input [9:0] inaddr, //д���ַ
input [9:0] outaddr, //��ȡ ��ַ
output reg [31:0] dout1, //ʱ���½��أ�����д��ʹ��Ϊ�͵�ƽʱ���
output reg [15:0] dout2, //ʱ�������أ���дʹ���źŵ͵�ƽʱ������������ 16λ����
output reg [7:0] dout3 //�洢����Ч�� дʹ���źŵ͵�ƽʱ��� �� 8λ����
);
//reg [31:0] mem1024 [1023:0]; //���� 4kB�Ĵ洢��
wire [9:0] addr;
wire [31:0] outtmp;
assign addr = wren ? inaddr : outaddr;
dist_ram memdist(.a(addr),.d(din),.clk(clk),.we(wren),.spo(outtmp));
//initial //��ʼ���洢������
//begin
//    $readmemh("sort1.txt",mem1024); //���������ļ� sort1.txt
//end


always @(*)
begin
    if (csen & ~wren) begin
        dout3 <= outtmp[7:0];
    end
end

always @(posedge clk)
begin
    if (csen & ~wren) begin
        dout2 <= outtmp[15:0];
    end
end

always @(negedge clk)
begin
    if (csen) begin
        if (~wren) begin dout1 <= outtmp[31:0]; end
    end
end
endmodule
*/