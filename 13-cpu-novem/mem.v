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


module mem1( // without ip
input rdclk,
input wrclk,
input csen, //存储器有效信号，高电平时允许存储器读写操作
input wren, //存储器写使能信号，高电平时允许写入数据
input [2:0] MemOp,
input [31:0] din, //下降沿写入数据
input [15:0] inaddr, //写入地址
input [15:0] outaddr, //读取 地址
output reg [31:0] dout //时钟下降沿，并且写入使能为低电平时输出
);

reg [31:0] ram [32767:0];
reg [31:0] intmp;
reg [31:0] outtmp;
reg [31:0] redirected;
wire [3:0] wrctr;

assign wrctr = (~wren) ? 4'b0000 : MemOp[0] == 1'b1 ? 4'b0001 : MemOp[1] == 1'b1 ? 4'b0011 : 4'b1111;

//assign intmp[7:0]   = (wrctr[0]) ? din[7:0]   : outtmp[7:0];
//assign intmp[15:8]  = (wrctr[1]) ? din[15:8]  : outtmp[15:8];
//assign intmp[23:16] = (wrctr[2]) ? din[23:16] : outtmp[23:16];
//assign intmp[31:24] = (wrctr[3]) ? din[31:24] : outtmp[31:24];

always @(posedge rdclk)
begin
    if (csen) begin
        if (wren) begin outtmp <= ram[inaddr[15:2]]; end
        else begin outtmp <= ram[outaddr[15:2]]; end
    end
end

always @(posedge wrclk)
begin
    if (csen & wren) begin ram[inaddr[15:2]] <= intmp; end
end

always @(*)
begin
    if (csen) begin
        if (~wren)
        begin
            case (MemOp[1:0])
            2'b00: begin redirected = outtmp; end
            2'b10: begin redirected = (outaddr[1] == 1'b1) ? {16'h0000, outtmp[31:16]} : {16'h0000, outtmp[15:0]}; end
            2'b01: begin
                        case (outaddr[1:0])
                        2'b00: begin redirected = {24'h000000, outtmp[7:0]};   end
                        2'b01: begin redirected = {24'h000000, outtmp[15:8]};  end
                        2'b10: begin redirected = {24'h000000, outtmp[23:16]}; end
                        2'b11: begin redirected = {24'h000000, outtmp[31:24]}; end
                        endcase
                   end
            endcase
            case (MemOp)
            3'b000: begin dout = redirected; end
            3'b010: begin dout = {{16{redirected[15]}}, redirected[15:0]}; end
            3'b001: begin dout = {{24{redirected[7]}}, redirected[7:0]}; end
            3'b110: begin dout = {16'h0000, redirected[15:0]}; end
            3'b101: begin dout = {24'h000000, redirected[7:0]}; end
            endcase
        end
        else
        begin
            case (MemOp)
            3'b000: begin intmp = din; end
            3'b010: begin intmp = inaddr[1] == 1'b1 ? {din[15:0], outtmp[15:0]} : {outtmp[31:16], din[15:0]}; end
            3'b001: begin 
                    case (inaddr[1:0])
                        2'b00: begin intmp = {outtmp[31:8], din[7:0]}; end
                        2'b01: begin intmp = {outtmp[31:16], din[7:0], outtmp[7:0]}; end
                        2'b10: begin intmp = {outtmp[31:24], din[7:0], outtmp[15:0]}; end
                        2'b11: begin intmp = {din[7:0], outtmp[23:0]}; end
                    endcase
                    end
            endcase
        end
    end
end

endmodule

/*
module mem2( // without ip
input rdclk,
input wrclk,
input csen, //存储器有效信号，高电平时允许存储器读写操作
input wren, //存储器写使能信号，高电平时允许写入数据
input [2:0] MemOp,
input [31:0] din, //下降沿写入数据
input [15:0] inaddr, //写入地址
input [15:0] outaddr, //读取 地址
output reg [31:0] dout //时钟下降沿，并且写入使能为低电平时输出
);

reg [31:0] ram [32767:0];
reg [31:0] intmp;
wire [31:0] outtmp;
reg [31:0] redirected;
reg [3:0] wrctr;

//assign wrctr = (~wren) ? 4'b0000 : MemOp[0] == 1'b1 ? 4'b0001 : MemOp[1] == 1'b1 ? 4'b0011 : 4'b1111;

blk_mem memblk(
    .addra({2'b00, inaddr[15:2]}),.clka(wrclk),.dina(din),.ena(wren),.wea(wrctr),
    .addrb({2'b00, outaddr[15:2]}),.clkb(rdclk),.doutb(outtmp),.enb(~wren)
    );

//assign intmp[7:0]   = (wrctr[0]) ? din[7:0]   : outtmp[7:0];
//assign intmp[15:8]  = (wrctr[1]) ? din[15:8]  : outtmp[15:8];
//assign intmp[23:16] = (wrctr[2]) ? din[23:16] : outtmp[23:16];
//assign intmp[31:24] = (wrctr[3]) ? din[31:24] : outtmp[31:24];

always @(posedge rdclk)
begin
   // if (csen) begin
   //     if (wren) begin outtmp <= ram[inaddr[15:2]]; end
   //     else begin outtmp <= ram[outaddr[15:2]]; end
   // end
end

always @(posedge wrclk)
begin
    if (csen & wren) begin ram[inaddr[15:2]] <= intmp; end
end

always @(*)
begin
    if (csen) begin
        if (~wren)
        begin
            case (MemOp[1:0])
            2'b00: begin redirected = outtmp; end
            2'b10: begin redirected = (outaddr[1] == 1'b1) ? {16'h0000, outtmp[31:16]} : {16'h0000, outtmp[15:0]}; end
            2'b01: begin
                        case (outaddr[1:0])
                        2'b00: begin redirected = {24'h000000, outtmp[7:0]};   end
                        2'b01: begin redirected = {24'h000000, outtmp[15:8]};  end
                        2'b10: begin redirected = {24'h000000, outtmp[23:16]}; end
                        2'b11: begin redirected = {24'h000000, outtmp[31:24]}; end
                        endcase
                   end
            endcase
            case (MemOp)
            3'b000: begin dout = redirected; end
            3'b010: begin dout = {{16{redirected[15]}}, redirected[15:0]}; end
            3'b001: begin dout = {{24{redirected[7]}}, redirected[7:0]}; end
            3'b110: begin dout = {16'h0000, redirected[15:0]}; end
            3'b101: begin dout = {24'h000000, redirected[7:0]}; end
            endcase
        end
        else // writing
        begin
            case (MemOp)
            3'b000: begin intmp = din; wrctr = 4'b1111; end
            3'b010: begin 
                intmp = inaddr[1] == 1'b1 ? {din[15:0], outtmp[15:0]} : {outtmp[31:16], din[15:0]}; 
                wrctr = inaddr[1] == 1'b1 ? 4'b1100 : 4'b0011;
            end
            3'b001: begin 
                    case (inaddr[1:0])
                        2'b00: begin intmp = {outtmp[31:8], din[7:0]};                wrctr = 4'b0001; end
                        2'b01: begin intmp = {outtmp[31:16], din[7:0], outtmp[7:0]};  wrctr = 4'b0010; end
                        2'b10: begin intmp = {outtmp[31:24], din[7:0], outtmp[15:0]}; wrctr = 4'b0100; end
                        2'b11: begin intmp = {din[7:0], outtmp[23:0]};                wrctr = 4'b1000; end
                    endcase
                    end
            endcase
        end
    end
end

endmodule
*/
/*
module mem3( // using block ram
input rdclk,
input wrclk,
input csen, //存储器有效信号，高电平时允许存储器读写操作
input wren, //存储器写使能信号，高电平时允许写入数据
input [2:0] MemOp,
input [31:0] din, //下降沿写入数据
input [15:0] inaddr, //写入地址
input [15:0] outaddr, //读取 地址
output [31:0] outtmp,
output [3:0] wrctr,
output reg [31:0] dout //时钟下降沿，并且写入使能为低电平时输出
);
//reg [31:0] mem1024 [1023:0]; //定义 4kB的存储器
//wire [15:0] addr;
//wire [31:0] outtmp;
//wire [3:0] wrctr;

//assign addr = wren ? inaddr : outaddr;
blk_mem memblk(
    .addra(inaddr),.clka(wrclk),.dina(din),.ena(wren),.wea(wrctr),
    .addrb(outaddr),.clkb(rdclk),.doutb(outtmp),.enb(~wren)
    );

initial //初始化存储器内容
begin
//    csen = 1'b1;
//    $readmemh("sort1.txt",mem1024); //读入数据文件 sort1.txt
end

//assign wrctr = (~wren) ? 4'b0000 : 4'b1111;
assign wrctr = (~wren) ? 4'b0000 : MemOp[0] == 1'b1 ? 4'b0001 : MemOp[1] == 1'b1 ? 4'b0011 : 4'b1111;

always @(*) //
begin
    if (csen & ~wren) begin
        case (MemOp)
            3'b000: begin dout = outtmp; end
            3'b001: begin dout = {{24{outtmp[7]}}, outtmp[7:0]}; end
            3'b010: begin dout = {{16{outtmp[15]}}, outtmp[15:0]}; end
            3'b101: begin dout = {24'h000000, outtmp[7:0]}; end
            3'b110: begin dout = {16'h0000, outtmp[15:0]}; end
        endcase
    end
end

always @(posedge wrclk)
begin
    
    
    if (csen & wren) begin
        case (MemOp)
            3'b000: begin dout = outtmp; end
            3'b001: begin dout = {{24{outtmp[7]}}, outtmp[7:0]}; end
            3'b010: begin dout = {{16{outtmp[15]}}, outtmp[15:0]}; end
        endcase
    end
    
end
endmodule
*/