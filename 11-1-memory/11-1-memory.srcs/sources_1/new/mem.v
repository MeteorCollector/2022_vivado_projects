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
input wren, //存储器写使能信号，高电平时允许写入数据
input [7:0] d_in, //下降沿写入数据
input [7:0] addr_in, //地址
output [7:0] in_display,
output [6:0] SEG,
output [7:0] AN
);
assign in_display = d_in;
reg [31:0] mem1024 [1023:0]; //定义 4kB的存储器
reg [31:0] outtmp;
wire [31:0] din = {24'h000000, d_in};
wire [9:0] inaddr = {2'b00, addr_in};
wire [9:0] outaddr = {2'b00, addr_in};
reg [31:0] dout1; //时钟下降沿，并且写入使能为低电平时输出
reg [15:0] dout2; //时钟上升沿，且写使能信号低电平时输出，且输出低 16位数据
reg [7:0] dout3; //存储器有效后， 写使能信号低电平时输出 低 8位数据
reg csen; //存储器有效信号，高电平时允许存储器读写操作
initial //初始化存储器内容
begin
    csen = 1'b0;
    $readmemh("D:/Projects/Vivado_Projects/11-1-memory/sort1.txt", mem1024); //读入数据文件 sort1.txt
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
input csen, //存储器有效信号，高电平时允许存储器读写操作
input wren, //存储器写使能信号，高电平时允许写入数据
input [31:0] din, //下降沿写入数据
input [9:0] inaddr, //写入地址
input [9:0] outaddr, //读取 地址
output reg [31:0] dout1, //时钟下降沿，并且写入使能为低电平时输出
output reg [15:0] dout2, //时钟上升沿，且写使能信号低电平时输出，且输出低 16位数据
output reg [7:0] dout3 //存储器有效后， 写使能信号低电平时输出 低 8位数据
);
//reg [31:0] mem1024 [1023:0]; //定义 4kB的存储器
wire [9:0] addr;
wire [31:0] outtmp;
assign addr = wren ? inaddr : outaddr;
blk_ram memblk(.clka(clk),.ena(csen),.wea(wren),.addra(addr),.dina(din),.douta(outtmp));

//initial //初始化存储器内容
//begin
//    $readmemh("sort1.txt",mem1024); //读入数据文件 sort1.txt
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
input csen, //存储器有效信号，高电平时允许存储器读写操作
input wren, //存储器写使能信号，高电平时允许写入数据
input [31:0] din, //下降沿写入数据
input [9:0] inaddr, //写入地址
input [9:0] outaddr, //读取 地址
output reg [31:0] dout1, //时钟下降沿，并且写入使能为低电平时输出
output reg [15:0] dout2, //时钟上升沿，且写使能信号低电平时输出，且输出低 16位数据
output reg [7:0] dout3 //存储器有效后， 写使能信号低电平时输出 低 8位数据
);
//reg [31:0] mem1024 [1023:0]; //定义 4kB的存储器
wire [9:0] addr;
wire [31:0] outtmp;
assign addr = wren ? inaddr : outaddr;
dist_ram memdist(.a(addr),.d(din),.clk(clk),.we(wren),.spo(outtmp));
//initial //初始化存储器内容
//begin
//    $readmemh("sort1.txt",mem1024); //读入数据文件 sort1.txt
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