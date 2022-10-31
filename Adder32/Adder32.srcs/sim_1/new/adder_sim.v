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


module adder32_tst();
//output
wire [31:0] f;
wire OF,SF,ZF,CF,cout;
//input
reg[31:0] x,y;
reg sub=0;
Adder32 adder_inst(f,OF,SF,ZF,CF,cout,x,y,sub);
initial begin
#10 begin x=32'h7fffffff; y=32'h80000002; sub=0; end
#100 begin x=32'h7fffffff; y=32'h80000002; sub=1; end
#100 begin x=32'h80000002; y=32'h7fffffff; sub=0; end
#100 begin x=32'h80000002; y=32'h7fffffff; sub=1; end
#100 begin x=32'hffffffff; y=32'h1; sub=0; end
#100 begin x=32'hffffffff; y=32'h1; sub=1; end
#100 begin x=32'h80000000; y=32'h80000000; sub=0; end
#100 begin x=32'h80000000; y=32'h80000000; sub=1; end
end
endmodule
