`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/14 10:45:03
// Design Name: 
// Module Name: shrg4u
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


module shrg4u (
//¶Ë¿ÚÉùÃ÷
input CLK, CLR, S0, S1, RIN, LIN, A, B, C, D,
output QA, QB, QC, QD
);
reg RA, RB, RC, RD;

always @(posedge CLK)
begin
    if (CLR == 1'b1) begin RA = 1'b0; RB = 1'b0; RC = 1'b0; RD = 1'b0; end
    else
        begin
            case ({S1, S0})
                2'b00: begin end
                2'b01: begin RD = RC; RC = RB; RB = RA; RA = RIN; end
                2'b10: begin RA = RB; RB = RC; RC = RD; RD = LIN; end
                2'b11: begin RA = A; RB = B; RC = C; RD = D; end
            endcase
        end
end

assign QA = RA;
assign QB = RB;
assign QC = RC;
assign QD = RD;

endmodule
