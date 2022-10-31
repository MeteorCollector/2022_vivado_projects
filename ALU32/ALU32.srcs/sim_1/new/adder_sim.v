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


module ALU32_tst();
wire [31:0] f; //32位运算结果
wire OF, SF, ZF, CF, cout;
 //结果为0标志位
reg [31:0] x = 0; //32位数据输入，送到ALU端口A
reg [31:0] y = 0; //32位数据输入，送到ALU端口B
reg [3:0] ALUctr = 0; //4位ALU操作控制信号

ALU32 ALU32_inst(f,OF,SF,ZF,CF,cout,x,y,ALUctr);
initial begin
#10 begin x=32'h7fffffff; y=32'h80000000; ALUctr=4'b0000;end
#100 ALUctr=4'b0010;
#100 ALUctr=4'b0011;
#100 ALUctr=4'b0110;
#100 ALUctr=4'b1000;
#100 ALUctr=4'b1111;
#100 begin x=32'h80000000; y=32'h7fffffff; ALUctr=4'b0010; end
#100 ALUctr=4'b0011;
#100 ALUctr=4'b1000;
end
endmodule
