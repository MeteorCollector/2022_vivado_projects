`timescale 1ns / 1ps

module PS2Receiver(
    input clk,
    input kclk,//键盘时钟信号
    input kdata,//键盘串行数据
    output [23:0] keycodeout,//接收到扫描码
    output ready//键盘扫描码接收完成
    );
    wire kclkf, kdataf;
    reg [23:0]datacur;
    reg [23:0]dataprev;
    reg [5:0]cnt;          //接受串行位数
    reg [23:0]keycode;
    reg flag;            //接受1帧数据
    reg readyflag;
    
    initial begin
        keycode[7:0]<=8'b00000000;
        cnt<=4'b0000;
        readyflag<=1'b0;
 //       flag<=1'b0;
    end
    
debouncer debounce(      //消抖
    .clk(clk),
    .I0(kclk),
    .I1(kdata),
    .O0(kclkf),
    .O1(kdataf)
);

always@(negedge(kclkf))begin
    case(cnt)
    0:;//Start bit
    1:datacur[0]<=kdataf;
    2:datacur[1]<=kdataf;
    3:datacur[2]<=kdataf;
    4:datacur[3]<=kdataf;
    5:datacur[4]<=kdataf;
    6:datacur[5]<=kdataf;
    7:datacur[6]<=kdataf;
    8:datacur[7]<=kdataf;
    9:;
    10:;
    11:;
    12:datacur[8]<=kdataf;
    13:datacur[9]<=kdataf;
    14:datacur[10]<=kdataf;
    15:datacur[11]<=kdataf;
    16:datacur[12]<=kdataf;
    17:datacur[13]<=kdataf;
    18:datacur[14]<=kdataf;
    19:datacur[15]<=kdataf;
    20:;
    21:;
    22:;
    23:datacur[16]<=kdataf;
    24:datacur[17]<=kdataf;
    25:datacur[18]<=kdataf;
    26:datacur[19]<=kdataf;
    27:datacur[20]<=kdataf;
    28:datacur[21]<=kdataf;
    29:datacur[22]<=kdataf;
    30:datacur[23]<=kdataf;
    31:flag<=1'b1;
    32:flag<=1'b0;
     endcase
        if(cnt<=31) cnt<=cnt+1;
        else if(cnt==32)  cnt<=0;
end

always @(posedge flag)begin
    if (dataprev!=datacur)begin //去重
//        keycode[31:24]<=keycode[23:16];
//        keycode[23:16]<=keycode[15:8];
 //       keycode[15:8]<=dataprev;
        keycode<=datacur;
        dataprev<=datacur;
        readyflag<=1'b1;
    end
    //else begin readyflag <= 1'b0; end
end
    
assign keycodeout=keycode;
assign ready = flag & readyflag;// original: = readyflag
endmodule

