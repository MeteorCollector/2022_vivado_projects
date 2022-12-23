-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Fri Dec 23 12:46:46 2022
-- Host        : MSI running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Projects/Vivado_Projects/Computer_System/Computer_System.gen/sources_1/ip/rv32is_0/rv32is_0_stub.vhdl
-- Design      : rv32is_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rv32is_0 is
  Port ( 
    clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    imemaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    imemdataout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    imemclk : out STD_LOGIC;
    dmemaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dmemdataout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dmemdatain : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dmemrdclk : out STD_LOGIC;
    dmemwrclk : out STD_LOGIC;
    dmemop : out STD_LOGIC_VECTOR ( 2 downto 0 );
    dmemwe : out STD_LOGIC;
    dbgdata : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end rv32is_0;

architecture stub of rv32is_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clock,reset,imemaddr[31:0],imemdataout[31:0],imemclk,dmemaddr[31:0],dmemdataout[31:0],dmemdatain[31:0],dmemrdclk,dmemwrclk,dmemop[2:0],dmemwe,dbgdata[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "rv32is,Vivado 2020.2";
begin
end;
