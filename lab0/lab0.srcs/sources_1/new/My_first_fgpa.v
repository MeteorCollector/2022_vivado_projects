`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/18 19:45:12
// Design Name: 
// Module Name: My_first_fgpa
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


module My_first_fgpa(
    input A,
    input B,
    output F
    );
    assign F=~A&B | A&~B;
endmodule
