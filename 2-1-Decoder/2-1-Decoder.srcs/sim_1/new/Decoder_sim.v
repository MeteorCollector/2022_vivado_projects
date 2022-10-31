`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/26 10:38:03
// Design Name: 
// Module Name: Decoder_sim
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


module dec3to8_test();
    wire [7:0] O;
    reg [2:0] I;
    reg En;
    dec3to8ver2 dec3to8_impl(.O(O),.I(I),.En(En));
    initial begin
    begin En = 1'b0; end
    #100 begin En = 1'b1; I = 3'b000; end
    #100 begin En = 1'b1; I = 3'b001; end
    #100 begin En = 1'b1; I = 3'b010; end
    #100 begin En = 1'b1; I = 3'b011; end
    #100 begin En = 1'b1; I = 3'b100; end
    #100 begin En = 1'b1; I = 3'b101; end
    #100 begin En = 1'b1; I = 3'b110; end
    #100 begin En = 1'b1; I = 3'b111; end
    #100 begin En = 1'b0; end
    end
endmodule
