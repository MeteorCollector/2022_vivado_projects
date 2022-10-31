`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/25 22:16:27
// Design Name: 
// Module Name: multi8b_tst
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


module multi32b_tst( );
reg clk;
reg rst_n;
reg in_valid;
reg[31:0] x;
reg[31:0] y;
wire[63:0] p;
wire out_valid;
multi32b uut( .x(x),.y(y),.p(p), .clk(clk),.rst_n(rst_n),.in_valid(in_valid),.out_valid(out_valid));
initial begin
clk = 0;
forever
#1 clk = ~clk; //??50MHZ???
end
initial
begin
rst_n = 1'b0;
in_valid=1'b0;
x = 32'h5a5a5a5a;
y = 32'h87878787;
#10
rst_n = 1'b1;
in_valid=1'b1;
#200;
rst_n = 1'b0;
in_valid=1'b0;
x = 32'h87878787;
y = 32'h5a5a5a5a;
#10;
rst_n = 1'b1;
in_valid=1'b1;
#200;
rst_n = 1'b0;
in_valid=1'b0;
x = 32'h0f0f0f0f;
y = 32'h0f0f0f0f;
#10;
rst_n = 1'b1;
in_valid=1'b1;
#200;
rst_n = 1'b0;
in_valid=1'b0;
x = 32'hffffffff;
y = 32'hffffffff;
#10;
rst_n = 1'b1;
in_valid = 1'b1; 
#200;
$stop;
end
endmodule
