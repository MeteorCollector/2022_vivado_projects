`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/10 19:52:20
// Design Name: 
// Module Name: ctr32
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


module cntr32u (
    input CLK, CLR, LD, ENP, ENT,
    input [31:0] D,
    output reg [3:0] Q,
    output reg RCO
);
    reg [31:0] num;
    
always @(posedge CLK)
begin
    casez ({CLR, LD, ENP, ENT})
        4'b10??: begin num = 31'h00000000; Q = num; RCO = 1'b0; end
        4'b01??: begin num = D; Q = num; RCO = 1'b0; end
        4'b000?: begin RCO = 1'b0; end
        4'b00?0: begin RCO = 1'b0; end
        4'b0011: 
            begin 
                num = num + 1; 
                RCO = (Q == 31'h11111111) ? 1'b1 : 1'b0;
                Q = num;
            end
    endcase
end

endmodule
