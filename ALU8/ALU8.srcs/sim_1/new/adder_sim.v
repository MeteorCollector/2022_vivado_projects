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
wire [7:0] f; //8λ������
 //���Ϊ0��־λ
reg [7:0] x; //8λ�������룬�͵�ALU�˿�A
reg [7:0] y; //8λ�������룬�͵�ALU�˿�B
reg [3:0] ALUctr; //4λALU���������ź�
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
