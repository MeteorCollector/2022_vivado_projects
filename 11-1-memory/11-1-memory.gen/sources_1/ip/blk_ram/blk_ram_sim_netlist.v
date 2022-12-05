// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Nov 14 18:53:20 2022
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Projects/Vivado_Projects/11-1-memory/11-1-memory.gen/sources_1/ip/blk_ram/blk_ram_sim_netlist.v
// Design      : blk_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_ram,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_ram
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.95215 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_ram_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27872)
`pragma protect data_block
UfAKLaS3o89gXBhadgWQC1KM82pl9zsME6yM35iz/3P56I1+B0p/ZOzou5kPjiGKbpjvRu2qtGUx
AFvaN4UUZmQPHOM9jDn91X9HBl5IyFu0QHRQtwOWhed/REDoV73ZtWE2MRXTnS2Q+KwE221P/aXp
grlZpKcBDlqNUsGSpRU8n/P2qA+afepWE1UDLAhRqnBPzkogxuFjNvC8AlDQuWSP60UpDQ6j18Cv
v6Ya4I+I7pz+bMcirpRBkKROzVB7WqyJ3dFN8PN6+2C4kpC11xbLKEbE4rKWoGvU1597xFM6rZ1q
M2l/Ups9VBVCPoU25y4VdOkXFrn4ak/rguAQdws0W/sFiVn2E/vNmX6BHnsl6a1EQSK4rQm2Q/12
4YCwuJX66lcgEc0mMWO6KI+NiPpmrgVhifxAEDyL+bIzZ7B4idlc1pZ8x0A6laqikSAayG4wEplN
8lgbLoI3Gex2eBovpBFvskNmcMbeBB4j52ZJ1Y2/zBWdHuqOlkz5EbhrwD7C1HFg3jC47MG2dbKA
53boOstBvl1IQ7XsFLmfhQ5DG9DTy5DljGIIjgBu1sSJYur6AL/C1/bz+S/aIaug6uS5uld69tFi
yPIl+3fHRzEtER0NqGYG6tGVlhWrvXQwS6boaEOprCCWTkPpCkCtf/r4FGAcg7CYx+doGZZ3W3OF
vfghpOB+Ud3rud8BgBtBjJNwJbvFMGhu534SkcK/t5FoWLC6NXp9oPuaJaDGYvhdBZ2/mQnKr3wS
EgZnRcX+Wbqlt33StPn7Ax7VF/9DoM0Xmg3HmrlHHY5Zbnzq98Scqbu/2DqH7CN8HpnZEAzUKd7a
5uJ6Op6j5v/gVM3mfFvnxqMSGheyM4vlJvM4kLqp7nm9GdIgFcIgTGCknWNMcbraQUkdbzsq7mQM
ZmWOoREF7LKlCWyPH6wk5zBx3JG+8gtlzFnBdJkOhIgd45Z+6mVuU5M9m6MkJ18vTmARJaiWJHKv
lpBB9uiggbTcSpEV4wj7jOgEAz5Mm5tZFCOHdvNlCe4InTkNneJb/TJiE8v0aUFSn/5f6h+5OkGg
8e3vhPmiyb6pQWJAFWFOe/9LOv9E2K43N9Od4CzoyOgGJ+vwYDaFUlJCpKZ+AFG2XoeDvk4s/Af/
wV0HhTopgrfQKGexcGbEN4a8xjRJqiCEx2bB35GOt0HUROo153kd0GNSL0Or4jzWpuCHpYkXQLzC
ku92QVHyleq3RHTNPa/0zPtx91OxOc8jwpF4HI4xeMNSqezRzVCSI/QLwi7EWxnNT2jcDzZxc2Bk
7IMAz7iX41iBeWLFiyh7vSkH3ZROhSzKoiKvIGES4X4R+eapPAXN12BJ5yIwCc1PEKZxzHjgYNa0
JzNMG/dNM0hmIJVrj2oqndSqCQnG/gBKMv27rVYw4JN1nx74qZ3ADqCOqeglkUjfLtXfS0Cdgy6S
c3gTG0eZiYvXccRKMR/v9OArQ5+gYYDBP4lVaVsys4uTpWIEP/nRlWelPxCfdXWGaemiTrWyzgMR
N1B7nFzvwCuk4w/OydZePGlG4ICzp4683Ar33L7hdUG47xQI4OkXbuXdd1hdPz9lnmQniX/cVPjy
77pfM1b7uqgGVd7qyaNYBKz2H8o87bSjI3uGvUvygNt6yOm706e0KB0FziJ3q5le++W8t7Taiiao
UHAFm69OPRrQU0SsOXnSeYBwA1YAqR4jXDlhO2z1A8N6aRCxpwLLhQ7lbN9HilFFvqK5ayCPrpd6
tR8X1SsQItrsN8GfH3zHrn8iBS6gFqLB/axtRwyzPbWDZqNJenZE8hHyD7PmRexu9NAU5jZYiXce
kkLx0rS5vpqI5bpa1QmOxSqdobNQwI1x9QYssdMrLGv6ghEVmqz7dMM9oKX5QgkKOzeNTCyFmqZB
odDOfHkgwCm98wJZ5I5+HMLSbxSqRAz0msZ5AbIiy/umAXPTAynhy4n9vG3cugoVCKsRMYWKh0Uo
9RXtkcndTjdlgZjv56SthjT5cJgrboQ3FvOChUZLAyQ1fdG5YejMlZRdO4trCweMafZndwrtr1pL
/Nsm2YMdYTcMONSEgYEh42rpoJIj7mvaUNjdkRwJlZiGqZWPqeUTs2m6pLXriQsC9Tfyhn0zP6+h
QpI7xFSu+xyjbduujjykKhvvbEITPAnxfKG1aZG9xHxcOMnmZTISnLtcQcSldNsc/JadmKW94xfo
wMfF/yS/cIIcoAY8Y8JVCgKgFfOnewED4En0OaBRNFrHMicxNWeUcqqqXaOeh1MYJAXueGRAGqSs
s62vSDNQCqpy+pXytFeNX3Py0wn/edzdNYYFpFxA4JPKFLe9PaTWRbtRGpN/mS8pE383hTojvrQh
uaydGuGQ715Bm5PsHa90Cw/1HgwBekmzes8hZsQ6ZSWsJg+3z0HayE55CkyZVwZL9Tstb00ml+ve
9R7xx7/X5EEpYFH6plkk079/X2dZEcgCVyQYcgStzKUw7LjnLWERXGaDjWZx/qzr//5Ac73fmbRb
1Wgfch2qbBiTL6vNvTrbkDvP4Q23JwRHHGRHyVutBej/A1WZf9ZScVBtYs4XtmkWbRCoOTd527Bb
zNyWnxQ9R+usA8BR5gZSGi4pQQd+LAnP6I1J/ZduFiU1hSy3kE6WEXqae3vL03oXnlGZXsRNPbDA
XrSB7Z50tCBm6dzbfQ9wkY1h0GKC00PNCz4znvJ56HHpF4O+K9loE2zicEn+35HKt/jfHgRdLbPz
xQIu9Qs0By2EqLP1IX+TyNNUxo9HR8mBJSyXoDdbzEAitOkXRHUQ0/dOlEz4mHyzXrDIXkyV/AOe
EvSW2dUPGO6jFVLce8s1bOOet9bptF4JCVKu2vvM8ibPkifm9xwXGgH2xE+NWKuMsTYQMCj335pH
thG5nIS0f6FuURPrQSJ7PbziG5e0mEbgTFG+8/lYBqaQ39Aw/xL7uUNdmLLZ2hYFflZU2YkKFS8E
s63iu4/QPL3YZUXL06jsocb8aroezG53lH6FHDl3xMeABS1eSP8/bQzxdxIEEvNsNSkFHmn1bEM4
uiC5QQ3jsxhK+uugT7SQ0354qNTqtztrwQJFrRpyArla+Uu1wdjtLfmshVV5uqNuWFF+CYlX6Ye3
KungfX+T1cf4gzFtHwx/sRrm2ItUGNSbFo2lbjK7YT5PT5kVIAwWgPO8aOBN0AMQsERmHtM4O6zU
W3QLeCMS86MNH0lO/lPdAguTAjk5FPr/CkJtCeTY0/IWZvBKkdGtwiI1StPnbJRHp/FfnozQMh/Q
cXDi2/g110k9FUHLDFQ5fno2cjdYpIdUJAzBcKCbIMdcoc+kj/Wd3MKi9G2oA0k5WWyUXZxjJwV3
me14UftRJ8MDqV+eECUl2jeuzUSANSPs3o1p/SqaKgC5B1VlfLV9Jg2xfgAe0Lc5TrrqbfkwYutn
AQAV3o2nF/OXGG1A3bj9rRPMAn8U4BqdDUFuiF0hK/P/KgXcG/h8U1YCcPed26eihQCGGWzgEni5
ajcRtESBsFxBKDfF1zRuItd8JLJ5RIpe0FF3kcLi7uGnNJcLR3eGGxsMbUIbImIx3d34+2qodeoF
ziLJ0YC1P6LjNMdtk04cGeejBvKLlqC25EYT3phplZpAeynJa0wNSzozu1wzN0RTcGQgr9iiCjMt
Gyi5Z43OkIwQnYDFOHYi+hrQ/1YVTNp9pwQujs0Zrzku6h0d8qO9vBPNScE+q/BgLy+AkxXjo8H+
FCU8LTpXFzyjhVOTK0IAp19ZljKvpUDRK5uWvphCdxYSleis87+b+GS1hE7l6w5+uNTuPmS+55K1
vcUbSDaNZWkDSodPcR8NT3VZDGHSUrQEMOyHi174MCPUFctWINlD6TmoxXEf1X7rU9nm0dZ+PvHU
YVS9ewVofhUf+6/YchxW1Qafn03F+Rf1WfMct+kfIx62IcjuXeJTAUBOEqjaWBngf7gQH8+wEIFx
86DHB7RxohpiOdjosAC7ym5pZuPbXN/1Z+ZhIlW4wsw/lY19J5e+I+OQ4A/CcACi4lsopjYjPSgu
5C3plPs1FW9jG+1eJ2B55MtD7j1sXAzisXaPLeq/0M4mQlvG8FgXix+GaCbqt8MXL9ZaDC9gotZX
qV8wr5kCheDY0sbbZ2xb0oLPP+6HdKZ4VyFf0ceReUFlpH0owboAToBT2XXTlpL6Jl4+bet9uM9J
YJPA+4a7KL6IOzbHfgBPmvk7KwyYivGSaypbuqZHUefhKjh8vlDeTML1O4exoQvnr9amNheiTcPF
x3vW1BbCNRnPC7LPaW1YiXRk5D/IK/h9/Q0jIilO1xK83gyYlVuW379rNhqnzOuW9w6xSYUOHgdn
dljZp2tpeZroTV98rnRR6sj14eSjiiZ4m2QL/iuqQgk+W/TDZ1LvJiqlcNfZjjFLmZjNdo9rNpVa
DHbcjI2u8G6wAxkmhmNXpASpj31M5KSHuvit+p+58H3tOzTLty4ulIsHL8lGeIvNf2/Z+Zrb8ahP
cVwHFv1SXqW0Vs/RQ6s6IFlFIF4mphV/haEojaR/ZNJccI3utWTjDcKk9pmKtZRxuHxAhLz9Djy4
H4Cpp8UFvNL2yLA7ysVQly8MJn4P2kWBManF8cc/g+5BE6Qitgx7/M+PdBcGeBYYNbfHMLJSLn7J
C75qH8TbjUdzrqYkpfINUHZIrhtDDFC/w/rgb73eyFrsWExQKlYHhzoGvs6B2zF/K2cZco/dlXo6
udD0nQEuDoMusDRAsfNXG49KYmEBjsPjshcEQkNRlEtundVKiP54pyHjcybYcXa0vgUy/IKCiSHG
knT6oVn58MJEU3NC2+MV5ChMbarBtzhLbM1jQpLBbwYGU8AnmTL98+g+wGECSy7b9EX0uGcRLzNb
34L/EtqGnx5VHH2a2W+qKlAo90tg/BvStSqG3Bg1YuvzhFgoq+jhZOwuM4wwqG5S2rJ0LEgu5RHE
ZItUINdIt1whtiDNhBXQ7FQqUECEzw1LfnLZ+okmA+rlmcirlxnmq+gWM44N+XZD0VX6X7ydHNxL
/3L2tjeg2IjetipL4NzOK1CTffPjYLZm/8aJ+CdyLVw5XmEi6iUs4hXd8zv1eRUrx14zX5ia5zhr
eRSSOC+B6WjdKil7dTn4Fpq3mpJXWTyyxRckWxsIaKhdGL9S+NDwuBVBRsoiAQIIyZSBFja9hnuH
1lE4vjnLKXl4L6/AE0vm+Qenv+cKsMwZ8lxJPXeVTEz8mYx70NaHZ8ItD5gIkBoFdBdi0jkuI8Au
MUqaEdrg8bAYbLmJIQ0hn5IoXUlguGdwQ2eMMx4bvG0qHeq9GmNt62WfIhaqE7cTpoFJ+JEtHXC9
wLS06eBdctIItf3QFxEpaJq91O59fuwgqiQCop2GOiItE2P/PNjT63+lZ+KrX3ewP9CeDAM/YebO
qMOWrjH/z2SjSKrNiHho/HywZ4cbNm/4Tp/BdMY45mTraKfyXH7bX4UZXLHGwlIfaX1gXFc2qetJ
h+1lehESVfRn0D+JHLeu/F78o/nQTH0gZadoZwLQFqHna3+yRTaIpC+2Wa/NJVpI+H5665EAN4ds
kKA/HBdxse+FLijqL9A1i5MD4NkgJ0uQN5Oy03TkgOtWvRG875ZZ5xAEzGpxOKLnWM8mYHMiS+V/
w2P/dxYTj6Fsf4rINDyQe0fCflrdURH4XGipZijnEd4P7pCDTIh7tiSmNegu+dTA9gj0C5ob+ZWb
snlYGfhylSoiJHHdyVW4p4/M+vXf1x+AAktWa72/kCBm88OPlaaKIcBC4khl0QQTD7JHrIMpSYVx
mlERfxpdXik0UH3RetHikvhoFZ8UoGY8JTkeP7/v9X0JcMAeAd6FLik7PezD7UxX9vRzOmdTGw6R
BqObttQeXDAcYzSniAww4sTvqmPmeEgDdbqdJ5uyD6Ds5mGBt6NfdkrrMyD4zY4CbWqyugciDzBf
Nc/uhTvxQzTJbAzQEXORLROePBICn4DV79oYlf1uJUpu+5UcJgGh+kXztyyh2wdeREM+Ei3hnRUB
VDEA6E4NzYcITEYbPvxVW6S8KkfOE2QZDlSDlQDTIArDyBcEUMzibjZE0DhQslpDVHRFc9rl/eom
nj/oLxXAkQJVf1/EGomaGaNdsV3neZXvwaEQzG1CGLnZM+AqRY3tBW83jSyefDxP57C23gLJO0Cd
/zGQGG8CrOL2hPxf2Qjyiyis/FAd4ioo7DnLXpzsECWI2Fz8/wka667d4+Y6/xbRSAw18dyr3lUw
pFG4pXr3Npt4jUN5fVTwsQXxSRJAeDzio9t5o26sds/mZWxCeu6ItPjn+OJeJCnkuAvdGeIDVP8n
6XMYuFuzlHMutkjy7Kj8HdzxWCrykCi8vR8cM/Gt2p49dLJckgfOOWREklWL7t3Vi1TahCA1Jrcl
FcYNTkpdF6VDAhD7GKfgKvnYMaV4rV2qujKzq5OzLtNUyYHXlX+77xOBiQheLdg0XjsUurpbRgQt
yMRRb2sovLmkxyQwWwnjoM0N/OIQDRBZgYsYJqp9KPfKVeIWPFgQZmrZVZxryfjGareYVA69Aw6F
ujkqMTjyrgo2sGc7hElG+UW59uaFyBENvdftcIawrkzFe+cWUikQpGv507kWK8b6yLrQpAz2llnC
P+bhwdJ+25/CnSCjMS+hBTr9/DqSarF1uPerEocF40iL/9jDvQV0ZcrC5tYOYynS4yzyr8/4UOkE
+03s6rW9vn/yRYkr43js0Jb2ytSGZ5bgsPHTZevc/aAw0hDUSkfOhVmeIzW0SRTY1w2OcQcGlDsc
0rap1GIbMvgSAyROYgnWZEKfiBAQjkAUZaYwmaHXwTj2H8bObUCctC5cKtIZT9jOYbOPwtyoPRFi
tqZuXnBoNcOef/GPOkyws9E4Dy4u868LxXJLgPVtbN4acCtx9Tj/KoutEL1okqjRa3FVnajBINpk
4cD1dJp+NJzSr7RYjWYINK/o7UsKiKCzlsZS7bCpE0s/HtJgEHwI6D1RpgCCEJfN1bhfGEdqw68q
O8vuoHXjanLWZh9zRr4twZX7GYydyumzqci43z0nCQ9yz0mavu74yaY3Ss/CzYgCw24zBJDKlKsH
QtyHgYNXXTRgV6SiXgWoP99Z8j9g6EA7C1OBYS1FDLAoDl1/pJiivcATtnERA+5n+HfjBCioqbdY
ZAjEeNPhb+ac4DhoxQ8VuhjkVu6gYi7v7v5SAovJV/yxlq9JoOThK2CbBm5qRIq3ATGxd2Xv6Nsp
tVkcKCheE+UV01Roo7RW2nWGqhAkGLX6i/6RUNcMqstDug6bK5/1zaW1j1j3y6m7bdNWyAiFsF76
QmsHyuEMyitzsvBkjdfJVidHvsiBp9gpRNXtR67UvwsnSd4wKO0tilFL8qydU54Ud5XcSlzniewL
LY7UghfLpRBTQ0hPqI8aj49aLhY1xKN5oznZdOx2xOMi8GTxW0GczShmxPwsET9EbvVpVmFpjAIB
xCU5PwG2hh038gu6+qV5jtpGMCRSS+VcjB2U58o7tOFHA8TdOzXUASI/Z/Vx0hLrI6E0YTrefX1a
miyfa2r3ti0bI/pkbch7ZjN1Frc+5GYlENhFdYrJiSrj8u4l1JGcFF467NWC3H3+COlGUHBpbZ6e
xSJvklN+GojcjDav+Rkk1tMWQ62P02Z5IB6y8q/l45d4q23VT5JEasXTrVmzCTsTWlzg8sI1gUuA
WVIcR/dlXWZigrRad9Lc7bA+hSFv1ZJRBbdbi3SZydAGmtNv1kVkREIn4t4dmoEjNGCzdMwkxEnW
UltMyD9J52+7XZPzrtjBZcvhv6OIv3UJe+nux0agPwGjvX2IsN5hd61eZS4JSzZHCsPNswGDB0nc
Q/kc86I0jVMeY2Qjb3M+7MpVN/HOKdCK4UYRuOsBp5FBPzXUV4bTvFw9uHPpLyOhB6rCWlt0wGWL
+MwthZ3OYJ4qwNS2yh/znGondPHhCQCMFmDOD7gdfrWySDMR6a/Cwjvj7OM8y8ZTtdYzkWKGP5Zj
cBfGiSFSA7HruLdXuJI5ND1mS9Pv5DeivffCMfq/EfEs2GB2tF1hePA4Stq/S7jbcw8mvaZA0dFe
OGDfasiyvt/8lppIuMzELj1vgF9jg6t0sYq0CZZRvYOfhU818lBXOfyDjMWnqbJNhGnz/WmYmEbW
fUX4Gh2IcRcY9q0FMNWtpSrgden+XbK5iSY4OJy0PKYry4KSEhDrlRKpmqFXhZ2SrDCGX5hi0ffO
YMok9a9rWo9y/3dTk6tZSgdj+3H5NreYQIkoD9UqF5H0m7IyAQAabuxmJph/9bDzTl59RDZ4L3ge
PJTBHWYAuEzf8V9hvhRkE8sHl8yzKEGQYfOo7AnDBJRGHdsLLGboa4HGreG0h80zm8JpOSuKn9+0
QLZRY+L3X2EHTeQuoWZZcgnURGLyc8zuq5Uvwdk0YkUAbKltUoyBnWWHX6vzmbyuFml8RMdgMt3e
oGrdD33Y45Jjble2eB+EhYhHYHS/6ArxrwpSFbCEp0tZRu6FkWhLXJRj8D7PFDGMCbmrQIqzkryD
9qXnaEuwEYGKZYt4HrlyPjHPG33Dez5pRRjHS+8HnUBh67OK9ePk9PWxwpEPtZ4+1v4frYhM9Fno
0J0HYgM6Xkq7wQRlwti3pJyPmpPRdcedt7AoUs2hUZcCS+AjuVGwQwyXpN7VWq7Yx71BQTeFFNCz
yCVHt5Nln9XF+hqt343IsKHsxUSbvf0sfIiR2q5tSBKVnpoN97iuOqium+IKHHHm0tRmiOsQQ/a5
EPZAezqSdbVq2lmElsyHfdkIfSEkpuomzZoNYwUN7BWDvDyaVq5+2hKmd1Si4/2Tn8k/y68ZTHk2
DxZGtd3hTJcQUZQwH+IStbNweQevmHDVT5LcVUmEUfaZ/WkCh2TBjog2dQkeI808OJtRwn2Gxzwu
rSkuj6r8W4TnEOj9JZwvIZPKGntnTNBIb7yCEZxC8sopWy8tWWbm0I4toYgg7L3+7Dekh/7Sx24v
yhy/QAJ2FYL1qwz8HEl2A9/PumifgV1SjuL4Wu3y+VmdwlT/+npudpGEO9BItwzhXRyfUZdCM5s9
IR2op+TseNbWUFb6T6ac+w9Z5wgOVcMrUutC4IxTOtvTBnlZG+chPEjjrIKYW12A/IBYu4Y9bGRm
Vh//f/jWPxPSheHOFXyvZPuv5cfq0S+h04PAFsK3C/uyIZ74MZODIFb7oug60xKkKu/mPC3bTn9q
jhEdkThd3uGZaXJO83MfkiikM6sFBlz2xWj+EYP4GQoNyqwy+sixRdBCt2BM48+/71c+b3L1pZtI
c0TjLK1PtMYMbM+LPkHpbfLJ4hxiqN8bz0SU66zOT6D0Q081a2ldMIX4qNjTHPgxT101Dj4Cdpur
Km/e62PnBK3OGbVp6Mp3lBeDoYfUv30qIRIN5pbq7W4J8rQTQasoSWt8nJYeTLiV4/jSwik8oXS9
jbkEu4AvxPe4P/J6hbRG2NHrtiJSaB+LomILwcCiJUyz/5VdcFCRkJMuPQ3cvxCFptaPjxwY035V
gWBK9fgIht+fpxM5cfrlESDcSnm8CYx37UHkk4nGCi/s+QpMPpWL56W8uxSlw4eMYoXqs33iAj0M
/Y5B0eQqu68jvlSKLa9eOsHJh4ofaJ40qgt5DJiGCv+DcltwMF/7VNWW7g7JxwYCJY33ICyVBTdz
zOmUFe1S3zUbKRzzyufSADM9w5FRSA4QV4gHKnERWy7RVOJjDCwGRRMBF8Xv4B1WznjCYVsazYFC
CEmBM3LPkwqqeN2Z6YIJpxBwCq0OSmapgtYoz/C0LE6Cv6h4WD7WNY+mQFq+4cQidsF6orWYisnn
i5ZBLVA/hEEL/xrbRgYGT+1730uYoBtXEUQ+E6XPC4KcyM7LS06kptLuSNBE9VWVD109fQ7p/g8h
BrCxfnnYsbKkeC1I/LR0wZXO7O7JnXrrm6lfitXb7jd5BpulOO38yQH6P12AEDytyKnxZ2WV1iCL
ZeyJhCbPK1l+3HH55LH6ep44/K9JHl0MRTjZLLywSZON90Eb9DUNbynst8Yu1WpV0U78Q7XcvkJA
bCmDHXo+7uSpzCWBYXLXUmsbFe9ppvUnw+E1Rb9EK+/NiUmJZhVxHd4e4bruxw9MgtETqZ6ao3ph
8mKvY7a5Czt36ifV6mziddZ4b7jI++bp/WlsCJsTSfikLbzUkqFaBtlbPukKN3p5KBre9BRSKO5d
spwnrA0ub5eNScZDEt+ihGxOITAoCufQkZY35BUfAnvoooFAcx+y2nzIAw3PwTwbLt0BmJgoHwQ/
C4dpfGP1hry5nILUjLTRpyBYvEZmhTDnK4cYeSnBkKyJQ7NO7rUUjyDtnSMcxuUs+yhBWl5c5GvB
5GaffxILSpl/XPt1jvTOJyIR/EGRuKxOBaoPEkk8/JMD2GElaneyMFW9XXOsf5hnlM0g+ubeBDxc
0iYsRZnAsZ4V48FMo7JD8dEs2ZWN2KlL3Au9/xpvemx6DmlvPU2GhEQWcJo9DgMX1Lm4ufo6ggPp
CDzu27QhrXIJYTlqU+Igg54l9ndGHpEcGH12KjTVcCD7ytmu4VXbu/BJVs87hEKGm/k4tyJKCoSt
qpIyZrBsUXv0atI6ePCoqh3abMCqVOgjxzsP17AFGrqxh3dh0PXF/hbD4XFgss/DgLjW7VK2jWeV
mOi88vM2p5/6GP12mcGYJc2SMC7B0v8qnIQg3/jpnO6zNBNIrHoXn/BpoBX7RSFLJBgucNTxvUxg
N8YbNN0gFvnzwopBCoJhZq5bCbK+oVndjlYWlrleETjV4l5oj794T3ZMIUj5GHr5zv0mBbTRcPEL
PKM0yYGmNoWfWYSYVL3KyGGLAyBA3SvTE8ot7YiWwgDpV62qi3ow26aFI8HVC1oXLJjfmyPWvkwR
jgD7k5EX7AWKM5gViICKM+z2hNZLbFXrEVDF4y+ZYk5PJ5aRmpQR81owRhzpSLu7/8g9KacLTnow
rv9ZGw4ChBrVnH8UUUvRZhX+OZ0ZDLpIj4pG9moYH1XAD8r2Dguldi2/27HO+Yjqqw1jqfXhJ8GV
KqgK3gEspOqWrrR/yWV+hoB2W4Pgn1udpSUz5Mj5vrjFHdQR8qnbCntyoyMz5ZQkotws5y91DB0X
fJNMQJ3+nDAXe1G3xKJGkYTk8sB3LA3t2n+yMsh1BRW0MzUpcIhE/cLf6YkDpIvt6GCKVGJj3wkD
XCIscE5GSV8u8C4/3J4wLS14CDvgEV8HiX422ghxJPa1a3wCdFlbOscMRv0gpZwctZAtmmtEmBms
eXm9r7AOd7WzA/Ahinv13ZivSac1vpHc1qKE8Mru44ZXX/xYf2tWRYuioryTHXNyiUhIvk/E0qcF
bdtILa56Ed3j2anzkeeirIFYaS9oswY1/6g4dmURvD3sIYbCwDXzltKBzF/+qG9Gd0AuJ0ntt7/s
KCIei7+w7hJSQpsR0KffX1UyAYw+2iqnYC6JW72Si6vUh4ujF6Ht2velb9IGexcsTR53I5+z2ojk
9gN0cfhLaQCoWRm+AGNxfPON+WaTOnNFsTuehde3UZhJvQ6XUed63aHc7L8IAaeilKCXrxOQNm1+
EmmM+RhqfNKAX7ctch88q5LWZQZsNRkd9Y+Mr52cb+QGg3a5yNZLaOPx+mb7HO780lUjM26ZoZzR
yb8mFJCeSebGsJuCMKnH/X+R58l7QPOESGQ35scYSaKmjX2VU2vu7DwV/jp/zPUHzMYnAojtXeZt
iot06pImx/5728ha9oUqjGl62nui4zIXyuAmk0MKWLBOGz0Xf5fwkWNLRzjGDuJX28UkmnBODK1u
EVVhkJsWhA9K/cIuATt/Mut9Z/EmRhGB4Z27h8my/LT1Fj4aykoqlOjqnAfQqQ7EP27smSNsIAYL
DyTWuoDiHYvWrPBosSy789XFGHRuTO0VJH2cbidfU/sDBTO9f0830LCzbF4IX/fljEvSgeuclwcT
9LVNCqH+65PXKPTYdCYeQMFPRPU5dtoLvnMvQGPVjhthKu+ScvWaf/ZWUmlAZe1IVhEQd6V2mEX+
s5pFh/8TcYw7w/gQ0nzxQD4RmR+mkLBsKl+c9tjaA4ifsfcNfmneK3hYCXSeh4bhGF1pEkYV6KRc
H4QfkPr8XCixGPun4jZG/9n71Dq3CkGHgs/8fLjcog4o9wGdMKutS+O2ysAzA30eOGLRnF1BaaQP
k1IT0gSGJ1Ve5D0o2nSp6xTcyCN7u0KO4GIR/pgkcf6ooJ+oWSI93Rc1f08/uPE9QqhUGftaLQgM
9JQeOTnqC66mHf9mt7hfGLJcKlrWa1032W5PxXCwom6gl1569RWvCpuHjNdS7banIzlAtvL58XK9
x+LS5eG4fUG/+1e/I33jF4KHnvUfss7p2T7mmvfMyVnoh4iKnfWtryaiZmrWgf2TZqFLmSPyITLk
9njVFl0CKcxULu8IXAm3QToo8rjAq5pzJ5PniFCPAdeoM14JmiABfvCmqpMyuPq9oFdOf+G3rXM5
WL2YRAe2tZJPYcEflV3yUlYc3dd3DgDiUOjqNTQsAoGCvMjz9AQChmYAB7xcD/xmP7kbTVa/d76P
LptxD+trIReiU8n5vvOdTgRpbmj8f0bwYP7K5Zh2YrlvuZCOtTcjKcFdnoHXlfGBElCqVraoLj99
k9Q7bqjnbhktayQLenlIKUvClXWFIXBNAj0SKje1IbOuQMw1wf1IfD6UU29oxE6FHnGCN3Ty1Sgf
fi7WvmCQO18wNTiPYV3MaPk3ny/oTkoBrSngDOp1mCElaxjB2Lx2pUSsK8XjmyJp6wez95/WauFT
nBZAS4ng/OUi862JLDXQP/YzLFMnz3//bhS6vA7zhJafvUe2p7GMHC8TxHVOr6pwGovf1PpQvARR
g7C9yy4gmYYDDHbsrTOC5jtv6v6GoOk5DV1jYthwnDGdwP62wSunYwZULWEkpBL5IH0FxBdlaAPL
rgJn7/nBPxnLe861stHLF6eIwTXqtUd8xrHUT1VLxWEmGQYLONuBzLrps2yIuXrrbtO/OfomSefy
4RgvOVkz5mnqnB9+VcTSWOurpx8MT0fgyCeqnK6GKPLkTygj6TaT3TYU8yelqz+13GPtuyebrY0p
moG5qoXGmEihPFImxhEG4866iU2OzXWRfYLAQsQ1MzqxuwCtNxEnxEjgrYHm/Mfq7Ja2iSaNYZIj
c8co3QEcaW1KRaS5v6opIxMO/UlTlK/fn5/WoTsz3Il13v4Jt7v96RdGaQs7Uhh8Fr9XvONAXAFQ
NT5N0Vzv2lXTOiy8ix3S+xBdjYPfe3Ol0vCicCBBcj3Eixc1KhZH75u3PlBzy9I/6OFfWwgN5D6O
VuWuX6WpsuVO8Iy7kxbQf9bSQWfiXDt2vS7wL57gDye0klA6kTq1H8RDBD+Wu+JY7YtRPWlqZ72b
u/wLvkbLSPCMm1oNxqrXEzt43FzvVSVWufSMs1tENdrltQ77tFFHF3CLsiuM1lD9RNfrfeV0rryx
1CarJlDv8Z0Ge3xeEoO3o69aPmQEYb2lE/TKZ+dq7CULYB7NixmLQwB+GvL/HN3ds5Ch0m7HCZFF
VJLu23svaPSRuDRMuDeDnb/6AAbHt6udputLZ1MJonScVTNtKAQmCR7lnOeztLYJu8dK0BVKuglf
yS6HpV4mzX5z4U5erxZFbjR73gcJ/sVpDpPya1bm5ZPTwRG9lT1LXq+phypTfBeKzX8gyKm1d/9K
i/M1OMEJpDBh45td9aOqqiUgUtt8ETtHVjJc+q+H/178pzLpggf5gJkC9F7A8RkMVKydPWrDZJBh
i7PGmxuOrwzwqU/IBp283uHaCLLJ+xLWKzthBcxTopw3usOAiXv0pf5HUE6mJR5HhXyTGxCxeERK
5ijSiu3Tn15iWI49KNXkva2/Ah/LBnZBDkb89IfXgL31CdUFRtkcVzvW9bEDENcCx6HqFn3TLECf
LRkvQfr4qzQCcOQhJavcEbreLnTQaDAvTBIufVEp3OHBtdJPS/og+AxVFjXoPLxrBR1B58ILbsiu
SGOPZ4Je3U2CpFiN19bh8QScyg2BSmKsJWwvBhBV6dWaK8vEZ+QQ3ntrlSRfqXZMLgOC+Z5IWd7e
Azm9qXZdJvNKIlTG4Vr9/2UWV333bY8dynrLFGNF7mDXzvaAw/RWYscy4l3b7qS7/WEtTmUXYM6n
bACMoIyg3+5vlT8njmyjbxZvb3zC9J2VZ5lmRWMRo2dgi3NCiNztIRsh4QeuKkZDWbB943+whvMm
v5cE1TGkSjvOfTNpgXlE5xE4F1Kr2DG00MxsYp9gcZFWwQhg1KOB5ohLhVlIGPQkVQjUg5TBgI7M
Tq/ZobT12b2dixIfLfXe6gZdr6s30A4QYT1ICCQiuHffdlqZjilj3sfdg++PaPb2dg9iQf2fxCiE
kytt+fjtpMano53Fm0gBPs5wQyknewQEV0rp3//ACndK8CsOkTr3HrwAuq7XEdkieQD2HSKL1HWS
BINlI13yq6HG4LJ/bRvBg5KNoVASywoZVPH2/45JE6z7G7/jwFLXWLfClTEiGIzGD005SeqMUgZC
Ha6UgERFord9z7bIE4wYiWi5X5A1YjDLIwO5ChrE7nIt8/L55Dc985PY6NK3xRk+VzzAW/9gMs7K
0xZrklXjR5H2jj50q0DJwJys0lsxQo+R/q9Xuf29QjNyeQSjIq3l+4qwCS3Cv3Au7xzughw/mnLg
xBZofnYkZ4Iq1owYycENkEnYN+jkfLEoilNUolTbQufRu7Prfix8a7zX6vCoIPvr3HA9/QosFj2Q
gGAaaBipuDou85Tgf/RK/FX6SQd1CgSA2IUpXjQypfA0t63dIqrVPZltaqJGdeOpznS+ALMEiuQr
ifZOBjFVzQkiCFA3apYTztRAFl7ZnslcyJCOauPfpnuIfU2JGQaldED+8E58Q2l8HajFPRMDsu2X
ndWXD64v8PWFqXZuncQe0ROjeiIyT2Gic48CZfVuI5763v/ouQdRo7XAI+MY1KuF88MNINZwfs5L
1dz3QGNZkAOEovdBJg8N9n58R5r9rPmRdSytoYIaGbHy9r+WsGDju8dMLevO0d/nPpso9MsdZwGm
FQDrJ9DXZOPpLlDxaJsfpHOr8BFGOdiyipoEGvkKInRGXSvrnDnUyw8kalOQt5cz7414WRQ0oVdc
JeKjeGdp5OPOjaYdHfRUA6Ig7uPEyUoEyWO8Zsi2BXapfZZd3kMPlpUWPgvnNMOzOBpCffWxdNDC
axt+3B5fqQ7q5lD5Y2vzGI657w6hjJtG4sNCo3i+MLH7jRn2ru8rtlW/gHrsWnaSWqxOb6j2qn/6
imLssOZmsYEzCXFeknWnzUAOMNp45bJCZLxwkUExLhhHDjsnBdTbnG2m7rwlpF0mSruQRFkYim6x
JEhFLMPqMQe6VWszyLTeVSP2bz/qZFT9EfkfR996tFTJl23Oy4FDiIZmgSs+EWgsre7gyub0NPHL
Bwrp3w1U2r3MUuyWKh82s+TqkTd/S0yee08BMVXSEEr2Y4xLzdYIYte5xxe4q/OTsqxBuCcykiWV
0KumJLkbWbz3ulwY95HGvptVZAzCznrDBYkXZiLl3pTii1Q5uRg2mgkMi5WeIHZp6tFlPGxCGxV8
c6fdI0F5lus5TV7GyfheLB19cj6FTkeuliT/cIrkDuCVMchnsJz6p2QappVBEbOQBbtkY+P5LvQl
M/FWIZYK08rgoVM7FVwcU1Sz6YNPmme31BBce3I8B6EkCpZO71K94uG8+snSZVOD7kz7v+Yo/+X0
/U1Rt1bswqt7ut7zlJJSpkqZ0+exnlUBrHh8iEFlrK/eVl/NMvK5rKg3D7AGCCCZJx1MjKfELeyk
3dvz2g985dLKUMWIJuAMlkHJ41T+IMFGYz+8FgJn0OF3GKoupViZEjDPKciEqU7gojt5Ivyesvtk
Ief4/vLNVl0X4zpFCYNoHNmNl9h+N+aRp8EPv/rHdneagelC+JWBzsEKx7Fwukme54EadDrSeXhf
7bGRyvJ+tWZsaG4U/S5z0SpKfYBF8956Ez84W5fH5vcga+oLMP8ML74uc4leUn4Oe+RDf1FKq90p
n9ySUhppadVbPfxNhfiJ1UWOGrpUp+CFxKH5ovpEAl24VvkRDlM4oa3rXhMlVuUCJRPJZCCj3T/P
lzJ0k1n41dkQJlZHvqBVEaerJbdoZFECHRwpEIs5fEocxeyUmgBfrut7FpH6oE3wqu86XE8UaOE9
FctjUjeXy1Fl8ZQ0VVs3HqRvqK3coJ0GjrNGlv/fkbwM6YvmImlsixxZGU7vJZbVIDP0RtwXnn63
So8zgIvR9DItQ2/zF/Y32DultOnyQACmpLrLS/Zmp3PvB4S0qosHiXFNJkh1lzpjNXUjbkL0h6ic
Wd1vetoYW9iUanjmqjIMx3CbxlysqeAh6yhkmic1i0vyrjxJOy4dKjqAAhRmmFXs+eqUuXn1QyXW
/mu24BgzdoqD/3mp9VoSphU2mI7bSPMBXfI6NLC2aBctShH6oy6Yl2kDbyzCzgyACKanNZURv7wo
8EjW75SDyG/CFuoR+tI9Oiex+7v7ft9gnz2FYTboYqqfPdHQhOLfF56/xsFjxrk49tBoDHH7gCnt
deKLdVk7J89v0ei2zAOP94SJk8w+IGSIo8oGCPchJEiqNJEzRUANAOhDIIJNTheZ48oEfx/sO0Xl
8OolD3XWhNssv1CAUpad/DqSRLYkKR9elcN14vVOGVloThm4VHv1ZwM+2LG8GDXuM5cOmjAt3dU3
lXJCog8LohH7CSCAg4AjsKsx+FLOa0it2gP6+Flh4C60HOP9QoQ2DUfCJ8Rch03B1scn+jEaiojc
nUBBlZ1pS8kKGYS+kT6oXUm14wNcacaV+i3jK0g5u9kIjq10cYYz+nws3xrxJAiK9jfBaSOkxaoQ
2d91Trqg4ePZc95gMHA4xj+ZTngqXvsWT8pNzeSFeOB+bY/ychL7ddLwhocfGWpt3L2mQAdWtIY3
h+9lSL2u/VplStWM0EBuadpfaiZ71fKeGLn70ZK0mp9aKF2yY9dgO5XkBmEjaXPUzXSqBp7udTzK
IhMrA/BlJdfPDIwbBfn0LRKrj7NjSEz1Jy9UqKcnjxdRz2tM1bLiYQ54QvKwYQ/deKJj3g04QYeq
l4SM62lpAyfA68DkIbz6vTGn9H2aOToYNEYK69JVb3LEx3r7VU30B1VuZEDS3POuB51ZUTaelSyR
mdSy5dGojsppFbGZCiJwn5gjfJqg5PRl8fqYMmpFndbN1bWP7yVKAcWdVZu2z0vWqTM5jnRCLLfr
Ohj7ANBWg6YkddPZWE0re2wop9cFvtII9gir/tL38ZFArBVw59h0QmeXyVzwUfwV2FktGAIyi9SO
yALgIDKTsidlnPiQKFHjlMBIwnwyHCG6JlsBpQg53qCMC/EqV0ur/9KvzWbtB8nHkJlxo3oVH05O
nxu0GVcYY7Xwu6KTfSE+YOn9p9uM+MOUsyPH7VeKpDeQXHbitLr681q/s8JpEkBmAXjRHeGhOXS/
R11p98jBq4lrWMg1J9khMwDd5QqPGXCJ6jy+iu4qFeEqLFLSBhe2NxKp2wFR5OZDB7eKv2a5HLei
RUXJhLjSOWZMa4Xq4IWuWnulUJpKiQBhymvI71SnMP63b0gp7NTRHvFB9Lm4YMMibrd0XjXkQs53
op9WHKQAgFFpNjNBjOx5RBTRBoiRjR1i4MfNpegx+O6xGXxVVbYoPqzO//oXZ+/BdcW4WPGl89dv
K7FTna9ZMv78nCj+BSAGysfjFRe2SY5E7db2Uh5g3bx64C9Xd2FpCY6IV886CyBXfpBVmM/aM19u
K2KJd+KudrzwKXdX7XSvgxSSRjP4dC9UxolY1QTEbyzmn0DmxCK1DF7yUa6/TSNa0DkCZy/GeCIf
XpeOKRtTj7hK2sblJemmWG0+/ZgjnDzqwzLGRcmjqqgTIosVfqlStaQv7MJVmP+/UKC9ZNZQqyNz
xJcEEkUJu5SSPjnONf2zuXLt0hk2zPdHpDNRL6OMQU5HE1eD4V/k6bKea18CpIO5c/Q9GQ1I3HYU
lrKmigo2OlRz/ktenB9uVwEDGSA4ILEXk3OY/Slz4LN4QfwtCHGVckvawx1nGzCY973IUaIuVXx6
urs4/UXsb6srwGnLYLYKM2xgI+ku2gEc4+slsAwdf/an4iKwLuat2PQ7WuqkJeNn40av9fbD6Ygc
uVdWxns+2hZJzCrA5oUT+YogTwzy6qLQTZx7V7Z6u4TJBY4a3UuNKc2mTKmuE05Bvv/BRtxewfET
7vmd0lUDtX5l++8v7yINB9RYzcz+dBeNTGxoXiS1GlrnHT0Bx4GW9SPaZw8SPikpJbLSiYMDb4xp
rqqRhaUjTDIGH9wQKUqRf5p9BhGAmdk4HRa0f20hCty1g2fqjg2p4qO25uOozjOJjOh1h6Y3ZZdz
6PqcUyFM8Bg69bKnbzM0t98FU0TmJ6IDddQbcSKVxttNN4WzGXizKh4SjSkwzV0gyrjUeAevPMpo
19xkydCWOZTWiSQbYK99x4b9rGsMUCSGyGGwUqfcEE8t846NrfumA0/pHW9+G5Z6H2fPesKO0boJ
J6HEwEdFMjHT1SDBOpb++Yy8hucKrNqcPVN4M/OvYGf2LTeJ5ud5RnTNeBAMoIMEn33yKIEzm14S
7qotO0sui0IhsKtsMxmOXrdGvJzMLD3ASnhWCHnGBBiSkzmD0KE1URgjaSfFOcg7EboLlf0eWAYT
qu/7v9+Y9dhR1dTcZ0JdrISXZZ8n0d7lyJZVau/Vraf7D5nV2vUXr3ogo4FDkFwbhvnw9hTmwXHJ
ZTRUSq49JxYEEiV3QSXRvmhJJXHFHze7kNywwZr4W/6Un1g7iEisHQXdHDEgXCQFppIkhtlkL9Gx
WyqZlpAlANw91t6PMp8OZDH8XHvMbBhfe1QiKjZXolAxEHvuNVGukXR0wRaaDG9FfW+mpTgzax9l
R9Oh82v+ql3JiaVAfttfVvoZ3ZTLdQw5y2bXw7nus+PIdp3g1owi4P3j3SqWd76bEJ4LNsui5v2K
ozaVO+E/broVskMDl5cSe9b0Q/Ro7CQY+DDbV46UIcydrMNo82c66kAeSwqAGZl7Mi119i1z9yHR
qDUuc6eFuig+MAryWC1qSkxmsC1Xw5qciKylOzOXsgaNvM5TuWQzW78gOhW47P0v1CI8SN2ymrwY
nyK2eUdnQcU1dk9c9eghXQhGJmh+yFs+JZ/ENGncxWg9L9K65PLKTK3Fs7N+EZS0Y+tbC5hbJxED
eIcL/vEjhZOx8NP3AgFmkYw5OcoaeEHDkVvKMehycIjG57avLSBsowKwQyr/O99tR1nNm8pBisHn
BcWJr8C/x8uyGxJ2I16DOZgAHTbevMxQUcXlovze31k9Qtve5I2gcUgrdKGyzZSHa5GIX3E04kPO
TsF1MYJFR3H+e3gWFNwezv0RwIqeGGaH4iMLjuXZI8AZG1x7GFmr3DzDXTOR1WaaWnqOY7TKAwHI
gyI+poyvOCwql75qOQ2JZy/ux6Fjdb4h3QjixzElCZwgKXje3r1rdo7lK4IAulz7LAjBP4uJSJBX
eGCBJenXBMQeItaSAUm3M9PjSDiShx1PGzrvtsZWRTASbSUkBkiGXJprWOMskBNEGgD8Fq0ZPhWI
8L2PeHomnd+iu26ikX69+Btmws5frISQ2lh2o3plsH77GavxmhqjWbsMAz3BbRhlqHBNSL+ysTqq
SIZub0hArV/9tH0z+GEfNosouiYG1MkvPd0ZC+6lQok5kTfDQkfk17xysSuUU9EcSU7XZTxh91/c
8oZXJ9xpebBvHerTnVgQ0cby2ghRa0pFmDMs1HvLp1vOFM/kLXKrTJSH2m2SkVkt+s9SgYDHADXf
be1fpqtv+nXUAIEyf7xTiMdnzYQyJc0sLBcD2yr54P/RCyGk9QtmKSKGd44uCDGMfYmUA5Ui5VuS
bOYT3c/F30+9vkjMfpCDNdFzxt2/I0KZ/AqErxIVpq4Yzffgdlv7kSD06H/uQgHTYCS9WIS5LMm+
qAuMlu8hm0SANOQ68dWCSGHW0V3sUMbdwDiOytm6ypjnFDvMwOy3/HYt/JlML8Xd0WtqKtJqeJpv
NEO25/vr9BlpdOWnYhyPU91SOsgT3Lumdf62qZB+DpZDuCd77rHxsE1jiJ0PoXtR2l1sWD3Nnk+4
99mKsSyCuA1++iIiY9Q9XngOZEvzN6K7hbiDfCT4sGjRKw7d/nrBsIfdHDTZEDs736nHgNSyoBr9
Y/OmkG+x7WU6GS5xqogT+kgQIyoFph0w6tjt4D/vZ5aH1Dh8BDgiikMNM8eM2u3W0evP6Vdcq0z+
cbWrnnYgm12KmZiQ618OKRYDa4aOlUGMCxgNv0DeRxR2G6mcGUX94Sphac1BmrEKf+LqC9Mbh6Yf
OesPhch/aX5eP7bkE7z0WLoegEFRM/2hKjM/C1Gv1xhI4irT7ztS+BwDO6XbxNCRlozlwMyEcXnG
gHeoko8wwh1IcUKj4mwlnJHfpgM+MdN5z11BOT86zxdkXNlcDAueNB2GV7+FCvCalMG0vDIMRCQs
zWM+zbxH9GjY3k1WS4KS6UXCR+28j/EoZIT3kxWeOOe3AMp9y3TTFdrdhmZeHkLhq92eoCUdBqcJ
6GI7ZPG3RM6W0ItZyJimNHEIyuDVGuZ0D1+B25qkAObDQbT1g6+9I+QRtYVVvoavmoO/Bai0Ihpd
dulJr0gut65+uFd6+vMshVN9OLbOi3JmWxj9Q4sGwmMByMJkBoxgHDQvo7FCniWSaN1HCSt4JE+M
fLGd39idRwOzl8UokYJuRdgJe2vBT5vt4k/HwUBRDGgvwMGHrv2umckjn4Z3PYhF8pf6JfJM5DOI
gSPZvOjoDcWUlmVmhyuLLgIcGAoYfDcGaXG0iNBnXAhVCLXasF+gyCy3Hpz1936KuTnseYsbWEAd
mtC7uTq+OSGOd8z+WfitqDoO5DwagkqgfUTPI6tYpEd7jlaidrhkB6QARhBrgKzrpnJhuDb4CMOU
2kMpy6d5VEQRoll27K+tD8Phi60EdXXKMaMeBGe5vQveynft7PEYUlHb/95+avZuvoJUh7bwWLoi
eZAXj7DSWGZdZJIN85tjAPgtredKjsYOUtnCWtCz0zJQ5q+TLTXNnM3d2BqZmnfWcUVh6gfSGNxQ
Vx+rTakib6iE28bc3lcBK7PnVUu21bvT7gweajs2Ujj0z4H1GY1bD+tQQkjK3v/WiCUNO1hb54wM
iQlwFHApKNQ5+gGzEA5MCNFQcPKOr4S6ij/bjMbDrTDQ0WBsMk0Zw07s1Aico5JsGLiS0pz6+GrX
HqFT4Z//c5Du9+MOBnvBDR4OA7sN3r9c3lXhgkxZA8ls8M1p/mq6IYS6dbgHmofxeXHvc3kqOvWR
TGKnwMft8asbxiIJszrnyWw5uptHHItlYq59FKy9s6/Cn7K8c8M9dmaNBP/6/NiWDfa3gGDgt5ja
Tc8+T5HomOMdwiv+zIcWqNWZ28suyt5U0c6HtiuKSeVzqmVsPqn/txL8e810lxhuzbwluownKutQ
lvSaI4JndXv5fk1eSJo2CfPnklMZJgc5aO2/rdOjkuAymGr4PXyGXEuKcUHFSLpjPIwDKmp2uT1V
vSqyL4kj92t/FREcbb0hqYnOGWSgsWpT/K4sRUfUQW7CvMkV1iCAEmEcqXn2vQAL1w/bbdhZboPy
BXX27B0YAe8EomWqft2HsCcHuyx2pVmKbVRB8R4bVS4KOkF1ZAdDWW0v4tRHMQBXmjehpISYJqJ9
HROrjRA1Anki82JuPu5r5uXOQhLEDRaKq7TJtKa1tLexonEUz+/Y+l+WrmnmPU32iSJAGFPpxuj3
ETbn9pIaWTxyxhGLbawCOaBLbYWOcLrL97VrQyTiSz9o9Nb1hy9duOphBY2Y5W3Wgc3NdZ5Wa9oS
MUb1cvSn+TkMolxnjOq4ihc1TBTbCBLgJObfgobMPE0w5WkiAFLYlzui8LItlT9e+kQNKQWdiY/7
zlArFQQ7PQDno/PiByQ97Y+VU9uCuIfFCKek4Ry2qbzmR70CS/FHkOOT8itRYbVTong6oRwfmE12
WVRe0BLyy7HPG0D5zDvz3fg9Yp47jBhuuZxLss4bP0mTzPSDSuXUUlAlLMpbL8msGhs/DzFFkl+3
7H5fqUxzWcJ4IwnB8SXljCJh7R+yfOFdsTz8SGoLpwbCiQs4EiY4T5bXnbY205Uz/piKgAtm6EdZ
aYCVVjkVL5jzo89P0ddt4abXOoyLIZrCYweOBSS4t9jQFZUcIculB+GU9VUniPHRZdLdC2VmMIj5
7iF/OweC/BKpUCro5dNanf50lw/tQwWpjN7wNPSsN5Nzk15w2LS28Xo7R3YT7Zgfm19z/VyjpUe6
WUnItX5RD2xaUkR17jb4OUD3Hi9azt2GS1ec1Repso3KrOf24WEORmNb0mpY+mBxXIQ1CUNOOKqd
ccDRhm/AtOSHlnaHVyGK5LrkpMyb4S5MehvuPvuD2t8Cy4I8j4mQ+1PTTns2WDul4eWSvv8Kqk9k
kvCWXL44ykZ2F1s787QSPqPL4J0g39HwdQuDwgaJjgOr9aiARg0quC5MmZq5MXLPYzbAwK+645hs
ch/iAPLfr1Ul6r7VOr8uLM5s6CpSQqrSO8d2MJ9gimp9AM5ob8D1Q+2uiARAcv5EeIx4Vs/Y669x
ZaK4bnHo0IYjWprser1QEwYpg5qJ3lFhX04nYVFFfpMV4BJRLHXQS8MwgNQ4Y3lYr298Sus9lzav
dQSgO6Cujj6Olu7BcTQbkbkENFQxXc9M/dXY3Cf3dddeIxVsuojvyiZYq1ScEESPN/0CiFquDztj
5ZDyzyexhvt8xQQ3U7Bbor21r7kVhOAG5Tdo14PF+4xtOf3ol7D67fQ2EvU+ira9HoVBjL5sIWeh
e15z/vPDyCGKByMBe1EBBp96v7n2IsQT8TMKYu8lcEdTZO2Xq1mslC2Dp0nkoSN0NVx2Drlf90sy
xcL8qci1baiW+JX8F1cEik8iEwTjH0c1TLCacgDWEQTVoi+2prKPbS3v7A04i2ByjB57ubeKDNnw
WVqr4eW52N8oBJls9wUooQ31DobWx6tyWQ6JCDftoCTWxEyqqTHh7Rc/XjvFUYHUAn+dXwJhYnNg
SUNdNo8nNUojK1n6YmSCh46WXLqiAJIMykSICC9IZb9Pc8qv7naRRkrG9jZ4Xh0SNErnGJ1zAnsz
j9ntadFxB//rEVprBBeaX8vh6c+6T+7AwQ3PKfXQrDCPxIQ2pnqNmTjzEOi0w4JutQGzpNZW0881
rHTL51gx/avOAbh49oHeULCbXzsD9BOEwxybmNoy7BqHy63u8+Zv8OTN5qzuH72VFEmdDXmVI2YN
ceT1f/wSQOOXqFVKD3QFIVrJLIR/NVZslh/idufZnEOstsZPQDvAAc9An4HbbThVITXZC2mnaydL
SVhgP6aggfzudqah0lurALRrKE/ALcoye56agpGYaMVh2CR6/a1MQL+IqhnxsPSNBOU1HRTgPVCn
FuB6GowJmytMGlZ9yUAYMcC7o1dV3BLhG7ktJk3U5Z1Bfal3poXPrOcXSsto+EX5coXZe7SwhMu9
D3/Te+dSL3UKhpxmByfjhxMz+CS7Jporf3BjL6SExNAH7DwxwcDOnryzghYl/saNCthCQ1Ww18qK
+wygWSi4VmDPcTI0UqvNywK52A/9zazaSIsrVhJxXxFbvJz/Ax9DuLt6P8MVN/Qi8IV22S7wDQrG
+O/eo1uSD1+4uZwZqVw2u5YZMLRJmOt67jqRcFk5E54ReXahp8dg6mfqg4f2b9X08ViLAlWfx/zC
Fede6wxItfxA57FCtg5N1n5kuxt8ijd1/osMj7hra4Ojb7kkcbkqO+NwSFuP2HGlwtLSzAQKubo3
Is93SRvdJ0YGpf4VaOoi9+MOz3OHKOca3yz083Omd/h0x0OwGIwPFXrzHUvS9sF5qRO2JquJfU1G
dL6+rBc2JVdKa9YXolFXeGSXV+qKHmHmA6vz4cxyd4RI1hIzCQYD+hKNXVCJNuigv+gntSDgXLvF
I7v2GGLXoKaOsSodrLGS42DC7p1x+SrMH+RdFnYgc6PUHgoUdi3WXdRLjx9YYHLYG7LRrykbg7vh
kPyvSk1+e6/kKZsmJAqnoOpZEbUyuU7Eo1vp1iCxjeRs44bmWJJQQiKTGyQxTWqFRGiCtOHQ9IUa
pRoqBi1uLcX1tCGMzJOd4/WKynr8Qb4E+XluJeir4YXEy3Vh61ulWQISSKwNOBbQvPWBC+1YrEFh
lcGWm6KAcpot62Y34j74ZG1LlLR18ZlmqXrEZ1UinaY8xEYlenj//sSRVFcjR5T31USBTVHjjhAR
p973djj+jJgoxoLbtwtWga52jAUn2VdBc75GfNM04V+xbIvnehPl7fjtpBSgUiw9s12yNYtOhusY
tc5M10Pzn260IW2gIKi5RdVKtKv53dL8n5xej0KgC/loRftwEUPoqzc4+UbmhJs+zfbPThD+z2Ry
PjLlmf3HqJo1EYK7qUuUaur2d6Nr3FAemRUBzhm/0ym/C3QtK5GS55fvOj5hQmTLNADmoQXnKxup
1YMMRob/EGMlz3g/XOwhtipm+4P58h7nh7FlZIxgfaOx6CMIufu2ll0llsAS+plk1ZSQ0peZ3t5O
KFGppvgvALfBtO6yrMaW+w/BgAk/PwicviTzU8IwCWJluxPUj/7f7+5iW21k+VQICG6h3p/Cjde1
LiXGjrH1lerykeQ1/goqc7ZD5ELg+MhUZa/peqb7jUJr74Ry1lNuIEqCfp8FWno2FMbiv3UdSBiv
CqWX8pLll4DPnTOs9PzOefvn45aeImbNoqiC9MSTqEg7bTaudTxUBwbQU9e5IotOnyYzOmZ1ELHE
YaE8P9YSXXm3xpVOoABrcX3OqV2uu1RQtuOg/uUwuDdgUpVZNNX4hmvBXsPn0POGOAhvJnbFcDOc
j6g91gMahC1dFbeawNj8PoFhpTse3egO0gqFgiwMCX8Fe62j3SzUbVgScZg0QQyniXZyMJpgxZAI
sVQe7Ua+zjZrXCUPk/vtAJ5iVIxZJyz5fwZb9lerT3+ZQxfzHgeVR7lz1yzyK+1KioviSw5uerLF
PKRRE4ngQ4RE0bxda5ukIUyXEHOD4sgWRG97jWymA9E3OrQqXbWKImyUghI15gre6y3RelEzEGK/
dTURQIqoVGdgWkcvj1ZejJIJu1F8QKQLJ5dpnFW/oRrvMggw1tHN1fY1I+OwXFBbajRxjGBFt0UJ
3J5A9Gqwmkg3RQA3LuDoQSl7U3roMD45OW2x5nyNVdb3LQK/XZy5qeEYFijwhBBFLBvHQezXJkD8
VI1sSEqqrDxjpf9ppa6R8DQrSVIx2Xfdb2rSAeeubuIoJCXUHKz7nheo4UJa13O+UzCyTU7ZCOID
UPC+Xl6B7LRB0IV4kCQgVvVNsvZZhwGzUvBbfMrDCjobEzlnRsjwOmAAmXlq8kr7+5zvmWgnwErl
quZMD1N5KdUOrGMXPrxC3bdyPKUDvXjJSvPeKSTejzQHC5/fgAGPyfFwwmSBsMc4X5xH29AxWTsj
jGfJl4Cew8Ona/f+1zXXnXPu8agO/eATAOx4GTm9anhwZwHUjPaNRTqKFFFAf6G/Sv/UCu0r5nvF
plmtEzEkpk+FOtWI5ee3TkM0h3T1M6ODThQXFEFV/EP14mHtnTdkTGPlmVLmcO49iK3t46zwDnIo
y8CLp2wZdSLVr4WvjJgpZ4X4UGpg2amnYOKMPqiyI7FkdyQowqFHoPqrUGbNrKWUPLLZUWlFp237
G4tIZwwUPv2Ee/kdBp7vlukXGPLh/tCkuXewQF/+u+RRGG5HxL9Vk0TPjN8Y3gSiGIVIcvKDiIxJ
/M+qYVK4UBEsoVto4Ajv/59BMd3p50Z8V+2lpEBs9r1uwKu8YV4rn3BFGwygs4ckN65pCRQXANMK
NL+05w4JGdXyGoXB0Yp7pPjfII0cAx1zKKrlPsE2jre33iaGmg5S4YGX6WW9MoLkdAZwjZ66Vr4T
r5fvRVYXnumyTw5J25cIxBMzoQ+zZtcehci96bo0S235YtRwbXV8CtKWSXerHdaR84Z2zuWRC4hc
rmKAktdbAuTgq/oHUX33ou1ErPBVQNWSCbkFz4LaTQTGmHpngRWsMVAt0rKpAbKGg8DMmcBycY1V
QRelS92or3+FYBhel1lnVFkVZ8g4CWzGQjClj4OVHXngi+MEQwB1H2LI+yxDYx4Z7J82nUKJH+Zv
cFR6mR1ANUgQbsCYUgGCQY+DagmSTqYxrEPy2BTFeZBFFpTwW5Szn9bQXMG7/VQectyR9OAyFg1U
Wa9IOnawyG7b/utMJkCIfTqsXR1f2ZsoNRiarTVzAdbiADfL3ssmPov2QVoYAb1KyTNByNj5v/8K
sVcjoU30HeboPHPm7Y56XR+Pv0RfHZFwYsex9U6nTSU0+Sl57pxs83aUXy7DaTPyvp9i4jExfHrt
qOA8mJhvOQbFcghNKPJ8hii0ra4148q76Lv+wFaxsU1JxirltsbqlKZksfZbUo1fVtX/D5ZX5oSS
PyQ4cy8laCGUQdXA5GusY6ifAcYtTHEAGNtJ/q2lCGZkFAaZQb+b5AK6y4+Vg2MzykF/UO++ZscO
dKmLKCooFCG3lumMW05xcn68+gJnyQ2F7AKaS1HEHwB6lM4rXxHGPQUbKulHfyW2Pnc2XmwSiWfn
2joKltaZsHiFGXDB8h8ww7HH0+ldswaA8lFDtbSeV9sGP9cQzMaBjXRBgn0LzG0a0L2XTIFuqNhu
5uHUVAF7tUyvWHBCKWMkoBM2H94mTlgWuv5Cj+T1QLHMV1YpFgiPHSnd3Zk1MSoDgosNqdbbTIR9
NfF4ZIEpTp5bJ1XfzHg/aEVico7Y8+yGkWp1VMSCVGO1V/Cxm2HIHPhyxj22r6dPgsQgaIkQEkUQ
kErxtN45zCk/ZPOtnf9NK7tUha5eQV86dUgStxIckWP5t6eBZRlWfq+KGXONOxNI/Q1RcXfjg4bh
28szdYMmGDDRDUkJWe+DwmTVPt6Hqx1bhzfmtsdISp3rXhexj9JwVUggNFYlw6TKN+YuSskelXF5
xzrXUD+2HeVLY3iS212HRVRnM/rycfY4v8D58JKOh0TU2QgfAbCDsAp5dM2/D8LS3UTkGZwK26JY
IKEPjIOzxoSyR8eM5eKB+U0KBaFUE+w74Irq2Pv/xBY5gC73VVE8voh3sTFT0uPwb9Auf9dBxSBY
iDDfzbVvoHscdeYFDRneCjuXf1uAGMgZ7eFO+cNKU9eiQBNfvc66MBv9FxTGU7YuO6CpHOiIaUBU
aK/0KgFqKq2Gl/KpAO7N/mS6KO9HG5f7jIdroN3QCI/VkMJ7aDT3fj5kWYn0POQ1MT/MQdr9N242
tM1OA5VrtzIVknVR3tOkrbAeLkoZEgw3qVddWJNf1Pnk6aCSHFRWIS1ztltIZ+Wg3TmgyQMsXLTx
dP6CiJh1VxCaSqnXzlwJhGSjBbqdfGLpxooMkQTHPkVVQQewNmke554sD9mRpmNCj5G0c0bc20aM
JTVIA3KTXDgsL5F+xA9zTdmr9Zpov2NM9G9O5W1Ad9ItLNVYpo7beQVziMYFZvrU3WTQAQOcQin1
ye/Iovsp+EXnvUXdJ4kBx8X9eb0OuyVtl3HG5Vvr9H0xkHKiKT3FGamHE7IrmmBltXPKE4XFx97H
YQR5vWYDDfM0hBMGqihVk9TQ8b1qJ5FuigEG54bVz2CIGm90SJZQwGcSSMNLgIbm//JcO8tlGZ7q
orUL6uhh9DUih46M2smiVTZKwR/UdIlvCkOfDg5mvmUtYioVqjUGjkQMmvOAMZB+aiC+DEwAa3PJ
8xn/yoEeeEzZtoUzQClmgTJbeObzIhBrUnYp4dydINncVMrOGku/DM8Li5x1LsBiXihMoLMysX9/
ouClZchVf7sQvseyZ8eOZRB76UaXU8KHQYEF+q9HDuw19HDCZmbBgSvze6QJqHnOsZUCuDqpoD7G
nl6DQ44EUlLooiRy6tmv+FLlRmv/pvwxstxjnSOvSh/OY9WgKP09mbzyreV12R3SKMLzz74otCYd
GMjiYNElz8tI4exV5d4URtNRNi/SUy924VkzzllFNrmReTFRIlVSd9o9AacJCB782BrCz3bybb2+
+EIYrF3k5kG3ivF7WRF4+STcy/9pMAa3Ultf4LwdYxbpOBzBlJzvoA0WYSAuSUlSsn8yMxmn9WIF
q6NLjGZz1kqd3gKgLYpeRjoKl+R06xXvjNhMbniayYER5sFPXAGUiXCn6iggF/JGOSiMzL6TtHfy
bzyllG/ekSRy74gmp44op6aD5zUhrKr0H4EzFdJZhvzp+yoMlqC7WT2esqs4Fw5q9CKHl4F36mv0
4tqCYtaSzmNhpQe0z91fm6JZIQLUK1KcL/oEbnd4XSAYukRRhXCXNMYlrx2O1iZTJLWGsmephhsi
qYZ7JD2p8I4tQVnWQBdiE+E+uziIayFRbg376YVoRavNAd8kRFbG1l3qbtX/q2vAsYRRQa0knSIF
HN6IdFf9YDB06NyQH+RHCG+QNm9pgNJV62tS8n2oRQLah/R2RrJJYIzy+G99SVdkQW9Z7XE9iMro
up7Yueu3E9x+MIGTnMpTib1Nof3ncN1JK84bjaRKNxAKlJnnkyu4+EO6rXIyP6JF5ecaFZg0efXc
91rbI3sTPw/Po7JAEKiJd1GWu4TfMLbFBB//pd7IEuC5nppIDWdmivM3uBmTR/JPBEcl+m72IsXt
GV4Q2rAcJRdm2R1Zm012c2q3PwjKtoOaKAQtauUyt3R2GcLrKI6UJ7HDk5ZnNRjqo+rgp1JJepvB
OGtKh5ykHPNPgdQKEaGNPeSN/E/f/XXA6Fvgfujxxz6VLsBE0u/Lyugjsz+a0icLGBB8LRUFebqc
GTKqPVcCtlWyAkdOHXg8c7GW9Vhvry9lQ3icChamRoWs3qLH5ZPoRvJOl3cPig8fWS66M4aTH0AT
rw1cRKWOIuCMcAw9qUcSBWEci3L931UpH2UBfUYnyFWCc2uoff817oOnjNm6LJC1VCRNNM0WSi4O
hAmkR+3lWgbGogDjL+qETDo900cOBJIcqp/PHFc0jv0FkEkHQgYHPXTtL19GRxvD+J7fUNk7VR+D
PsmBr6pc7Npu2uyQJ1Oo9/2UZQZmcnXJmmZsU2bBm0zK/wAZazhI8zdgjR8sGk3CYRsLfXQnYWis
PY7OONAd1JA2sLjgNc8wRRMI1qoCBUJCirB7zvUWeVzVlIh6mlvRi8/X6pak5E8d3yCOAiiMyauI
PFrciBw9EgmPVzvafWmr4tCJpbQt5CDbNKWJBxQdeXT5P5stkFAQSIhyKWYF6vBIjA+eVHlShnOZ
032x4ERtn6MtT+3Mw8R/rLqzWH0phBhWuBY27x/3LrfVNoqpEVX+vN/MzwTbGiNymbUmJNLA/Qv6
0cZSkdVCycM/HtB6Z8i3A//uIE/k0df6d49drR02v5/fZWldQYlivfHI+aHqmxVEeuDLD/4K4Ew1
QHVqg932kLzMiVWOJCRpwllGkQSwmy06lazgixCGmWJjG2rrLhk7b/6AtLjLV5Xw1QIGpeplnqqk
5HQNVTgw3JxRGbqeJR7AAfGpZjf3JoqbKMcB/6k1UMBjHv0ACwWmHGp9JVKqr4kaLXunxlK4VRFd
iriSb5uczVzBlVdzVRMb72fOj5BNw3cdKKk/8Lh27IaimFQvrRTcfPhtgEeDElcFGYNwf1RI5MQK
J4XnVk7VK1QHTOY6KHgswhpPdr92TrTNCltknhJUlPen2uXx1p21VpJBbTT3+TKJjTycUGMoD9rC
64aI7qrRa/o8YVkIefjl6WGpzdyOxA3EjV2ag+LTNY1Aic+SayesWt6jPe9UMhQlhloAEJmrlQF4
HV/E+J/InVUPhsZgZ/mznb/8uMgwSSIFGCnzB6VIoc2V4jyTnMCYf64PPN6LYyCU/x5rlLr9v5Vh
IZhvnIlWfcZmBIbFH4XwrUVCG7+Xv9K4ukdvgyJO2nVunMaFACyAATQIDoVynZeT3N33KZ6aOcyi
T0bsw5AlL7T/zyDwtaXz/xIZw/X8JTv8leA0qqnqazS34N3lR7v9nTvQ1SFVJhdguOvgzjQ5l4pC
bDchDON3hJjSA04/k7xoSIwIAYBQIGwUSxAUn0PSlF08NgcyK+4yhjBInfNtnpDaOfX/Ok3+o01s
TNEwNOM8HYxrJN9N2MtFqoo8H+69WwtuoLWgx/Dsd0ZGncpQRWwwGdTkybgj917MxS04/1qNIyDd
2oKPsbIwJiQyDD1Wrl+uouC7lPTjesysqDuGGEAyR+TGIGOQFKjwnFFog9zqq3UPEwpwGtqKyAar
rp0pbaXUcUlOwgmis6TTioVuEo1qaV90Yp4/U36Gkw+EHQWj8V1f3ExexmCIuXlEBy+Ux6M0Wv5h
WjL+SjHcwHZReLpRvltGbEYT2s0JV0X9GEcazBrvJ5tFsQa0o+xIsCeSWMB8Yyi2ZxiM/8dx6k8F
4tavTKGaqfZqKS8/0TkBr+ZNuBRdgWUIEo8paKO5k/MnBixJ2GTA5+1kZR2khLXSssyz4MMAAZyR
DlOLXSpKpvdBGbjk7zWRRZprYUUkOYvnUvzkYHbw9KSzdkaIjtQQEzlqlOsBGvdKuIyahadLwcDG
qpgeiesyfmvzaSUO/iv139WEpOLZQvsey9786pzR6LOM9nTI2FX3IECZ+QSAkjmqRBFTUfiz3WsK
mK7H9GQHBCevVOAZ4dkaagNNxI7QRFLRxx0EolRGsCfWVbI6VuQ1MPWvMCPGMUCENEOFBwKKYma2
o5U6q7+WiRtTM6dbw7iPeywdizmdN48nEZYkGSHfLZkUHocOustFabHQGA4sF17bJvMbSWXHuq7D
t2AsD4tit/EVE/xoa6vjlF1kS6u1mupIchJXjAbT1Ka99rYOGJyelWS2TwW8oNqJxwI7W0URQstl
k8L/4Pd7Q7TP4W72M0EtDUrlyGwb/JPrbLJ48+g09mmVZWffZOI9+V0P/FC9FTbTytxndDMe4Msq
vgI8T1RWfeUFGdiWDhoBHTs1eAFUDNSrd9TmM0NNBn5rwRjp1Y7DYhgpaH0ntzSxfx2RHr71ptjq
MyQapt9vGd1RPYieLmr+5yfvtPZcAVft9LMSZTZnByeYRCHXv3RiRzxgsSudym+maq2E9iQe97eI
znW+V6j+LHx9zZ59tyHP8zP3ZskX5ld7ikGdm23E31vSY3B0amA9fujnQxx2omuIX2zqV0baVl8S
WrlKCtnzqW5UUWgiiXSwtw4dgZI/c/UcbMfHRUwc/nF39pNPpSlHOVSTWF+XTJEWXaX34NOPjUws
QviJzyOjmq9Hm/hB2AhAAJvHely9iwtrzd8lgbYw9ItQWBlZPLovEbUz+shl1u/Z7rLDzWe+KOyE
NKnwLOpQT65gLwz4168U9pn+xcZAG33NC9INiN+j8UW9lK83gKs4cTSbEDke4mVCM6WVVO3S1m/F
462Z4OkNsblnPcUMKWhGRbbhyMHyWq23r0TRGohcIlKG484oCX1SNttpE6jvVpsG7QOAlhc/W4MS
IfMGJILRghFlI2FViRRUdvy0fjEjqc7f8OzlDJCF8b2uZxM+c5H1jEQESGXyROZcAHP6/WFsfHTC
tB64n1xI0waB1gIlxZ5wtmGhkJedDhZ3DGc+Fqwg3YED9EKJefBnaVz4J/n4QEVY5Ux9AwzekAJv
DzalQPKc7jbOJq4tqfcYuv1z8UShic75g7UYlXOiuigeXMkaV2iXi83zItC5JMZkzu+NnDa2zwsx
SqqY7LkimQHJZLVA24NgTiQ7hp8lyfw2MAShiltBJM9c3N2obUAjnLMtnYioPw4z/avYtQvoetQn
sf8orn+SJs5V/TBdBzpos1bEyz0QOn8ICxhY6grhjD6b7FRhyHmHjVe3VpVoqF/gna6ivR4ponZ5
u2/XPJPDJeXiTFziHDgkQ545og1l9HC1xHxY3Za3EgkJA+8PGxt0SJKllYZzv/NnocdURMLaUQkT
Ih9TK8RDk1phX+lVcahrTCBX4Q+A14kT2tlMNRTzBFmFCGUTHY2AQ11TpUIQpzdOmUv6ydPbd6TI
dDqABi32UXVqvyl5JCHZY7bcVJeCZFjopbV0Yxaor43mu5Ygr8PWWSx6QnttaebR88ExYNQVBIX0
cEVtK8mJ/aZ11R4iHHIuMJIzP5ntlshvDgjFSSdskQpRDA3vOqY4r0TPF7itSayu8FOd4GoIsfsK
jRA7yORidHZ6uPeibHJf2mANGYoHKn3KRehn4UIqnG3dDugnuwL8lYR8ckt6NCC+DkWGBbt/BGjr
nNgQQZGVEFaVw1xrJZ6SlYuNvAKYplkud2G3QQK37o+Pwmyni5500oVxI4jCTB2ePesZbgBACQgJ
JVGjWRQ5SdJHmrCnl6LdEGf9YzkNq7jQpJ4IddJwuj/1wZSXEhAWRBhhmyGSXVp94a6gwM4eFqGp
ZOYYF8aBzVsz5wC+BzerSZYV1v3pg6qi2PQef/3C/8Wl8FSBTdwI9eKGhwHuzQAFFjUdtP7hmc3N
tWEcBFH0y/dEN7YludIhYOYRhQUQkVAiB7RRonuhMOqXWmHKvtzCSXJfS9s+8uiODBZfgi7BOWFM
9hrYwI/hCW0q8h8LhrCcSZ64HGZ9lDlPCSIYz+n7brzbDhfchQLeiiAPWrsGwzq5aA+A9PTIMkqs
i/ThgGxsJoYIecnm42QQKyu74f+K3qcpY+lzwIYkEZKH9sACd484SVsxXA6KfPc2mw0D8bvDDdMC
h9ukdAuJ0BctbZDRO7tWCVVDPCWjOTrYjY3bJ0WlHHynfN1/JiTECuHV1AwRbbOFQhO9yngPh64E
VsePETDwWtl69ZkMEAFkACUTDRcqxrs7PIQavW2UygFzon/dIB7nfyH1bVM1wQmP7PxfhfxubP6b
pkY7kzluTWDB1bHY4XTRyN9Iy4mJ8vl4JP2jaq05kbsEUD7Kxi6wlRYvSU1MO4fe5bZdQBiJAHV1
eplhn3A07nVJdFeL69JdFtCea/U6pvhg3L83sXVnBcBizQws9YHEA9XFAzFV9wuvdJtFtlSdh4lS
Wz+jkWI6GNg/q9jI4Y+PR/kqGgPMvDB1NPtdwZIeQkmO1L9sy9ir8ayRaAB+WyHvmLEjXt7HbCOO
ta7auJ1rC00hjF6par1fMJm3Ra5Sr0fIdJ9LbdaOQh9r1LnZ1P40VMASKugqOuXwqKeMJhgQiOPb
+vGzh6fo2tFpor4GVUw2LgDCTQTdCyahNgTxrJpig6jyevuBXvAAvrARRX0Spe/P5tSnv1yajxjU
SHzz6Ku+jpSHiznBdDPCEXp3DaXd3b/ryJC1EsBLVmSAGTqo/3EJNoZ9J73IdUryKBXx7o1Tt1QV
76HicmmSmTMYpfv7juPwqlo/FlRB0jtSlQAbCfz4TInli53RrSg4D8LKjKheGTP1pNuFpAUwbsya
4kf/fY4d+x1r8n1sQ5RxQhoG9v6p3keH4FCk2/3lvqUIe3mfbOIC1W8sYDjrzKJTVBWqh4BGIfWx
lCkqAnIh60W49680mYFhyFW5t4GmqUXFdAYrWau0764gSKi11c5nTO2BzymX0lzga0bMLefIEWNx
KyNjXDueOYFBhjDgNnh0dftQvQ2+TD0pMDt2V/DD8wTB5WhBnLUdI3bFpwCAAmddVj+Dqr4Gne3x
k+Q6yQ+tCYcqmt/VJGZNEkxVoUlKB5U+UYHcuSIvl5hS1yHNj/+uF6CosWVl/htZHvoqIrZ6Q2Dl
LE4qaSmPk0j78m1RPf7Rhss4JFdNrXdVfSbWFJWJUzdf1ZOYQIK8b5okcv4oK4vgsBfl828j+lgQ
KC2xSvf/pXCqdjrGjXnzx1pfsstK5tzbivQBxyPCaxlaNYxe6jlzi50ccGVl+edfp48iVo0AOD3k
2v375pqgYQL+33se2HHD2M0vfgghmsqqj0tk8zI1RFEYCbVFtkgzGNYBL7mlim525HHc4dQOMiBt
TTbxG5lprLtheL8BtzFwHHdqowt5x8iePVROkBRzFAvyejzr2TGBMt2lSBSnOItxlQwKod1CIneN
Em7EcVI2zbeWltB5J0DZINnJ4I7d/5q4WTUqSbplBtTgKcYZSSLYwYaxtNgOUSCpSNGqNibEwron
4RC744k43qpxWb52xwmijpwtbp0leEL7cZN0L+TDYJSewjdphzWTvnUnfhtOunFEHBMyNhjero5k
dGLC/6p8nQ0hqtBPM1ynxC/B36nKR9lF96NZXSJ7yeOoWYi+OMT6A/p7670OsO6xyN5m+jzibJT4
4r47Bnfs9mPs2MZLiSCCpYAgZgiBJzCeIl7O/CdF8xdiE9uGt59qYrMdohhgULFYXkWkPIHvOhwt
fSQPw7nhQkNaq/HUbuZ+0caMQC5JUhoiierNK/wMxcwlpECwjVD+UmFzleQXH29RAjBh61Ss6PlO
7bdlnCEk7oGdXTe+6jLBe3sXt5FN/+LmKJ8oJzvgSR9MXtNMgz/wS4uRO8xAs0uNUFtPUlkGDbjZ
vz+3jt8ltmeimIyUcXrn7tU1aQ45xu/RfbOSxQzLmepOipDu7xF6J+2AN5az4loBSNP27Fd2SEoO
RWATkFuCY39Xwdwx7ewwslLBbjAOGbNYo3T3YYIjs4Udjbl/cB3g+3eZIK3Lz+nqOjju6Q2l6noz
Uys8GUim4vM6noAmJLsdJlmQGgqmYw6eCQszQe/w9kQs+02Ja5eSzWGrpFx5PyyCn2f89x4y1D7K
uC+6jqTt6tQbkFiwkqgORNJG3jQlX/h4VKKebsT+wHOC0+SJ0WIrA9vXmaRw24JLZlGk63sNg0Te
Yxq2y9OrgMqEgVW59rpy0PJXYbXQ1fQLzHrR6IpA15lTemgp+wa29kNLzHyncCF0JFAfdEKFP97U
JDQ9VdPDK2KriTfYcsMLFeTb5lJe6lz2H8O3U0PdbzI5ItXogUgaZjYzEeqj1henwFG3e4SQAxwg
KnNkqhuK1Fftg+01DuJHnWwuAoBBV9oGuFoJE5pGl8DOEA5QORfkpXC8PDBPQqEq0cwadz5DpHKp
3v7h5BRL+8VCFDUPfGu9ROQZYTSsGOIJLuje/jxiGei0+qzE4vWV8d58/Pex+5kiGGZNgn8M5UP4
HQWop7Xkh9twWuuvEPBTxenXkxDHvPkucIKmkvnG7NYW+8g9rmVkRxTch2ydExZMfrzPhrFUd7dN
kYqcq+EOd9Nqpk9ZqNBBNGoQ0KoUvuk0JWwR6oFSkQ3m80zDckYsZLBvj/1wnxJYax5Tp0MpM04c
ROnjcY7DjqQ7mBtqukwwzUSD+mC4wdtVwufH/Yp7WppuC1Bj08nY5Va72yhCfJk1fLkQfZWGTes0
+XXMLAEiujFji2Rccat1sLMSeo7j4wQspb8H2uuDaUezxrbi11XtEOJoFLXPqUz0xgjJuZ1cOcPm
VlzA+LWLJQXwEMmz8mqEET43BMxxn0Wxz4bnpHfyHZFXH3/22RCVX/EnLMnQaJZOHSS3jErwqe09
wlbY12bRy74WZTDsJQN3W7WIZGKEUcdF3RwagwdDPI11H8wSgouIs7upwTs8RREOf5VTEvIH6Pf4
N82mvN2gct7cb6mfC77NqNnIjelNANzaEvcsxrOSiZl+G2DXbrkAQNX7HtDEWbkLWvfZYU6t2rpc
liCn14YgLuL7xxF+47YqHEs5yXV05FRyp8xLqzZFD3XhLkvoQb6i0X+7bvZsMT6PRlpL0zfyCk0b
KeCPI0UHDsf/yU1rLQrqGS17YtRidj3WaojWijsUWXWp3K5ywiZ9z+OQFbTbecrdUSNezXa5tTUm
6plAvX7crCucsyQ1iFbqhXZ4P/GBUdujuF6ChnvWCU3xIpOPvjCXfjILc6X95EGexDbE44b7upzJ
2jCpPHq1hGFJ6jQRIRwIV6vmtufcHUjBoBU62QTbj8lwNdC+0fGJuX57GIR2i9lxMGhbPqpm1Hdf
YeaELwazdz4xnnWJnXS0NC1Nx2xer9f3QG4Yj2GOy7rLZFoylFgQnuv/E7FAQ9kYbXpvZkd8cNux
B/VsC5y51ggcK5k/Z8tldG40VW7gSPQlBsKj5cFoh0NsFJD+7BoBJ58ijsHhv/NhVNb/uit8upXm
6OkY+s+tCpNKeWi1X8DdnrlRDbXJbYZBBzyRgNwAvkMs1vbn9XXav7Rr/Mf1P0sTLsFAnr31BOoW
SjDQpkcJl2Q6BtMNfmECldhmJWSfweiymgb3FnFZZMqyDLd0moVeeKLj1aTkE4wEdc7tYuPBmj1X
TyEMIH/dZesWFEeejVKSmICVUNCTsYj7Uzc47O7v/o9mEW3E61F+/KmdwPz8zUyHKspchS3GhWrf
SZir74hMZwPrkKs26CqCRMUQoT5qeQLfIcOZKdt+JQ1OftyQ2Ggtkh7pGm3FY9XveQnnzZyul8X2
IUnBt5Bykqz+4RcGAsdAKgi9csuZF0YpXm2CICdg9NfhEQMvF6AZtT5OxBn9Ql+XeXJX/sLEljNm
85BF1ntibJpUFZ7XowiPbPmu6zFIvn0Z5uMgAiNwbszNKBzIwERO+Vnr71BxT0wKY1Ta2npG9jz2
UKi4stL3TK+Q1/sBtKKhvnT/M0usFPGrdymyYkqMEBN5iYG+LPuWmJv50doyjF9Q9IFVZ55C4fxn
hkGlyAg8Zw6KQSUsmv4Hc+f8xi+6klZPtfluCj2mX4P2ZyDp5D4VMSQOpVjllYkUOTTjdq6RuTkv
Y8nWbFVeVteF2l2C2Z9RXwQmKk5uF4M2jFDfbaM0rWIhb0kZnFMMOyMuMXrMj6arWM0BeEq9f8Vi
UVUC9pVqpVNsNdJ7U9/lt2C74h8MjkeKJi0PUpwDyPlHZ64GTzVaF3PWp/Xg0GP0nA61hB9Bfcab
HC7DRCzJJ0tt5ar33m+hq0aqvheU61H99cy3uwc6ImHUeROhn+Byn6x4fUNvmIfCuqc8lstYmKRH
t91Iye0xu2ZHTeNLdawvV9xnpqeRjNxi5lXPybHAshiLpHBzylyyIxEPdA/H4CCZVaK09rXO8IEQ
UP3zlKw4fbFKbiBw5stLvxb1Bxc3zMBme64K+WYkUNmI04fZiki6XAMQgaCcgAFjVBSKgLCuOLaT
kGxt8gmJLtqDrxctAH8bzMph8aWP05NoCRKXgAaa9u9gsIkydpw5B7wfEICqDx+fe1zPoDYfQ1c=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
