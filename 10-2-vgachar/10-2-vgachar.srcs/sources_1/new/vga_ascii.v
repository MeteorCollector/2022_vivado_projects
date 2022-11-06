`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/05 20:25:16
// Design Name: 
// Module Name: vga_ascii
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


module vga_ascii(
    input pclk,
    input rst,
    input c_valid,
    output reg [23:0] vga_data,
    input [7:0] char,
    input [3:0] h_font,
    input [3:0] v_font,
    input cursor
    );
    reg [11:0] myfont[4095:0];
    wire [11:0] line;
    initial
    begin
        $readmemh("D:/Projects/Vivado_Projects/10-2-vgachar/vga_font.txt", myfont, 0, 4095);
    end
    
    wire [23:0] out_data;
    wire [23:0] frontcolor;
    wire [23:0] backcolor;
    wire cursorline;
    
    assign frontcolor = 24'hFFFFFF;
    assign backcolor = 24'h000000;
    
    assign out_data = (line[h_font] == 1'b1 | cursorline) ? frontcolor : backcolor;
    assign line = myfont[{char, v_font}];
    
    assign cursorline = cursor & (h_font == 4'd0);
    
    always @(posedge pclk)
    begin
        if (rst == 1'b1)
            vga_data <= 24'h000000;
        else
        begin
            if (c_valid == 1'b1)
                vga_data <= out_data;
            else
                vga_data <= backcolor;
        end
    end
endmodule
