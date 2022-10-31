`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/26 09:23:57
// Design Name: 
// Module Name: divy32_tst
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


module div32_tst( );
reg clk;
reg rst_n;
reg in_valid;
reg [31:0] x;
reg [15:0] y;
wire [31:0] q;
wire [15:0] r;
wire out_valid;
wire in_error;
wire error;
integer i,j;

div32u_nores div_impl(.clk(clk),.rst_n(rst_n),.x(x),.y(y),.in_valid(in_valid),.q(q),.r(r),.out_valid(out_valid),.in_error(in_error));
div_u_check dic_c(.x(x),.y(y),.valid(out_valid),.q(q),.r(r),.in_error(in_error),.error(error));
always
#5 clk=~clk;
always @(posedge clk) begin
if(error == 1) begin
//$display("error here\n");
//$stop;
end
end
initial begin
clk = 1'b0;
rst_n = 1'b0;
in_valid = 1'b0;
#10 rst_n = 1;
for(i = 2000000000;i >= 0;i = i - 114)begin 
for(j = 30000; j >= 0; j = j - 514) begin 
#5 x = i;y = j;in_valid = 1'b1;
#10 in_valid = 1'b0;
#150 ;
end
end
$stop;
end
endmodule
//???????
module div_u_check(
input [7:0]x,
input [3:0]y,
input valid,
input [7:0]q,
input [3:0]r,
input in_error,
output error
);
wire inerror_;
wire [7:0] q_;
wire [3:0] r_;
assign q_ = x/y; //??? Verilog??????????????
assign r_ = x-y*q; //??? Verilog???????????????
assign inerror_ = x == 0 || y == 0;
assign error = ~(valid == 0 || (valid == 1 && q_ == q && r_ == r)) || (in_error != inerror_);
endmodule
