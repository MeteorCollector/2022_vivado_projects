`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/27 23:14:43
// Design Name: 
// Module Name: STUID
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
module clkdisplay(clk, O_seg, dig0, dig1, dig2, dig3, dig4, dig5, dig6, dig7, lit);
	
	input clk;
	output reg [6:0] O_seg;
	reg [6:0] T_seg;
	input [3:0] dig0;
	input [3:0] dig1;
	input [3:0] dig2;
	input [3:0] dig3;
	input [3:0] dig4;
	input [3:0] dig5;
	input [3:0] dig6;
	input [3:0] dig7;
	reg [3:0] dig_T;
	reg [3:0] status;
	reg [11:0] i;
	reg [7:0] neglit;
	output [7:0] lit;
	
	always@(posedge clk)
	begin
		i<=i+1'b1;
	    if(i==12'b111111111111)
		begin
		    i=12'b000000000000;
		    neglit=neglit<<1;
		    if(neglit==8'b00000000)//modify here!
		        neglit<=8'b00000001;
		end
    end
    
    always@(*)
    begin
        case({neglit})
		  8'b00000001: dig_T = dig7;
		  8'b00000010: dig_T = dig6;
		  8'b00000100: dig_T = dig5;
		  8'b00001000: dig_T = dig4;
		  8'b00010000: dig_T = dig3;
		  8'b00100000: dig_T = dig2;
		  8'b01000000: dig_T = dig1;
		  8'b10000000: dig_T = dig0;
		  default: dig_T = 1'b0;
        endcase
        case({dig_T})
            4'b0000: O_seg = 7'b1000000;
            4'b0001: O_seg = 7'b1111001;
            4'b0010: O_seg = 7'b0100100;
            4'b0011: O_seg = 7'b0110000;
            4'b0100: O_seg = 7'b0011001;
            4'b0101: O_seg = 7'b0010010;
            4'b0110: O_seg = 7'b0000010;
            4'b0111: O_seg = 7'b1111000;
            4'b1000: O_seg = 7'b0000000;
            4'b1001: O_seg = 7'b0010000;
            default: O_seg = 7'b1111111;
            //4'b1010: O_seg = 7'b0001000;
            //4'b1011: O_seg = 7'b0000011;
            //4'b1100: O_seg = 7'b1000110;
            //4'b1101: O_seg = 7'b0100001;
            //4'b1110: O_seg = 7'b0000110;
            //4'b1111: O_seg = 7'b0001110;
        endcase
    end
    
    assign lit = ~neglit;
endmodule
