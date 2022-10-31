`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/26 19:04:05
// Design Name: 
// Module Name: Encoder
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


module enc8to3(
//¶Ë¿ÚÉùÃ÷
   output reg [2:0] Y,
   input [7:0] A
);

always @(*)
    case({A[7]})
        1'b1: Y=3'b000;
        1'b0:
            case({A[6]})
                1'b1: Y=3'b001;
                1'b0:
                    case({A[5]})
                        1'b1: Y=3'b010;
                        1'b0:
                            case({A[4]})
                                1'b1: Y=3'b011;
                                1'b0:
                                    case({A[3]})
                                        1'b1: Y=3'b100;
                                        1'b0:
                                            case({A[2]})
                                                1'b1: Y=3'b101;
                                                1'b0:
                                                    case({A[1]})
                                                        1'b1: Y=3'b110;
                                                        1'b0:
                                                            case({A[0]})
                                                                1'b1: Y=3'b111;
                                                                1'b0: Y=3'b000;
                                                            endcase
                                                    endcase
                                            endcase
                                    endcase
                            endcase
                    endcase
            endcase
    endcase
    
endmodule
