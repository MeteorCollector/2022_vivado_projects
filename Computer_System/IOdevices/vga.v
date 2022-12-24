`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/24 00:36:56
// Design Name: 
// Module Name: vga
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


module vga(
    input clk_25m,
    input clk_50m,
    input [15:0] SW,
    input  BTNC,
    input  PS2_CLK,
    input  PS2_DATA,
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B,
    output [14:0] char_addr,
    input  [7:0]  char_out,
    output  VGA_HS,
    output  VGA_VS
    );
    
/* flags */
wire valid;
//vga
wire [9:0] h_addr;
wire [9:0] v_addr;
wire [23:0] vga_data;

wire [6:0] h_char;  // char 70 per line
wire [4:0] v_char;  // char 30 lines
wire [3:0] h_font;  // font 9 point vertical
wire [3:0] v_font;  // font 16 point vertical

reg [7:0] m_char;   // current char

reg [6:0] h_cur;
reg [4:0] v_cur;
reg       new_key;
reg [1:0] in_state; // to wait for scancode translate
wire      cursor;
wire      clk_cur;
reg       char_wr;
reg  [6:0]  line_end[31:0];
reg  [4:0]  line_offset;
reg  [6:0]  clear_point;


vga_ctrl my_vga(clk_25m, SW[0], vga_data, h_addr, v_addr, VGA_HS, VGA_VS, valid, VGA_R, VGA_G, VGA_B, h_char, v_char, h_font, v_font);
//vga_ram myram(.addra({h_addr,v_addr[8:0]}),.clka(clk),.ena(1'b1),.wea(1'b0),.dina(12'd0),.douta(vga_data));
assign VGA_SYNC_N = 1'b0;
vga_ascii ascii(clk_50m, SW[0], valid, vga_data, char_out, h_font, v_font, cursor, clk_1s, SW[1], h_char, v_char);// checkout if valid is flipped
char_buf mybuf(.addra(char_addr),.clka(~clk_50m),.ena(1'b1),.dina(char_buf_data),.wea(char_wr),.douta(char_out));// should clk flip? wea = 1, write; otherwise read

assign cursor = (h_char == h_cur) & (v_char == v_cur);// & clk_cur;

endmodule
