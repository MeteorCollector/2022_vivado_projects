`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/09 20:24:26
// Design Name: 
// Module Name: clk1s
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


module clk1ms (
//¶Ë¿ÚÉùÃ÷
    input clk,
    input rst,
    output reg clkout
);

reg [27:0] num;

always @(posedge clk)
begin
    num = num + 1;
    if (num == 27'd50000)
    begin
        num = 1'b0;
        clkout = ~clkout;
    end
    if (rst == 1'b1)
    begin
        num = 1'b0;
        clkout = 1'b0;
    end
end

endmodule
