`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/28 23:52:45
// Design Name: 
// Module Name: ALU32_sim
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

module alu_rv32_vlg_tst();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg [31:0] dataa;
reg [31:0] datab;
reg [3:0]  ALUctr;
wire less;
wire zero;
wire [31:0] aluresult;


// assign statements (if any)                          
ALU i1 (
// port map - connection between master ports and signals/registers   
	.dataa(dataa),
   .datab(datab),
   .aluctr(ALUctr),
   .less(less),
   .zero(zero),
   .result(aluresult)
);

task check;
	input reg [31:0] result;
   input reg rless;
   input reg rzero;
   begin
      if(ALUctr[2:0]==3'b010 || ALUctr[2:0]==3'b011)
      begin
		   if(result==aluresult&&rless==less&&zero==rzero)
		   begin
			   $display("~~~ OK dataa=32'h%h, datab=32'h%h, ALUctr=4'b%b, result=32'h%h, zero=%d, less=%d",dataa,datab,ALUctr,aluresult,zero,less);
		   end
		   else
		   begin
		      $display("~~~ ERROR dataa=32'h%h, datab=32'h%h, ALUctr=4'b%b, result=32'h%h, zero=%d, less=%d",dataa,datab,ALUctr,aluresult,zero,less);
		   end
      end
      else
      begin
         if(result==aluresult&&zero==rzero)
		   begin
			   $display("~~~ OK dataa=32'h%h, datab=32'h%h, ALUctr=4'b%b, result=32'h%h, zero=%d",dataa,datab,ALUctr,aluresult,zero);
		   end
		   else
		   begin
		      $display("~~~ ERROR dataa=32'h%h, datab=32'h%h, ALUctr=4'b%b, result=32'h%h, zero=%d",dataa,datab,ALUctr,aluresult,zero);
		   end
      end
	end
endtask

initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin  
$display("Running testbench");                        

  dataa=32'hffffffff;datab=32'h00000001;ALUctr=4'b0000;#20; check(32'h0,1'b0,1'b1);
  dataa=32'h12345678;datab=32'h12345678;ALUctr=4'b0000;#20; check(32'h2468ACF0,1'b0,1'b0);
  dataa=32'h12345678;datab=32'h12345678;ALUctr=4'b1000;#20; check(32'h0,1'b0,1'b1);
  dataa=32'h0;datab=32'h00000001;ALUctr=4'b1000;#20; check(32'hffffffff,1'b0,1'b0);
  dataa=32'h55555555;datab=32'h00000001;ALUctr=4'b0001;#20; check(32'haaaaaaaa,1'b0,1'b0);
  dataa=32'h12345678;datab=32'h00000014;ALUctr=4'b0001;#20; check(32'h67800000,1'b0,1'b0);
  dataa=32'haaaaaaaa;datab=32'h00000005;ALUctr=4'b0101;#20; check(32'h05555555,1'b0,1'b0);
  dataa=32'haaaaaaaa;datab=32'h00000005;ALUctr=4'b1101;#20; check(32'hfd555555,1'b0,1'b0);
  dataa=32'hffffffff;datab=32'h00000001;ALUctr=4'b0010;#20; check(32'h00000001,1'b1,1'b0);
  //dataa=32'hffffffff;datab=32'h00000001;ALUctr=4'b1010;#20; check(32'h00000000,1'b0,1'b0);
  dataa=32'hffffffff;datab=32'h80000000;ALUctr=4'b0010;#20; check(32'h00000000,1'b0,1'b0);
  //dataa=32'hffffffff;datab=32'h80000000;ALUctr=4'b1010;#20; check(32'h00000000,1'b0,1'b0);
  dataa=32'hfffffff0;datab=32'hfffffff0;ALUctr=4'b0010;#20; check(32'h00000000,1'b0,1'b1);
  //                                                                           less zero
  dataa=32'hfffffff0;datab=32'hfffffff0;ALUctr=4'b0011;#20; check(32'h00000000,1'b0,1'b1);
  dataa=32'h00010000;datab=32'h0ffffff0;ALUctr=4'b0011;#20; check(32'h00000001,1'b1,1'b0);
  dataa=32'hfffffff0;datab=32'h00000000;ALUctr=4'b0011;#20; check(32'h00000000,1'b0,1'b0);
  dataa=32'h00000001;datab=32'h0fffffff;ALUctr=4'b0011;#20; check(32'h00000001,1'b1,1'b0);
  dataa=32'hf0000000;datab=32'hfffffff0;ALUctr=4'b0011;#20; check(32'h00000001,1'b1,1'b0);
  dataa=32'h55555555;datab=32'h55aa;ALUctr=4'b0100;#20; check(32'h555500ff,1'b0,1'b0);
  dataa=32'h55555555;datab=32'h55aa;ALUctr=4'b0110;#20; check(32'h00005500,1'b0,1'b0);
  dataa=32'h55555555;datab=32'h55aa;ALUctr=4'b0111;#20; check(32'h555555ff,1'b0,1'b0);
  dataa=32'h55555555;datab=32'h00114514;ALUctr=4'b1111;#20; check(32'h00114514,1'b0,1'b0);
$stop;
// --> end                                             
//                       
end                                                    
                                                   
endmodule
