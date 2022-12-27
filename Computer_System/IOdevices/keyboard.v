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
module key_ctrl(kdataout, frontaddr, frontdata, rdclk, memop, memwe, keydbgdata, clk_50m, PS2_CLK, PS2_DATA, BTNC);
    output [31:0] kdataout;
    input  [15:0] frontaddr;
    input  [7:0]  frontdata;
    input         rdclk;
    input  [2:0]  memop;
    input         memwe;
    output [31:0] keydbgdata;
    input         clk_50m;
    input         PS2_CLK;
    input         PS2_DATA;
    input         BTNC;
    
reg  [15:0] endaddr;
wire [7:0]  bufout;
wire        we;
wire [7:0]  push_data;
integer max_addr = 16'h00ff;
//assign we = memwe;

initial
begin
    endaddr = 16'h0000;
end

assign kdataout = {24'h000000, bufout};

always @(posedge clk_50m)
begin 
    if (push_data) 
    begin 
        if (endaddr >= max_addr) 
        begin endaddr = 16'h0000; end 
        else begin endaddr = endaddr + 1'b1; end 
    end
end
/*
always @(posedge rdclk)
begin 
    if (memwe && (frontaddr <= endaddr)) // warning: buffer will overflow, i tend to maintain the front in software.
    begin 
        if (frontaddr >= max_addr) 
        begin frontaddr = 15'h0; end 
        else begin frontaddr = frontaddr + 1'b1; end 
    end
end
*/
keyboard my_keyboard(.clk_50m(clk_50m),.keydbgdata(keydbgdata),.push_front(we),.data(push_data),
                     .BTNC(BTNC),.PS2_CLK(PS2_CLK),.PS2_DATA(PS2_DATA));
key_buffer_ram key_ram(.clka(rdclk),.ena(1'b1),.wea(memwe),.addra(frontaddr),.dina(frontdata),.douta(bufout),
                       .clkb(clk_50m),.enb(1'b1),.web(we),.addrb(endaddr),.dinb(push_data),.doutb()
                       );
    
endmodule

module keyboard(
    input         clk_50m,
    output [31:0] keydbgdata,
    output        push_front,
    output [7:0]  data,
    input         BTNC,
    input         PS2_CLK,
    input         PS2_DATA
);

reg        nextdata_n;
wire       ready;
wire [7:0] keydata;
reg  [7:0] key_count;
reg        pressing;
reg        ignore_next;
reg  [7:0] key_currentdata;
reg  [7:0] key_prevdata;
wire [7:0] key_ascii;
reg        new_key;
reg        capslock;
wire       is_shift;
wire       uppercase;

reg  [7:0] char_buf_data;
reg        char_wr;

assign push_front = char_wr;
assign data       = char_buf_data;

assign keydbgdata [3:0] = key_currentdata[3:0];
assign keydbgdata [7:4] = key_currentdata[7:4];
assign keydbgdata [11:8] = key_ascii[3:0];
assign keydbgdata [15:12] = key_ascii[7:4];
assign keydbgdata [19:16] = key_count[3:0];
assign keydbgdata [23:20] = key_count[7:4];

// reference module    (clk,     clr,  ps2_clk, ps2_data, data,    ready, nextdata_n, ps2_clk_sync,sample,overflow);
ps2_keyboard mykeyboard(clk_50m, BTNC, PS2_CLK, PS2_DATA, keydata, ready, nextdata_n);
scancode_to_ascii key_asc(key_currentdata, key_ascii, uppercase);

always @(posedge clk_50m)
begin
    if(ready == 1'b1 && nextdata_n == 1'b1)
    //if(ready == 1'b1)
    begin
        if(keydata == 8'hF0)
        begin
            ignore_next <= 1'b1;
            pressing <= 1'b0;
            //key_currentdata <= 8'b0;
        end
        else if (keydata == 8'hE0) // special key
        begin
            ignore_next <= 1'b1;
        end
        else if (ignore_next) // after F0 or E0
        begin
            ignore_next <= 1'b0; // ignore, but read next key
        end
        else // normal key
        begin
            pressing <= 1'b1;
            new_key <= 1'b1;
            if (keydata != key_currentdata) // not continous
            begin
                key_count <= key_count + 8'd1;
                key_currentdata <= keydata;
            end
        end
        nextdata_n <= 1'b0;
    end
    else begin nextdata_n <= 1'b1; new_key <= 1'b0; end
    if (BTNC == 1'b1) // reset, flipped from negative trigger /////////////////////////////
    begin
        key_count <= 8'h0;
        key_currentdata <= 8'h0;
        pressing <= 1'b0;
        ignore_next <= 1'b0;
        new_key <= 1'b0;
    end
end

assign is_shift = (key_currentdata == 8'h12);
assign uppercase = is_shift | capslock;

always @(posedge clk_50m)
begin
    begin
        case (new_key) // original: in_state
            2'd0: begin // state 0: wait for new key
                char_wr <= 1'b0;
            end
            2'd1: begin
                if (key_currentdata == 8'h58) 
                begin 
                    capslock <= ~capslock;
                end // caps
                else if (key_currentdata == 8'h12) begin end // shift
                else if (key_currentdata == 8'h14) begin end // ctrl
                else if (key_currentdata == 8'h11) begin end // alt
                else if (key_currentdata == 8'h77) begin end // numlock
                else if (key_currentdata == 8'h66) begin end // backspace
                else if (key_currentdata == 8'h5A) begin end // enter
                //else // normal situation
                begin
                   char_buf_data <= key_ascii;
                   char_wr <= 1'b1;
                end
            end
        endcase
    end
end

endmodule
