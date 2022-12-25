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
/*
//main CPU
rv32is mycpu(.clock(clk), 
             .reset(reset), 
				 .imemaddr(iaddr), .imemdataout(idataout), .imemclk(iclk), 
				 .dmemaddr(daddr), .dmemdataout(ddata), .dmemdatain(ddatain), .dmemrdclk(drdclk), .dmemwrclk(dwrclk), .dmemop(dop), .dmemwe(dwe), 
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
				 .we(ddatawe));
*/
//vga part
wire [15:0] char_rd_addr;
wire [15:0] char_cpu_addr;
wire [7:0]  char_out;
wire [7:0]  char_cpu_in;
wire [7:0]  char_cpu_out;
wire        vga_we;

vga my_vga(.clk_25m(CLK25MHZ),.clk_50m(CLK50MHZ),.SW(SW),.BTNC(BTNC),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B),
           .char_rd_addr(char_rd_addr),.char_out(char_out),.VGA_HS(VGA_HS),.VGA_VS(VGA_VS)
           );

vga_char_ram vga_ram(.clka(~CLK50MHZ),.ena(1'b1),.wea(1'b0),.addra(char_rd_addr),.dina(8'h0),.douta(char_out),
                     .clkb(clk),.enb(1'b1),.web(vga_we),.addrb(char_cpu_addr),.dinb(char_cpu_in),.doutb(char_cpu_out)
                     );

wire [31:0] key_dataout;
wire        kwe;
wire [31:0] keydbgdata;
/*
key_ctrl keyboard_device(.kdataout(key_dataout),.frontaddr(daddr[15:0]),.frontdata(ddatain[7:0]),
                         .rdclk(drdclk),.memop(dop),.memwe(kwe),
                         .keydbgdata(keydbgdata),.clk_50m(CLK50MHZ),
                         .PS2_CLK(PS2_CLK),.PS2_DATA(PS2_DATA),.BTNC(BTNC)
                         );
*/
assign ddatawe = (daddr[31:20] == 12'h001) ? dwe : 1'b0;
assign vga_we  = (daddr[31:20] == 12'h002) ? dwe : 1'b0;
assign kwe     = (daddr[31:20] == 12'h003) ? dwe : 1'b0;
assign char_cpu_addr = daddr[15:0];
assign char_cpu_in   = ddatain[7:0];

assign ddata   = (daddr[31:20] == 12'h001) ? ddataout : (daddr[31:20] == 12'h002) ? {24'h000000, char_cpu_out} : (daddr[31:20] == 12'h003) ? key_dataout : 32'h00000000;

/*
// hex
seg7decimal sevenSeg (
.x(keydbgdata),
.clk(CLK100MHZ),
.seg(HEX[6:0]),
.an(AN[7:0]),
.dp(dp) 
);
*/
endmodule