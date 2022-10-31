`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/19 18:53:07
// Design Name: 
// Module Name: Hamming_tst
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


module Hamming_tst( );
    reg [3:0] D;
    wire [7:0] F;
    integer i;
    
Hamming_Code ham_inst(.D(D), .F(F));
initial
    begin
        for (i=0; i<=15; i=i+1) begin D=i; #5; end
        #20;
    end
endmodule
