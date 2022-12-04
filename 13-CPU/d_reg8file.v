`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 11:19:41
// Design Name: 
// Module Name: d_reg8file
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


module d_reg8file (busa,busb,busw,ra,rb,clk,we);
//端口声明
output reg [31:0] busa;
output reg [31:0] busb;
input [31:0] busw;
input [4:0] ra; //在读取时作为读入端口A的地址ra，在写入时作为写入端口地址rw
input [4:0] rb;
//input [2:0] rw,
input clk, we;
reg [31:0] register [4:0];

always@(negedge clk)
begin
    case({we})
     1'b1: begin register[ra] = busw; end
     1'b0: begin end
    endcase
end

always@(*)
begin
    busa = register[ra];
    busb = register[rb];
end

endmodule
