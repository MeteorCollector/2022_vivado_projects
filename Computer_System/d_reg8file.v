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


module d_reg32file (busa,busb,busw,ra,rb,rw,clk,we,a0,a4,a5);
//端口声明
output [31:0] busa;
output [31:0] busb;
input  [31:0] busw;
input  [4:0] ra; //在读取时作为读入端口A的地址ra，在写入时作为写入端口地址rw
input  [4:0] rb;
input  [4:0] rw;
input  clk, we;
output [31:0] a0;
output [31:0] a4;
output [31:0] a5;

reg   [31:0] regs [31:0];

assign a0 = regs[0];
assign a4 = regs[14];
assign a5 = regs[15];

assign busa = regs[ra];
assign busb = regs[rb];

initial begin regs[0] = 32'h00000000; end

always@(posedge clk)
begin
    case({we})
     1'b1: begin if (rw != 5'b00000) 
                 begin 
                    regs[rw] = busw; 
                    $display("wrote %h to register %h", busw, rw); 
                 end 
           end // $0 always 0.
     1'b0: begin end
    endcase
end

endmodule
