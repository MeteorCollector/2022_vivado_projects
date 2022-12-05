// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Nov 10 20:47:14 2022
// Host        : MSI running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Projects/Vivado_Projects/10-2-vgachar/10-2-vgachar.gen/sources_1/ip/char_buf/char_buf_sim_netlist.v
// Design      : char_buf
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "char_buf,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module char_buf
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [12:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [12:0]addra;
  wire clka;
  wire [7:0]dina;
  wire [7:0]douta;
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
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
  wire [12:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [12:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "13" *) 
  (* C_ADDRB_WIDTH = "13" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.535699 mW" *) 
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
  (* C_INIT_FILE = "char_buf.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "8192" *) 
  (* C_READ_DEPTH_B = "8192" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
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
  (* C_WRITE_DEPTH_A = "8192" *) 
  (* C_WRITE_DEPTH_B = "8192" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  char_buf_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[12:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[12:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48480)
`pragma protect data_block
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
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
