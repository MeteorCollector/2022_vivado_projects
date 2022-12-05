`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/15 00:08:46
// Design Name: 
// Module Name: stack_tst
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


module stack_tst();
    reg clk;
    reg rst_n;
    reg pop;
    reg push;
    reg [31:0] din;
    wire [31:0] dout;
    wire overflow;
    wire error;
    wire empty;
    integer i;
stack my_stack(.clk(clk),.rst_n(rst_n),.pop(pop),.push(push),.din(din),.dout(dout),.overflow(overflow),.error(error),.empty(empty));
always
#5 clk=~clk;

initial begin
clk = 1'b0;
pop = 1'b0;
rst_n = 1'b1;
    for (i = 1; i <= 17; i = i + 1) begin  #10 pop = 1'b0; push = 1'b1; din = i; end
    for (i = 1; i <= 17; i = i + 1) begin  #10 pop = 1'b1; push = 1'b0; din = 1'b0; end
    #20 rst_n = 1'd0;
    #10 rst_n = 1'b1;
    for (i = 1; i <= 17; i = i + 1) begin
        #10 pop = 1'b0; push = 1'b1; din = i;
        #10 pop = 1'b0; push = 1'b1; din = i + 16;
        #10 pop = 1'b1; push = 1'b0; din = 1'b0;
    end
$stop;
end
endmodule
