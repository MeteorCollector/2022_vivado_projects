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
