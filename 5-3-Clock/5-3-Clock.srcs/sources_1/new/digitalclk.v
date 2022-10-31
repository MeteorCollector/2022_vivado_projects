`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/09 21:08:46
// Design Name: 
// Module Name: digitalclk
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


module digitalclk (
//端口声明
input clk,
input rst, //复位，有效后00:00:00
input btn,
output reg[6:0] O_seg, //七段数码管输入值，显示数字
output [7:0] lit //七段数码管控制位，控制时、分、秒
);

reg [3:0] sec [2:0];
reg [3:0] ms [2:0];
wire clk1s;
reg [11:0] i;
reg [7:0] neglit;
reg [3:0] dig_T;
reg enable;

clk1ms myclk(clk, 1'b0, clk1s);

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

always @(posedge btn)
begin
    enable = ~enable;
end

always @(negedge clk1s)
begin
    
    if (enable == 1'b0 && rst == 1'b1)
    begin
        sec[2] = 1'b0; sec[1] = 1'b0; sec[0] = 1'b0; ms[2] = 1'b0; ms[1] = 1'b0; ms[0] = 1'b0;
    end
    
    if (enable == 1'b1)
    begin
        ms[0] = ms[0] + 1;
        if (ms[0] == 4'b1010)
        begin
            ms[0] = 4'b0000;
            ms[1] = ms[1] + 1;
            if (ms[1] == 4'b1010)
            begin
                ms[1] = 4'b0000;
                ms[2] = ms[2] + 1;
                if (ms[2] == 4'b1010)
                begin
                    ms[2] = 4'b0000;
                    sec[0] = sec[0] + 1;
                    if (sec[0] == 4'b1010)
                    begin
                        sec[0] = 4'b0000;
                        sec[1] = sec[1] + 1;
                        if (sec[1] == 4'b1010)
                        begin
                            sec[1] = 4'b0000;
                            sec[2] = sec[2] + 1;
                            if (sec[2] == 4'b1010)
                            begin
                                sec[2] = 4'b0000;
                            end
                        end
                    end
                end
            end
        end
    end
end

always@(*)
    begin
        case({neglit})
		  8'b00000001: dig_T = ms[0];
		  8'b00000010: dig_T = ms[1];
		  8'b00000100: dig_T = ms[2];
		  8'b00001000: dig_T = 4'b1111;
		  8'b00010000: dig_T = sec[0];
		  8'b00100000: dig_T = sec[1];
		  8'b01000000: dig_T = sec[2];
		  8'b10000000: dig_T = 4'b1111;
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
