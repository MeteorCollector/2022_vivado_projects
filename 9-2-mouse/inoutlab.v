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
wire [23:0] key_data;   
wire ready;
//wire [7:0] key_ascii;
reg [31:0] seg7_data;
//reg [7:0] newcount;
reg [7:0] xdata;
//reg [7:0] newprev;
reg [7:0] ydata;
reg [7:0] front;
//reg [7:0] newcurr;
reg ignore_next;   //忽略扫描码
reg pressing;    //键按下标志位
reg endflag;
reg reset;

reg Left;
reg Right;


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
always @(negedge PS2_CLK) begin // original: posedge PS2_CLK

    //pressing = ready && (key_data != 8'H00) && (key_data != 8'HF0);
    //ignore_next = (~pressing) || (ready && (key_data == key_currentdata) && (key_data != 8'HF0));
    /*
    if (BTNC) begin
        xdata = 8'H00;
        ydata = 8'H00;
        
        seg7_data[3:0] = xdata[3:0];
        seg7_data[7:4] = xdata[7:4];
        seg7_data[11:8] = {front[4], front[4], front[4], front[4]};
        seg7_data[15:12] = {front[4], front[4], front[4], front[4]};
        seg7_data[19:16] = ydata[3:0];
        seg7_data[23:20] = ydata[7:4];
        seg7_data[27:24] = {front[5], front[5], front[5], front[5]};
        seg7_data[31:28] = {front[5], front[5], front[5], front[5]};
    end
    */
    
    //begin
        front = key_data[7:0];
        xdata = key_data[15:8];
        ydata = key_data[23:16];
        Left = front[0];//左键按下
        Right = front[1];//右键按下
        //else begin ignore_next = 1'b0; end
        
        seg7_data[3:0] = xdata[3:0];
        seg7_data[7:4] = xdata[7:4];
        seg7_data[11:8] = {front[4], front[4], front[4], front[4]}; //符号位
        seg7_data[15:12] = {front[4], front[4], front[4], front[4]}; //符号位
        seg7_data[19:16] = ydata[3:0];
        seg7_data[23:20] = ydata[7:4];
        seg7_data[27:24] = {front[5], front[5], front[5], front[5]}; //符号位
        seg7_data[31:28] = {front[5], front[5], front[5], front[5]}; //符号位
        //else begin ignore_next = 1'b0; end
    //end
end


assign LED[15:8]={Left, Left, Left, Left, Left, Left, Left, Left}; //左键按下
assign LED[7:0]={Right, Right, Right, Right, Right, Right, Right, Right}; //右键按下
//assign LED[7:0] = {PS2_DATA, PS2_DATA, PS2_DATA, PS2_DATA, PS2_DATA, PS2_DATA, PS2_DATA, PS2_DATA};
// LED[15:8] = {PS2_CLK, PS2_CLK, PS2_CLK, PS2_CLK, PS2_CLK, PS2_CLK, PS2_CLK, PS2_CLK};

//7段数码管显示数据拼接代码

seg7decimal sevenSeg (
.x(seg7_data[31:0]),
.clk(CLK100MHZ),
.seg(SEG[6:0]),
.an(AN[7:0]),
.dp(DP) 
);
 
endmodule
