`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 10:37:39
// Design Name: 
// Module Name: d_register
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


module d_register (
//¶Ë¿ÚÉùÃ÷
    output reg q, qn,
    input clk, d, pr_l, clr_l, we
);

always@(posedge clk)
begin
    case ({we, clr_l,pr_l})
        3'b111: begin q=d; qn=~q; end
        3'b110: begin q=1'b1; qn=~q; end
        3'b101: begin q=1'b0; qn=~q; end
        default: begin end
    endcase
end

endmodule
