`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/22 21:28:41
// Design Name: 
// Module Name: inoutlab
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

module inoutlab(
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA,
    input BTNC,      //Reset
    output [6:0]SEG,
    output [7:0]AN,
    output DP,
    output [15:0] LED   //显示
    );
    
reg CLK50MHZ=0; 
wire [7:0] key_data;   
wire ready;
wire [7:0] key_ascii;
reg [31:0] seg7_data;
reg [7:0] key_count;
//reg [7:0] newcount;
reg [7:0] key_prevdata;
//reg [7:0] newprev;
reg [7:0] key_currentdata;
//reg [7:0] newcurr;
reg ignore_next;   //忽略扫描码
reg pressing;    //键按下标志位
reg endflag;
reg reset;

reg Is_Caps;
reg Is_Num;
reg Is_Ctrl;
reg Is_Alt;
reg Is_Shift;


always @(posedge(CLK100MHZ))begin
    CLK50MHZ<=~CLK50MHZ;
end

PS2Receiver kbscancode (
.clk(CLK50MHZ),
.kclk(PS2_CLK),
.kdata(PS2_DATA),
.keycodeout(key_data),
.ready(ready)
);

//扫描码识别处理流程
always @(posedge PS2_CLK, posedge BTNC) begin
    //pressing = ready && (key_data != 8'H00) && (key_data != 8'HF0);
    //ignore_next = (~pressing) || (ready && (key_data == key_currentdata) && (key_data != 8'HF0));
    if (BTNC) begin
        key_prevdata = 8'H00;
        key_currentdata = 8'H00;
        key_count = 8'H00;
        pressing = 1'b0;
        ignore_next = 1'b0;
        
        seg7_data[3:0] = key_count == 8'H00 ? 8'H00 : key_ascii[3:0];
        seg7_data[7:4] = key_count == 8'H00 ? 8'H00 : key_ascii[7:4];
        seg7_data[11:8] = key_currentdata[3:0];
        seg7_data[15:12] = key_currentdata[7:4];
        seg7_data[19:16] = key_prevdata[3:0];
        seg7_data[23:20] = key_prevdata[7:4];
        seg7_data[27:24] = key_count[3:0];
        seg7_data[31:28] = key_count[7:4];
        Is_Shift = (key_data == 8'H12 || key_data == 8'H59) && pressing;
        Is_Num = key_data == 8'H77 && pressing;
        Is_Ctrl = key_data == 8'H14 && pressing;
        Is_Alt = key_data == 8'H11 && pressing;
        Is_Caps = key_data == 8'H58 && pressing;
    end
    else begin
        if (ready) begin
            if (ignore_next == 1'b0 && key_data != 8'HF0) begin
                key_prevdata = key_currentdata;
                key_currentdata = key_data;
                key_count = key_count + 1;
                //ignore_next = 1'b0;
                pressing = 1'b1;
            end
            if (ignore_next == 1'b1) begin ignore_next = 1'b0; end
            if (key_data == 8'HF0) begin pressing = 1'b0; ignore_next = 1'b1; endflag = 1'b1; end
            else if (key_data == key_currentdata) begin
                if (endflag == 1'b1) begin ignore_next = 1'b0; endflag = 1'b0; end
                else begin ignore_next = 1'b1; end
            end
        //else begin ignore_next = 1'b0; end
        end
        
        seg7_data[3:0] = key_count == 8'H00 ? 8'H00 : key_ascii[3:0];
        seg7_data[7:4] = key_count == 8'H00 ? 8'H00 : key_ascii[7:4];
        seg7_data[11:8] = key_currentdata[3:0];
        seg7_data[15:12] = key_currentdata[7:4];
        seg7_data[19:16] = key_prevdata[3:0];
        seg7_data[23:20] = key_prevdata[7:4];
        seg7_data[27:24] = key_count[3:0];
        seg7_data[31:28] = key_count[7:4];
        Is_Shift = (key_data == 8'H12 || key_data == 8'H59) && pressing;
        Is_Num = key_data == 8'H77 && pressing;
        Is_Ctrl = key_data == 8'H14 && pressing;
        Is_Alt = key_data == 8'H11 && pressing;
        Is_Caps = key_data == 8'H58 && pressing;
        //else begin ignore_next = 1'b0; end
    end
    
end

scancode_to_ascii key_asc(key_currentdata,key_ascii);

assign LED[15]=Is_Caps;
assign LED[14]=Is_Num;
assign LED[13]=Is_Ctrl;
assign LED[12]=Is_Alt;
assign LED[11]=Is_Shift;
assign LED[10]=ignore_next;
assign LED[9]=pressing;
assign LED[7:0]=key_currentdata;

//7段数码管显示数据拼接代码

seg7decimal sevenSeg (
.x(seg7_data[31:0]),
.clk(CLK100MHZ),
.seg(SEG[6:0]),
.an(AN[7:0]),
.dp(DP) 
);
 
endmodule
