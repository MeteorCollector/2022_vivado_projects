`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/02 15:39:29
// Design Name: 
// Module Name: adder_sim
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


module ALU8_tst();
wire [7:0] f; //8位运算结果
 //结果为0标志位
reg [7:0] x; //8位数据输入，送到ALU端口A
reg [7:0] y; //8位数据输入，送到ALU端口B
reg [3:0] ALUctr; //4位ALU操作控制信号
ALU8 ALU8_inst(.f(f),.OF(OF),.SF(SF),.ZF(ZF),.CF(CF),.cout(cout),.x(x),.y(y),.ALUctr(ALUctr));
initial begin
#10 begin x=8'h7f; y=8'h80; ALUctr=4'b0000;end
#100 ALUctr=4'b0010;
#100 ALUctr=4'b0011;
#100 ALUctr=4'b0110;
#100 ALUctr=4'b1000;
#100 ALUctr=4'b1111;
#100 begin x=8'h80; y=8'h7f; ALUctr=4'b0010; end
#100 ALUctr=4'b0011;
#100 ALUctr=4'b1000;
end
endmodule
