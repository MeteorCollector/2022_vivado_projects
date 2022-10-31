`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 11:14:36
// Design Name: 
// Module Name: d_register8
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


module d_register8 (
//¶Ë¿ÚÉùÃ÷
    output reg [7:0] q,
    output reg [7:0] qn,
    input [7:0] d,
    input clk, pr_l, clr_l, we
);

always@(posedge clk)
begin
    case ({we, clr_l,pr_l})
        3'b111: begin q=d; qn=~q; end
        3'b110: begin q=8'b00000001; qn=~q; end
        3'b101: begin q=8'b00000000; qn=~q; end
        default: begin end
    endcase
end

endmodule
