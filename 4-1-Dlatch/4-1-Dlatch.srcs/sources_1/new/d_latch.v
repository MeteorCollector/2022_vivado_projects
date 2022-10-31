`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 09:34:18
// Design Name: 
// Module Name: d_latch
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


module d_latch (
//¶Ë¿ÚÉùÃ÷
output reg out_q,
input clk,in_d
);

always @(*)
begin
    case({clk})
        1'b1: begin out_q = in_d; end
        1'b0: begin end
    endcase
end

endmodule