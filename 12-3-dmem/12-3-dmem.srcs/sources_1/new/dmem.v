`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/29 16:28:50
// Design Name: 
// Module Name: dmem
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

module dmem(
	input  [31:0] addr,
	output reg [31:0] dataout,
	input  [31:0] datain,
	input  rdclk,
	input  wrclk,
	input [2:0] memop,
	input we);
	reg [3:0] wea1;
	reg [31:0] wr_data;
	wire [29:0]up_addr;
	wire [1:0] low_addr;
	wire [31:0] temp_out;
	assign up_addr = addr[31:2];
	assign low_addr = addr[1:0];
	blk_mem mem1(.addra(up_addr[14:0]), .clka(wrclk), .dina(wr_data), .ena(we),
	 .wea(wea1),.addrb(up_addr[14:0]), .clkb(rdclk), .doutb(temp_out),.enb(~we));
	always@(*)
	   begin
	   if(we==1'b0)wea1 = 4'b0000;
	   else
	   case(memop)
	   3'b000:
	       begin
	       case(low_addr)
	       2'b00:begin wea1 = 4'b0001;wr_data[7:0] = datain[7:0];end
	       2'b01:begin wea1 = 4'b0010;wr_data[15:8] = datain[7:0];end
	       2'b10:begin wea1 = 4'b0100;wr_data[23:16] = datain[7:0];end
	       default:begin wea1 = 4'b1000;wr_data[31:24] = datain[7:0];end
	       endcase
	       end
	   3'b001:
	       begin
	       case(low_addr)
	       2'b00:begin wea1 = 4'b0011; wr_data[15:0] = datain[15:0];end
	       default:begin wea1 = 4'b1100; wr_data[31:16] = datain[15:0];end
	       endcase
	       end
	   3'b010:begin wea1 = 4'b1111; wr_data = datain;end
	   default:;
	   endcase
	   end
	always@(*)
	   begin
	   case(memop)
	   3'b000:
	       begin
	       case(low_addr)
	       2'b00:dataout = {{24{temp_out[7]}}, temp_out[7:0]};
	       2'b01:dataout = {{24{temp_out[15]}}, temp_out[15:8]};
	       2'b10:dataout = {{24{temp_out[23]}}, temp_out[23:16]};
	       default:dataout = {{24{temp_out[31]}}, temp_out[31:24]};
	       endcase
	       end
	   3'b001:
	       begin
	       case(low_addr)
	       2'b00:dataout = {{16{temp_out[15]}}, temp_out[15:0]};
	       default:dataout = {{16{temp_out[31]}}, temp_out[31:16]};
	       endcase
	       end
	   3'b010:dataout = temp_out;
	   3'b100:
	       begin
	       case(low_addr)
	       2'b00:dataout = {24'b0, temp_out[7:0]};
	       2'b01:dataout = {24'b0, temp_out[15:8]};
	       2'b10:dataout = {24'b0, temp_out[23:16]};
	       default:dataout = {24'b0, temp_out[31:24]};
	       endcase
	       end
	   3'b101:
	       begin
	       case(low_addr)
	       2'b00:dataout = {16'b0, temp_out[15:0]};
	       default:dataout = {16'b0, temp_out[31:16]};
	       endcase
	       end
	   default;
	   endcase
	   end
endmodule

/*
module dmem(
    input  [31:0] addr,
    output [31:0] dataout,
    input  [31:0] datain,
    input rdclk,
    input wrclk,
    input [2:0] memop,
    input we
    );
    
//mem1 mem(.rdclk(rdclk),.wrclk(wrclk),.csen(1'b1),.wren(we),.MemOp(memop),.din(datain),.inaddr(addr),.outaddr(addr),.dout(dataout));
mem1 mem(.addr(addr),.dataout(dataout),.datain(datain),.rdclk(rdclk),.wrclk(wrclk),.memop(memop),.we(we));

endmodule
*/