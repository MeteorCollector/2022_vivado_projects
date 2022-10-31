`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/16 18:33:36
// Design Name: 
// Module Name: shrg32
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


module shrg32u (
//???????
input CLK, CLR, S0, S1, RIN, LIN,
input [31:0] IN,
output [31:0] OUT
);
reg [31:0] R;
reg [31:0] tmp;

always @(posedge CLK)
begin
    if (CLR == 1'b1) begin R = 32'h00000000; end
    else
        begin
            case ({S1, S0})
                2'b00: begin end
                2'b01: begin tmp = R[30:0]; R[31:1] = tmp; R[0] = RIN; end
                2'b10: begin tmp = R[31:1]; R[30:0] = tmp; R[31] = LIN; end
                2'b11: begin R = IN; end
            endcase
        end
end

assign OUT = R;

endmodule
