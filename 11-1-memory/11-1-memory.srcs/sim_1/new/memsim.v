`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/14 18:17:26
// Design Name: 
// Module Name: memsim
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


module memsim();
    reg clk;
    reg csen;
    reg wren;
    reg [31:0] din;
    reg [9:0] inaddr;
    reg [9:0] outaddr;
    wire [31:0] dout1;
    wire [15:0] dout2;
    wire [7:0] dout3;
    integer i;
mem1 mem(.clk(clk),.csen(csen),.wren(wren),.din(din),.inaddr(inaddr),.outaddr(outaddr),.dout1(dout1),.dout2(dout2),.dout3(dout3));
always
#2 clk=~clk;

initial begin
clk = 1'b0;
csen = 1'b1;
    for(i = 31; i < 1024; i = i + 16) begin
        #20 wren = 1'b0; outaddr = i - 16;
        #20 wren = 1'b1; din = i; inaddr = i;
        #20;
    end
$stop;
end
endmodule