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
module clkgen(
   input clkin, input rst, input clken, output reg clkout);
    parameter clk_freq=10000000;
    parameter countlimit=50000000/clk_freq-1; 
   reg[31:0] clkcount;
   initial
   begin clkcount=32'd0; clkout=1'b0; end
   always @ (posedge clkin) 
    if(rst)
     begin
        clkcount<=0;
        clkout<=1'b0;
     end
    else
    begin
     if(clken)
        begin
            if(clkcount>=countlimit)
             begin
                clkcount<=32'd0;
                clkout<=~clkout;
             end
             else
             begin
                clkcount<=clkcount+1;

             end
         end
     end  
endmodule

module mstimer(
       input clkin, input rst, input rdclk, input [31:0] addr, input [2:0] memop, output reg [31:0] dataout
               );
    parameter clk_freq=1000;
    parameter countlimit=100000000/clk_freq-1; 
    reg  [31:0] clkcount;
    wire [15:0] wordout;
    wire [7:0]  byteout;
    reg  [31:0] mem;
    
    initial
    begin clkcount=32'd0; dataout=1'b0; end
    
    assign wordout = (addr[1]==1'b1)? mem[31:16]:mem[15:0];
    assign byteout = (addr[1]==1'b1)? ((addr[0]==1'b1)? mem[31:24]:mem[23:16]):((addr[0]==1'b1)? mem[15:8]:mem[7:0]);

    always @(*)
        begin
            case(memop)
            3'b000: //lb
                dataout = { {24{byteout[7]}}, byteout};
            3'b001: //lh
                dataout = { {16{wordout[15]}}, wordout};
            3'b010: //lw
                dataout = mem;
            3'b100: //lbu
                dataout = { 24'b0, byteout};
            3'b101: //lhu
                dataout = { 16'b0, wordout};
            default:
                dataout = mem;
            endcase
        end
   
    always @ (posedge clkin) 
    if(rst)
    begin
        clkcount<=32'd0;
        mem<=1'b0;
    end
    else
    begin
        begin
            if(clkcount>=countlimit)
            begin
                clkcount<=32'd0;
                mem <= mem + 1;
            end
            else
            begin
                clkcount<=clkcount+1;
            end
        end  
    end
endmodule

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
/*
reg simclk;
integer numcycles;

task step;  //step for one cycle ends 1ns AFTER the posedge of the next cycle
	begin
		#9  simclk = 1'b0; 
		#10 simclk = 1'b1;
		numcycles = numcycles + 1;	
		#1 ;
	end
endtask

initial begin numcycles = 0; while (numcycles < 32'd262143) begin step(); end $stop; end
*/
// clocks and controls
wire clk, reset;  //clk and reset signals
wire CLK25MHZ;
wire CLK50MHZ;
wire CLKCPU;
sys_clk CLKMODULE(.clk_in1(CLK100MHZ),.reset(SW[0]),.locked(LED[0]),.clk_out1(CLK50MHZ),.clk_out2(CLK25MHZ));
//cpu_clk CPUCLK(.clk_in1(CLK100MHZ),.reset(SW[0]),.locked(),.clk_out1(CLKCPU));
clkgen cpu_clk_generator(.clkin(CLK100MHZ),.rst(SW[0]),.clken(1'b1),.clkout(CLKCPU));
assign reset = SW[0];
//assign clk = CLKCPU; // remember to modify!

// CPU declaration

// signals from cpu
wire [31:0] iaddr,idataout;
wire iclk;
wire [31:0] ddata;
wire [31:0] daddr,ddataout,ddatain;
wire drdclk, dwrclk, dwe;
wire [2:0]  dop;
wire [31:0] cpudbgdata;
wire [31:0] vgadbgdata;
reg  [31:0] vdbg;
wire [31:0] reg10;
wire [31:0] a4;
wire [31:0] a5;
wire        less;
wire        zero;
wire        memtoreg;

//main CPU
rv32is mycpu(.clock(CLKCPU), // attention!!!
             .reset(reset), 
				 .imemaddr(iaddr), .imemdataout(idataout), .imemclk(iclk), 
				 .dmemaddr(daddr), .dmemdataout(ddata), .dmemdatain(ddatain), .dmemrdclk(drdclk), .dmemwrclk(dwrclk), .dmemop(dop), .dmemwe(dwe), 
				 .dbgdata(cpudbgdata),
				 .reg10(reg10),.a4(a4),.a5(a5),.lsign(less),.zsign(zero),.mtor(memtoreg));
				  
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
				 
//vga part
wire [15:0] char_rd_addr;
//wire [15:0] char_cpu_addr;
wire [7:0]  char_out;
wire [31:0] char_cpu_in;
wire [31:0] char_cpu_out;
wire [31:0] vga_ram_out;
wire        vga_we;
wire [3:0]  vga_web;
wire        char_clk;

vga my_vga(.clk_25m(CLK25MHZ),.clk_50m(CLK50MHZ),.SW(SW),.BTNC(BTNC),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B),
           .char_rd_addr(char_rd_addr),.char_out(char_out),.VGA_HS(VGA_HS),.VGA_VS(VGA_VS)
           );

vga_char_ram vga_ram(.clka(~CLK50MHZ),.ena(1'b1),.wea(1'b0),.addra(char_rd_addr),.dina(8'h0),.douta(char_out), // for vga output
                     .clkb(char_clk),.enb(1'b1),.web(vga_web),.addrb(daddr[15:2]),.dinb(char_cpu_in),.doutb(char_cpu_out) // for cpu accessment
                     );
                     
IOconverter cpu_to_vga(.addr(daddr),.dwordout(char_cpu_out),.datain(ddatain),.rdclk(drdclk),.wrclk(dwrclk),.memop(dop),
                       .we(vga_we),.realdataout(vga_ram_out),.realdatain(char_cpu_in),.wmask(vga_web),
                       .rdclkout(),.wrclkout(char_clk)
                      );

always@(posedge vga_we)
begin
    vdbg <= ddatain;
end
assign vgadbgdata = vdbg;

wire [31:0] key_dataout;
wire        kwe;
wire [31:0] keydbgdata;
key_ctrl keyboard_device(.kdataout(key_dataout),.frontaddr(daddr[15:0]),.frontdata(ddatain[7:0]),
                         .rdclk(drdclk),.memop(dop),.memwe(kwe),
                         .keydbgdata(keydbgdata),.clk_50m(CLK50MHZ),
                         .PS2_CLK(PS2_CLK),.PS2_DATA(PS2_DATA),.BTNC(BTNC)
                         );
                         
wire [31:0] timer_dataout;
mstimer sys_timer(.clkin(CLK100MHZ),.rst(reset),.rdclk(drdclk),.addr(daddr),.memop(dop),.dataout(timer_dataout));

assign ddatawe = (daddr[31:20] == 12'h001) ? dwe : 1'b0;
assign vga_we  = (daddr[31:20] == 12'h002) ? dwe : 1'b0;
assign kwe     = (daddr[31:20] == 12'h003) ? dwe : 1'b0;

assign ddata   = (daddr[31:20] == 12'h001) ? ddataout : (daddr[31:20] == 12'h002) ? {24'h000000, char_cpu_out} : (daddr[31:20] == 12'h003) ? key_dataout : (daddr[31:20] == 12'h004) ? timer_dataout : 32'h00000000;

assign LED[2] = ddatawe;
assign LED[3] = vga_we;
assign LED[4] = kwe;
assign LED[7:5] = dop;
// hex
seg7decimal sevenSeg (
.x({ddata[15:0], iaddr[15:0]}),
.clk(CLK100MHZ),
.seg(HEX[6:0]),
.an(AN[7:0]),
.dp(dp) 
);

endmodule