`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/29 09:19:44
// Design Name: 
// Module Name: Decoder32
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

module dec32 (
//???????
output reg [31:0] O,
input [4:0] I,
input En
);
    always @(*)
        case({En})
            1'b0: O = 32'bz;
            1'b1:
                case({I})
                    5'b00000: O = 32'b00000000000000000000000000000001;
                    5'b00001: O = 32'b00000000000000000000000000000010;
                    5'b00010: O = 32'b00000000000000000000000000000100;
                    5'b00011: O = 32'b00000000000000000000000000001000;
                    5'b00100: O = 32'b00000000000000000000000000010000;
                    5'b00101: O = 32'b00000000000000000000000000100000;
                    5'b00110: O = 32'b00000000000000000000000001000000;
                    5'b00111: O = 32'b00000000000000000000000010000000;
                    5'b01000: O = 32'b00000000000000000000000100000000;
                    5'b01001: O = 32'b00000000000000000000001000000000;
                    5'b01010: O = 32'b00000000000000000000010000000000;
                    5'b01011: O = 32'b00000000000000000000100000000000;
                    5'b01100: O = 32'b00000000000000000001000000000000;
                    5'b01101: O = 32'b00000000000000000010000000000000;
                    5'b01110: O = 32'b00000000000000000100000000000000;
                    5'b01111: O = 32'b00000000000000001000000000000000;
                    5'b10000: O = 32'b00000000000000010000000000000000;
                    5'b10001: O = 32'b00000000000000100000000000000000;
                    5'b10010: O = 32'b00000000000001000000000000000000;
                    5'b10011: O = 32'b00000000000010000000000000000000;
                    5'b10100: O = 32'b00000000000100000000000000000000;
                    5'b10101: O = 32'b00000000001000000000000000000000;
                    5'b10110: O = 32'b00000000010000000000000000000000;
                    5'b10111: O = 32'b00000000100000000000000000000000;
                    5'b11000: O = 32'b00000001000000000000000000000000;
                    5'b11001: O = 32'b00000010000000000000000000000000;
                    5'b11010: O = 32'b00000100000000000000000000000000;
                    5'b11011: O = 32'b00001000000000000000000000000000;
                    5'b11100: O = 32'b00010000000000000000000000000000;
                    5'b11101: O = 32'b00100000000000000000000000000000;
                    5'b11110: O = 32'b01000000000000000000000000000000;
                    5'b11111: O = 32'b10000000000000000000000000000000;
                endcase
        endcase
endmodule