`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/14 09:37:41
// Design Name: 
// Module Name: mem
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


module mymem( // without ip
    input [15:0] addra, // wrclk
    input clka,
    input [31:0] dina,
    input ena,
    input [3:0] wea,
    input [15:0] addrb, // rdclk
    input clkb,
    output [31:0] doutb,
    input enb,
    
    output [31:0] m0,
    output [31:0] m1,
    output [31:0] m2
);

reg [31:0] ram [8191:0];
reg [31:0] outtmp;
wire [31:0] intmp;

assign m0 = ram[0];
assign m1 = ram[5'b11110];
assign m2 = ram[5'b11111];

assign doutb = outtmp;

assign intmp[7:0]   = wea[0] ? dina[7:0]   : outtmp[7:0];
assign intmp[15:8]  = wea[1] ? dina[15:8]  : outtmp[15:8];
assign intmp[23:16] = wea[2] ? dina[23:16] : outtmp[23:16];
assign intmp[31:24] = wea[3] ? dina[31:24] : outtmp[31:24];

always @(*)
begin
    if (ena) begin outtmp <= ram[addra]; end
    else begin outtmp <= ram[addrb]; end
end

always @(posedge clka)
begin
    if (ena) begin ram[addrb] <= intmp; end
end

endmodule




module dmem(addr, dataout, datain, rdclk, wrclk, memop, we, m0, m1, m2);
	input  [31:0] addr;
	output reg [31:0] dataout;
	input  [31:0] datain;
	input  rdclk;
	input  wrclk;
	input [2:0] memop;
	input we;
	
	output [31:0] m0;
	output [31:0] m1;
	output [31:0] m2;
	
	wire [31:0] memin;
	reg  [3:0] wmask;
	wire [7:0] byteout;
	wire [15:0] wordout;
	wire [31:0] dwordout;
 

assign memin = (memop[1:0]==2'b00)?{4{datain[7:0]}}:((memop[1:0]==2'b10)?datain:{2{datain[15:0]}}) ; //lb: same for all four, lh:copy twice; lw:copy

//four memory chips	
//testdmem mymem(.byteena_a(wmask),.data(memin), .rdaddress(addr[16:2]), .rdclock(rdclk), .wraddress(addr[16:2]), .wrclock(wrclk), .wren(we), .q(dwordout) ); // testing
mymem memblk(
    .addra({2'b00, addr[15:2]}),.clka(wrclk),.dina(memin),.ena(we),.wea(wmask),
    .addrb({2'b00, addr[15:2]}),.clkb(rdclk),.doutb(dwordout),.enb(~we)
    ,.m0(m0),.m1(m1),.m2(m2)
    );
//wmask,addr[16:2]
assign wordout = (addr[1]==1'b1)? dwordout[31:16]:dwordout[15:0];

assign byteout = (addr[1]==1'b1)? ((addr[0]==1'b1)? dwordout[31:24]:dwordout[23:16]):((addr[0]==1'b1)? dwordout[15:8]:dwordout[7:0]);


always @(*)
begin
  case(memop)
  3'b000: //lb
     dataout = { {24{byteout[7]}}, byteout};
  3'b001: //lh
     dataout = { {16{wordout[15]}}, wordout};
  3'b010: //lw
     dataout = dwordout;
  3'b100: //lbu
     dataout = { 24'b0, byteout};
  3'b101: //lhu
     dataout = { 16'b0, wordout};
  default:
     dataout = dwordout;
  endcase
end

always@(*)
begin
	if(we==1'b1)
	begin
		case(memop)
			3'b000://sb
			begin
				wmask[0]=(addr[1:0]==2'b00)?1'b1:1'b0;
				wmask[1]=(addr[1:0]==2'b01)?1'b1:1'b0;
				wmask[2]=(addr[1:0]==2'b10)?1'b1:1'b0;
				wmask[3]=(addr[1:0]==2'b11)?1'b1:1'b0;
			end
			3'b001://sh
			begin
				wmask[0]=(addr[1]==1'b0)?1'b1:1'b0;
				wmask[1]=(addr[1]==1'b0)?1'b1:1'b0;
				wmask[2]=(addr[1]==1'b1)?1'b1:1'b0;
				wmask[3]=(addr[1]==1'b1)?1'b1:1'b0;
			end		
			3'b010://sw
			begin
				wmask=4'b1111;
			end
			default:
			begin
				wmask=4'b0000;
			end
		endcase
	end
	else
	begin
	   wmask=4'b0000;
	end
end

endmodule