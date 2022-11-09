`timescale 1ns / 1ps

module PS2Receiver(
    input clk,
    input kclk,//键盘时钟信号
    input kdata,//键盘串行数据
    output [7:0] keycodeout,//接收到扫描码
    output ready//键盘扫描码接收完成
    );
    wire kclkf, kdataf;
    reg [7:0]datacur;
    reg [7:0]dataprev;
    reg [3:0]cnt;          //接受串行位数
    reg [7:0]keycode;
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
    9:flag<=1'b1;
    10:flag<=1'b0;
     endcase
        if(cnt<=9) cnt<=cnt+1;
        else if(cnt==10)  cnt<=0;
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

module ps2_keyboard(clk,clr,ps2_clk,ps2_data,data,ready,nextdata_n,ps2_clk_sync,sample,overflow);
    input clk,clr,ps2_clk,ps2_data;
	input nextdata_n;
    output [7:0] data;
    output reg ready;
    output reg [2:0] ps2_clk_sync;
    output sample;
    output reg overflow;     // fifo overflow  
    // internal signal, for test
    reg [9:0] buffer;        // ps2_data bits
    reg [7:0] fifo[7:0];     // data fifo
	reg [2:0] w_ptr, r_ptr;   // fifo write and read pointers	
    reg [3:0] count;  // count ps2_data bits
    // detect falling edge of ps2_clk
    //reg [2:0] ps2_clk_sync;
    
    always @(posedge clk) begin
        ps2_clk_sync <=  {ps2_clk_sync[1:0],ps2_clk};
    end

    wire sampling = ps2_clk_sync[2] & ~ps2_clk_sync[1];
    assign sample = sampling;
    
    always @(posedge clk) begin
        if (clr == 1'b1) begin // reset, modified from clrn (flipped)
            count <= 0; w_ptr <= 0; r_ptr <= 0; overflow <= 0; ready<= 0;
        end 
		else begin
            if (ready) begin // read to output next data
                if(nextdata_n == 1'b0) //read next data
                begin
                r_ptr <= r_ptr + 3'b1;
                    if(w_ptr==(r_ptr+1'b1)) //empty
                        ready <= 1'b0;
                end
            end
            if (sampling) begin
                if (count == 4'd10) begin
                    if ((buffer[0] == 0) && // start bit
                        (ps2_data) && // stop bit
                        (^buffer[9:1])) begin // odd parity
                            fifo[w_ptr] <= buffer[8:1]; // kbd scan code
                            w_ptr <= w_ptr+3'b1;
                            ready <= 1'b1;
                            overflow <= overflow | (r_ptr == (w_ptr + 3'b1));
                        end
                    count <= 0; // for next
                end else begin
                    buffer[count] <= ps2_data; // store ps2_data
                    count <= count + 3'b1;
                end
            end
        end
    end
 assign data = fifo[r_ptr]; //always set output data
 endmodule