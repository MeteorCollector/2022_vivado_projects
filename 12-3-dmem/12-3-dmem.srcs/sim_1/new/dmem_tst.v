// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "08/13/2018 16:31:39"
                                                                                
// Verilog Test Bench template for design : exp0
// 
// Simulation tool : ModelSim-Altera (Verilog)
// 

`timescale 1 ps/ 1 ps
module dmem_vlg_tst();
// constants                                           
// general purpose registers
reg eachvec;
// test vector input registers
reg [31:0] addr;
wire [31:0] dataout;
reg [31:0]  datain;
reg rdclk;
reg wrclk;
reg [2:0] memop;
reg we;


// assign statements (if any)                          
dmem i1 (
// port map - connection between master ports and signals/registers   
   .addr(addr),
   .dataout(dataout),
   .datain(datain),
   .rdclk(rdclk),
   .wrclk(wrclk),
   .memop(memop),
   .we(we)
);

task check;
	input reg [31:0] result;
   begin
		if(result==dataout)
		   begin
			   $display("~~~ OK addr=32'h%h memop=3'b%b data=32'h%h",addr,memop,dataout);
		   end
		   else
		   begin
		      $display("~~~ ERROR addr=32'h%h memop=3'b%b data=32'h%h",addr,memop,dataout);
		   end
	end
endtask

task dispwrite;
	begin
		$display("~~~ write addr=32'h%h data=32'h%h memop=3'b%b", addr,datain,memop);
	end
endtask

task tick;
   begin
      #1;
   rdclk=1'b1;wrclk=1'b0;#10;
   rdclk=1'b0;wrclk=1'b1;#9;
   end
endtask

initial                                                
begin                                                  
// code that executes only once                        
// insert code here --> begin  
$display("Running testbench");                        
  rdclk=1'b0;wrclk=1'b0; #20;
  addr=32'h800; datain=32'h12345687; memop=3'b010; we=1'b1; tick(); dispwrite();
  addr=32'h800; datain=32'h12345687; memop=3'b010; we=1'b0; tick(); check(32'h12345687);
  addr=32'h800; datain=32'h12345687; memop=3'b000; we=1'b0; tick(); check(32'hffffff87);
  addr=32'h801; datain=32'h12345687; memop=3'b000; we=1'b0; tick(); check(32'h56);
  addr=32'h802; datain=32'h12345687; memop=3'b000; we=1'b0; tick(); check(32'h34);
  addr=32'h803; datain=32'h12345687; memop=3'b000; we=1'b0; tick(); check(32'h12);
  addr=32'h800; datain=32'h12345687; memop=3'b100; we=1'b0; tick(); check(32'h87);
  addr=32'h100; datain=32'hc0ffee; memop=3'b010; we=1'b1; tick(); dispwrite();
  addr=32'h100; datain=32'h12345687; memop=3'b010; we=1'b0; tick(); check(32'hc0ffee);
  addr=32'h100; datain=32'h12345687; memop=3'b001; we=1'b0; tick(); check(32'hffffffee);
  addr=32'h102; datain=32'h12345687; memop=3'b001; we=1'b0; tick(); check(32'h00c0);
  addr=32'h100; datain=32'h12345687; memop=3'b101; we=1'b0; tick(); check(32'hffee);
  addr=32'h102; datain=32'h12345687; memop=3'b101; we=1'b0; tick(); check(32'h00c0);
  addr=32'h110; datain=32'h0; memop=3'b010; we=1'b1; tick(); dispwrite();
  addr=32'h110; datain=32'h78; memop=3'b000; we=1'b1; tick(); dispwrite();
  addr=32'h110; datain=32'h12345687; memop=3'b010; we=1'b0; tick(); check(32'h78);
  addr=32'h112; datain=32'h1234; memop=3'b001; we=1'b1; tick(); dispwrite();
  addr=32'h110; datain=32'h12345687; memop=3'b010; we=1'b0; tick(); check(32'h12340078);
  addr=32'h111; datain=32'h56; memop=3'b000; we=1'b1; tick(); dispwrite();
  addr=32'h110; datain=32'h12345687; memop=3'b010; we=1'b0; tick(); check(32'h12345678);
  addr=32'h113; datain=32'h56; memop=3'b000; we=1'b1; tick(); dispwrite();
  addr=32'h110; datain=32'h12345687; memop=3'b010; we=1'b0; tick(); check(32'h56345678);
  addr=32'h112; datain=32'h78; memop=3'b000; we=1'b1; tick(); dispwrite();
  addr=32'h110; datain=32'h12345687; memop=3'b010; we=1'b0; tick(); check(32'h56785678);
  addr=32'h800; datain=32'h1234; memop=3'b001;we=1'b1; tick(); dispwrite();
  addr=32'h800; datain=32'h12345687; memop=3'b010; we=1'b0; tick(); check(32'h12341234);
$stop;
// --> end                                             
//                       
end                                                    
                                                   
endmodule

