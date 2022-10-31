`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 10:25:45
// Design Name: 
// Module Name: d_trigger
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


module d_trigger (
//¶Ë¿ÚÉùÃ÷
    output reg out_q,
    input clk, in_d
);

always@(posedge clk)
begin
    out_q = in_d;
end
endmodule
