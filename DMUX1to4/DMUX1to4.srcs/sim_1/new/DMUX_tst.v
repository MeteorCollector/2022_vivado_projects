`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/19 14:29:23
// Design Name: 
// Module Name: DMUX_tst
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


module DMUX_tst(    );
    reg [3:0] d;    // declare a regfile
    wire [3:0] d0, d1,d2,d3;
    reg [1:0] s;
    integer i;
    DMUX1to4 dmux1to4_inst(.d(d), .s(s), .d1(d1), .d2(d2), .d3(d3));
initial
    begin
        s = 2'b00;
        for (i=0; i<=15; i=i+1) begin d=i; #5; end
        s = 2'b01;
        for (i=0; i<=15; i=i+1) begin d=i; #5; end
        s = 2'b10;
        for (i=0; i<=15; i=i+1) begin d=i; #5; end
        s = 2'b11;
        for (i=0; i<=15; i=i+1) begin d=i; #5; end
        #20;
    end
endmodule
