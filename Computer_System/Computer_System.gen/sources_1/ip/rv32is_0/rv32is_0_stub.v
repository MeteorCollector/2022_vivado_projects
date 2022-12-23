// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Dec 23 12:46:46 2022
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Projects/Vivado_Projects/Computer_System/Computer_System.gen/sources_1/ip/rv32is_0/rv32is_0_stub.v
// Design      : rv32is_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "rv32is,Vivado 2020.2" *)
module rv32is_0(clock, reset, imemaddr, imemdataout, imemclk, 
  dmemaddr, dmemdataout, dmemdatain, dmemrdclk, dmemwrclk, dmemop, dmemwe, dbgdata)
/* synthesis syn_black_box black_box_pad_pin="clock,reset,imemaddr[31:0],imemdataout[31:0],imemclk,dmemaddr[31:0],dmemdataout[31:0],dmemdatain[31:0],dmemrdclk,dmemwrclk,dmemop[2:0],dmemwe,dbgdata[31:0]" */;
  input clock;
  input reset;
  output [31:0]imemaddr;
  input [31:0]imemdataout;
  output imemclk;
  output [31:0]dmemaddr;
  input [31:0]dmemdataout;
  output [31:0]dmemdatain;
  output dmemrdclk;
  output dmemwrclk;
  output [2:0]dmemop;
  output dmemwe;
  output [31:0]dbgdata;
endmodule
