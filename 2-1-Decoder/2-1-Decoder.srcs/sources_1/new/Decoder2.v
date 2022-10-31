`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/26 10:29:46
// Design Name: 
// Module Name: Decoder2
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
    
module dec3to8ver2 (
//¶Ë¿ÚÉùÃ÷
output reg [7:0] O,
input [2:0] I,
input En
);
    always @(*)
        case({En})
            1'b0: O = 8'b00000000;
            1'b1:
                case({I})
                    3'b000: O = 8'b00000001;
                    3'b001: O = 8'b00000010;
                    3'b010: O = 8'b00000100;
                    3'b011: O = 8'b00001000;
                    3'b100: O = 8'b00010000;
                    3'b101: O = 8'b00100000;
                    3'b110: O = 8'b01000000;
                    3'b111: O = 8'b10000000;
                endcase
        endcase
endmodule
