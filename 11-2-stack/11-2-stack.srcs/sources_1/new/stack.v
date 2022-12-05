`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/14 15:17:49
// Design Name: 
// Module Name: stack
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

module stack(
input clk,
input rst_n, //复位信号，低电平时有效
input pop, //输入出栈有效信号
input push, //输入入栈有效信号
input wire [31:0] din, //要入栈的数据
output reg [31:0] dout, //要输出的出栈数据
output reg overflow, //=1表示栈溢出，栈空间已满时入栈操作报错
output reg underflow,
output empty //=1表示栈空，栈中 没有数据 时出栈操作报错
);
reg [31:0] stack[15:0]; //定义 堆栈 空间为 16个存储单元
reg [3:0] sp; //栈指针， 用来记录栈的 当前 位置

initial
begin
    overflow = 1'b0; sp = 1'b0;
end

assign empty = (sp == 4'b0000);

always @(negedge clk)
begin
    if (~rst_n) begin
        overflow <= 1'b0; sp <= 1'b0; underflow <= 1'b0; overflow <= 1'b0;
    end
    else if (pop) begin
        if (empty) begin underflow <= 1'b1; overflow <= 1'b0; end
        else begin
            dout <= stack[sp]; sp <= sp - 1; underflow <= 1'b0; overflow <= 1'b0;
        end
    end
    else if (push) begin
        if (sp == 4'b1111) begin underflow <= 1'b0; overflow <= 1'b1; end
        else begin
            sp <= sp + 1; stack[sp] <= din; underflow <= 1'b0; overflow <= 1'b0;
        end
    end
end
endmodule
