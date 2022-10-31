`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/02 14:54:48
// Design Name: 
// Module Name: Adder8
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


module ALU32 (
output [31:0] f,
output OF, SF, ZF, CF,
output cout,
input [31:0] x, y,
input [3:0] ALUctr
);

wire [31:0] adderout;
wire [31:0] number;
wire [31:0] cs;
reg SUBctr;
reg SIGctr;
reg [1:0] OPctr;
wire sig;
wire zftmp;
//wire ct1, ct2, ct3;

always @(*)
begin
    case({ALUctr})
        4'b0000: begin SUBctr=1'b0; OPctr=2'b00; end // add
        4'b0010: begin SUBctr=1'b1; SIGctr=1'b1; OPctr=2'b11; end // slt
        4'b0011: begin SUBctr=1'b1; SIGctr=1'b0; OPctr=2'b11; end // sltu
        4'b0110: begin OPctr=2'b01; end // or
        4'b1000: begin SUBctr=1'b1; OPctr=2'b00; end // sub
        4'b1111: begin OPctr=2'b10; end // srcB
        default: begin end
    endcase
end

Adder32 addr(adderout,OF,SF,zftmp,CF,cout,x,y,SUBctr,1'b0);

assign ZF = (f == 32'h00000000);
assign sig = SIGctr==1'b1 ? OF^SF : CF;
assign f = OPctr==2'b00 ? adderout : OPctr==2'b11 ? sig : OPctr==2'b01 ? x|y : OPctr==2'b10 ? y : 8'bz;
//assign f = adderout;
endmodule
