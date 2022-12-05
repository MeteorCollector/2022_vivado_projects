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
    input [3:0] KEY,
    input CLK100MHZ,  
    input [15:0] SW,
    output [15:0] LED,
    output [7:0] AN,
    output [7:0] HEX,
    input  BTNC,
    input  PS2_CLK,
    input  PS2_DATA,
    output [3:0] VGA_R,
    output [3:0] VGA_G,
    output [3:0] VGA_B,
    output  VGA_HS,
    output  VGA_VS
    );
    
/* flags */

reg capslock;



//////////////
wire clk;
wire clk_1m;
reg [26:0] tick;
reg clk_1s;
reg clk_25m = 1'b0;
wire clk_50m;
//wire [11:0] vga_data;
wire valid;

//keyboard

reg nextdata_n;
wire [5:0] dp;
wire ready;
reg endflag;
wire [7:0] keydata;

//wire [7:0] hexbuf0, hexbuf1, hexbuf2, hexbuf3;

reg [7:0] key_count;
reg pressing;
reg ignore_next;
reg [7:0] key_currentdata;
reg [7:0] key_prevdata;
wire [7:0] key_ascii;

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
wire [11:0] char_addr;
reg  [11:0] char_wr_addr;
wire [11:0] char_rd_addr;
reg  [7:0]  char_buf_data;
wire [7:0]  char_out;
reg  [6:0]  line_end[31:0];
reg  [4:0]  line_offset;
reg  [6:0]  clear_point;

// led
wire [31:0] seg7_data;

seg7decimal sevenSeg (
.x(seg7_data[31:0]),
.clk(CLK100MHZ),
.seg(HEX[6:0]),
.an(AN[7:0]),
.dp(dp) 
);


// keyboard part

ps2_keyboard mykey(clk_50m, BTNC, PS2_CLK, PS2_DATA, keydata, ready, nextdata_n, LED[6:4], LED[3]);

//scancode_ram myram(clk_50m, current_key, key_ascii);// not implemented


assign seg7_data [3:0] = key_currentdata[3:0];
assign seg7_data [7:4] = key_currentdata[7:4];
assign seg7_data [11:8] = key_ascii[3:0];
assign seg7_data [15:12] = key_ascii[7:4];
assign seg7_data [19:16] = key_count[3:0];
assign seg7_data [23:20] = key_count[7:4];
assign seg7_data [27:24] = char_buf_data[3:0];
assign seg7_data [31:28] = char_buf_data[7:4];

assign LED[15] = capslock;
assign LED[7] = BTNC;
assign LED[1] = in_state == 2'd1;
assign LED[2] = new_key;
//
/*
PS2Receiver kbscancode (
.clk(clk_50m),
.kclk(PS2_CLK),
.kdata(PS2_DATA),
.keycodeout(keydata),
.ready(ready)
);
*/
always @(posedge(clk_50m))begin
    clk_25m <= ~clk_25m;
end


always @(posedge clk_50m)
begin
    if (tick >= 27'd30000000) begin clk_1s <= ~clk_1s; tick <= 27'd0; end
    else begin tick <= tick + 1'b1; end
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

/*
always @(posedge clk_50m) begin
    //pressing = ready && (key_data != 8'H00) && (key_data != 8'HF0);
    //ignore_next = (~pressing) || (ready && (key_data == key_currentdata) && (key_data != 8'HF0));
    if (BTNC) begin
        key_prevdata <= 8'H00;
        key_currentdata <= 8'H00;
        key_count <= 8'H00;
        pressing <= 1'b0;
        ignore_next <= 1'b0;
        new_key <= 1'b0;
        
        seg7_data[3:0] <= key_count == 8'H00 ? 8'H00 : key_ascii[3:0];
        seg7_data[7:4] <= key_count == 8'H00 ? 8'H00 : key_ascii[7:4];
        seg7_data[11:8] <= key_currentdata[3:0];
        seg7_data[15:12] <= key_currentdata[7:4];
        seg7_data[19:16] <= key_prevdata[3:0];
        seg7_data[23:20] <= key_prevdata[7:4];
        seg7_data[27:24] <= key_count[3:0];
        seg7_data[31:28] <= key_count[7:4];

    end
    else begin
        if (ready) begin
            if (ignore_next == 1'b0 && keydata != 8'HF0) begin
                key_prevdata <= key_currentdata;
                key_currentdata <= keydata;
                key_count <= key_count + 1;
                new_key <= 1'b1;
                //ignore_next = 1'b0;
                pressing <= 1'b1;
            end
            if (ignore_next == 1'b1) begin ignore_next <= 1'b0; end
            if (keydata == 8'HF0) begin pressing <= 1'b0; ignore_next <= 1'b1; endflag <= 1'b1; end
            else begin
                new_key <= 1'b0;
                if (keydata == key_currentdata) begin
                    if (endflag == 1'b1) begin ignore_next <= 1'b0; endflag <= 1'b0; end
                    else begin ignore_next <= 1'b1; end
                end
            end
        //else begin ignore_next = 1'b0; end
        end
        
        seg7_data[3:0] <= key_count == 8'H00 ? 8'H00 : key_ascii[3:0];
        seg7_data[7:4] <= key_count == 8'H00 ? 8'H00 : key_ascii[7:4];
        seg7_data[11:8] <= key_currentdata[3:0];
        seg7_data[15:12] <= key_currentdata[7:4];
        seg7_data[19:16] <= key_prevdata[3:0];
        seg7_data[23:20] <= key_prevdata[7:4];
        seg7_data[27:24] <= key_count[3:0];
        seg7_data[31:28] <= key_count[7:4];

        //else begin ignore_next = 1'b0; end
    end
    
end
*/
scancode_to_ascii key_asc(key_currentdata, key_ascii, capslock);


always @(posedge clk_50m)
begin
    if (BTNC == 1'b1) // reset ////////////////////////////////////////
    begin
        h_cur <= 7'h0;
        v_cur <= 6'h0;
        in_state <= 2'd0;
        line_offset <= 5'd0;
        clear_point = 7'd0;
        char_buf_data <= 8'h00;
        char_wr_addr <= {clear_point, 5'd31};
    end
    else
    begin
        case (new_key) // original: in_state
            2'd0: begin // state 0: wait for new key
                //if (new_key == 1'b1) in_state <= 2'd1;
                char_wr <= 1'b0;// | ~clk_25m;
                if (~char_wr)
                begin
                    char_buf_data <= 8'h00; // clean the unused lines
                    clear_point <= clear_point + 1'd1;
                    char_wr_addr <= {clear_point, (5'd30 + line_offset)}; // after line 30, no more lines.
                    //char_wr_addr <= {clear_point, (5'd31 + line_offset)}; // after line 30, no more lines.
                    line_end[5'd31 + line_offset] = 7'd0; // line_end array records the length of each line.
                end
            end
            2'd1: begin
                in_state <= 2'd3;
                //in_state <= 2'd0;
                if (key_currentdata == 8'h0d) begin end // tab
                else if (key_currentdata == 8'h58) 
                begin 
                    capslock <= ~capslock;
                end // caps
                else if (key_currentdata == 8'h12) begin end // shift
                else if (key_currentdata == 8'h14) begin end // ctrl
                else if (key_currentdata == 8'h11) begin end // alt
                else if (key_currentdata == 8'h77) begin end // numlock
                else if (key_currentdata == 8'h66) // backspace
                begin
                    char_buf_data <= 8'h00;
                    char_wr <= 1'b1;
                    if (h_cur == 7'd0) // first column
                    begin
                        if (v_cur == 5'd0) // first line
                        begin
                            h_cur <= 7'd0; // nothing happens, align to (0, 0)
                            v_cur <= 5'd0;
                            char_wr_addr <= 12'd0 + {7'd0, line_offset}; // {0, v_cur}
                        end
                        else
                        begin
                            h_cur <= line_end[v_cur - 5'd1 + line_offset]; // h_cur set to last end of line
                            v_cur <= v_cur - 5'd1; // v_cur decreases by 1
                            //char_wr_addr <= { line_end[v_cur - 5'd1 + line_offset], (v_cur - 5'd1 + line_offset)}; // {69, v_cur}
                            char_wr_addr <= {7'd69, (v_cur - 5'd1 + line_offset)}; // {69, v_cur}
                        end
                    end
                    else
                    begin
                        char_wr_addr <= { (h_cur - 7'd1), v_cur + line_offset }; // only h_cur decreases by 1
                        h_cur <= h_cur - 7'd1;
                    end
                end
                else if (key_currentdata == 8'h5A) // enter
                begin
                    if (v_cur == 5'd29) // has reached the bottom of screen vertically
                        line_offset <= line_offset + 1'd1; // roll screen
                    else
                        v_cur <= v_cur + 5'd1; // new line
                    line_end[v_cur + line_offset] <= h_cur; // this line has been fixed
                    h_cur <= 7'd0; // new line begins
                end
                else // normal situation
                begin
                   char_buf_data <= key_ascii;
                   char_wr_addr <= {h_cur, (v_cur + line_offset)};
                   char_wr <= 1'b1;
                   h_cur <= h_cur + 7'd1;
                   // after the insertion of this char, judge the situation
                   if (h_cur >= 7'd69) // new line
                   begin
                        if (v_cur == 5'd29) // line full
                            line_offset <= line_offset + 1'd1; // roll screen
                        else
                            v_cur <= v_cur + 5'd1; // new line
                        line_end[v_cur + line_offset] <= h_cur; // record the end of last line
                        h_cur <= 7'd0; // new line starts
                   end
                end
            end
        endcase
        m_char <= char_out; // always lock the readings
    end
end
/*
always @(posedge clk_50m)
begin
    if (BTNC == 1'b1) // reset ////////////////////////////////////////
    begin
        h_cur <= 7'h0;
        v_cur <= 6'h0;
        in_state <= 2'd0;
        line_offset <= 5'd0;
        clear_point = 7'd0;
        char_buf_data <= 8'h00;
        char_wr_addr <= {clear_point, 5'd31};
    end
    else
    begin
        case (in_state)
            2'd0: begin // state 0: wait for new key
                if (new_key == 1'b1) in_state <= 2'd3;
                char_wr <= 1'b0 | ~clk_25m;
                if (~char_wr)
                begin
                    char_buf_data <= 8'h00; // clean the unused lines
                    clear_point <= clear_point + 1'd1;
                    char_wr_addr <= {clear_point, (5'd31 + line_offset)};
                    line_end[5'd31 + line_offset] = 7'd0;
                end
            end
            2'd1: begin
                in_state <= 2'd0;
                if (key_currentdata == 8'h66) // backspace
                begin
                    char_buf_data <= 8'h00;
                    char_wr <= 1'b1;
                    if (h_cur == 7'd0)
                    begin
                        if (v_cur == 5'd0)
                        begin
                            h_cur <= 7'd0;
                            v_cur <= 5'd0;
                            char_wr_addr <= 12'd0 + {7'd0, line_offset};
                        end
                        else
                        begin
                            h_cur <= line_end[v_cur - 5'd1 + line_offset];
                            v_cur <= v_cur - 5'd1;
                            char_wr_addr <= {7'd69, (v_cur - 5'd1 + line_offset)};
                        end
                    end
                    else
                    begin
                        char_wr_addr <= { (h_cur - 7'd1), v_cur + line_offset };
                        h_cur <= h_cur - 7'd1;
                    end
                end
                else if (key_currentdata == 8'h5A) // enter
                begin
                    if (v_cur == 5'd29)
                        line_offset <= line_offset + 1'd1;
                    else
                        v_cur <= v_cur + 5'd1;
                    line_end[v_cur + line_offset] <= h_cur;
                    h_cur <= 7'd0;
                end
                else
                begin
                   char_buf_data <= key_ascii;
                   char_wr_addr <= {h_cur, (v_cur + line_offset)};
                   char_wr <= 1'b1;
                   h_cur <= h_cur + 7'd1;
                   if (h_cur >= 7'd69)
                   begin
                        if (v_cur == 5'd29)
                            line_offset <= line_offset + 1'd1;
                        else
                            v_cur <= v_cur + 5'd1;
                        line_end[v_cur + line_offset] <= h_cur;
                        h_cur <= 7'd0;
                   end
                end
            end
            2'd2: begin in_state <= 2'd1; char_wr <= 1'b0 | ~clk_25m; end
            2'd3: begin in_state <= 2'd2; char_wr <= 1'b0 | ~clk_25m; end
        endcase
        m_char <= char_out; // always lock the readings
    end
end
*/
//clkgen #(1000000) my1m_clk(CLK100MHZ,SW[0],1'b1,clk_1m);
//clkgen #(25000000) my25m_clk(CLK100MHZ,SW[0],1'b1,clk_25m);
assign clk=CLK100MHZ;
//clk_wiz_0 my25m_clk(.clk_in1(CLK100MHZ),.reset(SW[0]),.locked(LED[0]),.clk_out1(clk_25m));
clk_wiz_1 my50m_clk(.clk_in1(CLK100MHZ),.reset(SW[0]),.locked(LED[0]),.clk_out1(clk_50m));
//sevenseg my_7seg(clk_1m,8'h00, 32'h0,AN,HEX);
//seg7decimal my_7_seg(32'h0,clk_25m,HEX[6:0],HEX[7],AN);
//assign LED=16'h0;


vga_ctrl my_vga(clk_25m, SW[0], vga_data, h_addr, v_addr, VGA_HS, VGA_VS, valid, VGA_R, VGA_G, VGA_B, h_char, v_char, h_font, v_font);
//vga_ram myram(.addra({h_addr,v_addr[8:0]}),.clka(clk),.ena(1'b1),.wea(1'b0),.dina(12'd0),.douta(vga_data));
assign VGA_SYNC_N = 1'b0;
vga_ascii ascii(clk_50m, SW[0], valid, vga_data, m_char, h_font, v_font, cursor, clk_1s);// checkout if valid is flipped
char_buf mybuf(.addra(char_addr),.clka(~clk_50m),.ena(1'b1),.dina(char_buf_data),.wea(char_wr),.douta(char_out));// should clk flip? wea = 1, write; otherwise read

assign char_addr = (char_wr) ? char_wr_addr : char_rd_addr;
assign char_rd_addr = {h_char, (v_char + line_offset)};

assign cursor = (h_char == h_cur) & (v_char == v_cur);// & clk_cur;

endmodule
