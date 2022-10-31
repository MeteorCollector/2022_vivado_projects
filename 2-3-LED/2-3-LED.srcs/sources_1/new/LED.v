`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/26 19:40:58
// Design Name: 
// Module Name: LED
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


module dec7seg(
//端口声明
    output reg [6:0] O_seg, //7位显示段输出
    output reg [7:0] O_led, //8个数码管输出控制
    input [3:0] I, //4位数据输入，需要显示的数字
    input [2:0] S //3位译码选择指定数码管显示
);

always @(*)
begin
    case({I})
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
        4'b1010: O_seg = 7'b0001000;
        4'b1011: O_seg = 7'b0000011;
        4'b1100: O_seg = 7'b1000110;
        4'b1101: O_seg = 7'b0100001;
        4'b1110: O_seg = 7'b0000110;
        4'b1111: O_seg = 7'b0001110;
    endcase
    case({S})
        3'b000: O_led = 8'b11111110;
        3'b001: O_led = 8'b11111101;
        3'b010: O_led = 8'b11111011;
        3'b011: O_led = 8'b11110111;
        3'b100: O_led = 8'b11101111;
        3'b101: O_led = 8'b11011111;
        3'b110: O_led = 8'b10111111;
        3'b111: O_led = 8'b01111111;
    endcase
end
endmodule
