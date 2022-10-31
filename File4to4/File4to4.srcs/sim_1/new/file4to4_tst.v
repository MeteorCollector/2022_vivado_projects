`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/19 14:46:20
// Design Name: 
// Module Name: file4to4_tst
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


module file4to4_tst(    );
    wire [3:0] Y0,Y1,Y2,Y3;
    reg [3:0] D0,D1,D2,D3; 
    reg [1:0] S; 
    FILE4to4 trans4to4_inst(.Y0(Y0), .Y1(Y1),.Y2(Y2),.Y3(Y3),.S(S), .D0(D0), .D1(D1), .D2(D2), .D3(D3));
initial
    begin
        D0=4'b0011;D1=4'b1100;D2=4'b1010;D3=4'b0101;
        S=2'b00; #50;
        S=2'b01; #50;
        S=2'b10; #50;
        S=2'b11; #50;
        S=2'b00; #50;
    end
endmodule
