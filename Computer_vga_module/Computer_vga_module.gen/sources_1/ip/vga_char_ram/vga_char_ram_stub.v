// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Dec 25 17:32:48 2022
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Projects/Vivado_Projects/Computer_vga_module/Computer_vga_module.gen/sources_1/ip/vga_char_ram/vga_char_ram_stub.v
// Design      : vga_char_ram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *)
module vga_char_ram(clka, ena, wea, addra, dina, douta, clkb, enb, web, addrb, 
  dinb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[15:0],dina[7:0],douta[7:0],clkb,enb,web[0:0],addrb[15:0],dinb[7:0],doutb[7:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [15:0]addra;
  input [7:0]dina;
  output [7:0]douta;
  input clkb;
  input enb;
  input [0:0]web;
  input [15:0]addrb;
  input [7:0]dinb;
  output [7:0]doutb;
endmodule
