`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/07 14:26:52
// Design Name: 
// Module Name: regfile32_sim
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


module d_register_tst();
wire [31:0] busa;
wire [31:0] busb;
reg [31:0] busw;
reg [4:0] ra; reg [4:0] rb; 
reg clk, we;
d_reg32file d_register_inst(busa, busb, busw, ra, rb, clk, we);
always
# 5 clk=~clk;
initial begin
clk = 1'b0; we = 1'b0; busw = 32'hffffffff; ra = 5'b00011; rb = 5'b01001;
#8 we = 1'b1;
#18 busw = 32'h00000000;
#18 busw = 32'h11111111; ra = 5'b00100; rb = 5'b00011;
#18 busw = 32'h22222222; ra = 5'b00101; rb = 5'b00100;
#18 busw = 32'h33333333; ra = 5'b00110; rb = 5'b00101;
#18 busw = 32'h44444444; ra = 5'b00111; rb = 5'b00110;
#18 busw = 32'h55555555; ra = 5'b01000; rb = 5'b00111;
#18 busw = 32'h66666666; ra = 5'b01001; rb = 5'b01000;
#18 busw = 32'h77777777; ra = 5'b01010; rb = 5'b01001;
#18 busw = 32'h88888888; ra = 5'b01011; rb = 5'b01010;
#18 $stop;
end
endmodule
