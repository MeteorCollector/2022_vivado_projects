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
    input cursor,
    input clk_1s,
    input fancy,
    input [6:0] h_cur,
    input [4:0] v_cur
    );
    reg [11:0] myfont[4095:0];
    wire [11:0] line;
    reg [26:0] tick;
    reg anim_clk;
    reg [5:0] basecolor;
    reg [11:0] colorpool [47:0];
    
    initial
    begin
        $readmemh("D:/Projects/Vivado_Projects/Computer_System/IOdevices/vga_font.txt", myfont, 0, 4095);
        basecolor = 6'd0;
        
        colorpool[0] = 12'h00f;
        colorpool[1] = 12'h10e;
        colorpool[2] = 12'h20d;
        colorpool[3] = 12'h30c;
        colorpool[4] = 12'h40b;
        colorpool[5] = 12'h50a;
        colorpool[6] = 12'h609;
        colorpool[7] = 12'h708;
        colorpool[8] = 12'h807;
        colorpool[9] = 12'h906;
        colorpool[10] = 12'ha05;
        colorpool[11] = 12'hb04;
        colorpool[12] = 12'hc03;
        colorpool[13] = 12'hd02;
        colorpool[14] = 12'he01;
        colorpool[15] = 12'hf00;
        
        colorpool[16] = 12'hf00;
        colorpool[17] = 12'he10;
        colorpool[18] = 12'hd20;
        colorpool[19] = 12'hc30;
        colorpool[20] = 12'hb40;
        colorpool[21] = 12'ha50;
        colorpool[22] = 12'h960;
        colorpool[23] = 12'h870;
        colorpool[24] = 12'h780;
        colorpool[25] = 12'h690;
        colorpool[26] = 12'h5a0;
        colorpool[27] = 12'h4b0;
        colorpool[28] = 12'h3c0;
        colorpool[29] = 12'h2d0;
        colorpool[30] = 12'h1e0;
        colorpool[31] = 12'h0f0;
        
        colorpool[32] = 12'h0f0;
        colorpool[33] = 12'h0e1;
        colorpool[34] = 12'h0d2;
        colorpool[35] = 12'h0c3;
        colorpool[36] = 12'h0b4;
        colorpool[37] = 12'h0a5;
        colorpool[38] = 12'h096;
        colorpool[39] = 12'h087;
        colorpool[40] = 12'h078;
        colorpool[41] = 12'h069;
        colorpool[42] = 12'h05a;
        colorpool[43] = 12'h04b;
        colorpool[44] = 12'h03c;
        colorpool[45] = 12'h02d;
        colorpool[46] = 12'h01e;
        colorpool[47] = 12'h00f;
    end
    
    wire [23:0] out_data;
    wire [23:0] frontcolor;
    wire [23:0] backcolor;
    wire cursorline;
    
    assign frontcolor = fancy ? { 12'h000, colorpool[(basecolor + {6'b000000, h_cur} + {8'h00, v_cur}) % 6'd48]} : 24'hFFFFFF;
    assign backcolor = 24'h000000;
    
    assign out_data = (line[h_font] == 1'b1 | (cursorline & clk_1s)) ? frontcolor : backcolor;
    assign line = myfont[{char, v_font}];
    
    assign cursorline = cursor & (h_font == 4'd0);
    
    always @(posedge anim_clk)
    begin
        if (basecolor == 6'd47) begin basecolor <= 6'd0; end
        else begin basecolor <= basecolor + 1; end
    end
    
    always @(posedge pclk)
    begin
        if (tick >= 27'd1000000) begin tick <= 27'd0; anim_clk <= ~anim_clk; end
        else begin tick <= tick + 1; end
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
