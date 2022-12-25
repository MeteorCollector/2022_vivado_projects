`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/23 10:06:25
// Design Name: 
// Module Name: scancode_to_ascii
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


module scancode_to_ascii(addr,outdata,capslock);
input [7:0] addr;
input capslock;
output [7:0] outdata;
reg [7:0] kbscantoasc[255:0];
initial
begin
    $readmemh("D:/Projects/Vivado_Projects/Computer_System/IOdevices/scancode.txt", kbscantoasc, 0, 255);
end
assign   outdata = (capslock && kbscantoasc[addr] > 8'H60) ? kbscantoasc[addr] - 8'H20 : kbscantoasc[addr];

endmodule
