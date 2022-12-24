`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/22 16:56:26
// Design Name: 
// Module Name: my_machine
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

`timescale 1 ns / 10 ps
module MyMachine(
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

// clocks and controls
wire clk, reset;  //clk and reset signals
wire CLK25MHZ;
wire CLK50MHZ;
clk_wiz_0 CLK25(.clk_in1(CLK100MHZ),.reset(SW[0]),.locked(LED[0]),.clk_out1(CLK25MHZ));
clk50 CLK50(.clk_in1(CLK100MHZ),.reset(SW[0]),.locked(LED[1]),.clk_out1(CLK50MHZ));
assign reset = SW[0];
assign clk = CLK25MHZ;

// CPU declaration

// signals from cpu
wire [31:0] iaddr,idataout;
wire iclk;
wire [31:0] daddr,ddataout,ddatain;
wire drdclk, dwrclk, dwe;
wire [2:0]  dop;
wire [31:0] cpudbgdata;
wire [31:0] reg10;

// hex
seg7decimal sevenSeg (
.x(reg10),
.clk(CLK100MHZ),
.seg(HEX[6:0]),
.an(AN[7:0]),
.dp(dp) 
);

//main CPU
rv32is mycpu(.clock(clk), 
             .reset(reset), 
				 .imemaddr(iaddr), .imemdataout(idataout), .imemclk(iclk), 
				 .dmemaddr(daddr), .dmemdataout(ddataout), .dmemdatain(ddatain), .dmemrdclk(drdclk), .dmemwrclk(dwrclk), .dmemop(dop), .dmemwe(dwe), 
				 .dbgdata(cpudbgdata),
				 .reg10(reg10));
				  
//instruction memory, no writing
imem instructions(
	.address(iaddr[17:2]),
	.clock(iclk),
	.data(32'b0),
	.wren(1'b0),
	.q(idataout));

//data memory	
dmem datamem(.addr(daddr), 
             .dataout(ddataout), 
				 .datain(ddatain), 
				 .rdclk(drdclk), 
				 .wrclk(dwrclk), 
				 .memop(dop), 
				 .we(dwe));
				 
//vga part

vga_char_ram mybuf(.addra(char_addr),
               .clka(~clk_50m),
               .ena(1'b1),
               .dina(char_buf_data),
               .wea(char_wr),
               .douta(char_out)
);// should clk flip? wea = 1, write; otherwise read

endmodule