`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 18:46:39
// Design Name: 
// Module Name: riscv-cpu
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
module PCreg(
    input clk,
    input [31:0] NextPC,
    output reg [31:0] PC
);

always @(posedge clk) begin PC <= NextPC; end // '<=' or '=' ?
endmodule

module CPU(
    input CLK100MHZ
    );

integer tick;
reg CLK50MHZ;
reg CLK25MHZ;
wire clk;
wire rdclk;
wire wrclk;

wire [31:0] Instr;
wire [2:0]  ExtOp;
wire        RegWr;
wire        ALUAsrc;
wire [1:0]  ALUBsrc;
wire [3:0]  ALUctr;
wire [2:0]  Branch;
wire        MemtoReg;
wire        MemWr;
wire        MemOp;
wire        PCAsrc;
wire        PCBsrc;

wire [31:0] rs1;
wire [31:0] rs2;
wire [31:0] busW;
wire [31:0] imm;

wire [31:0] PC;
wire [31:0] NextPC;

wire        Less;
wire        Zero;
wire [31:0] Result;

assign clk = CLK100MHZ; // single step. to be mmodified in real application.
assign rdclk = clk;
assign wrclk = ~clk;

initial
begin
    CLK50MHZ = 1'b0; CLK25MHZ = 1'b0;
end

always @(posedge CLK100MHZ) begin CLK50MHZ = ~CLK50MHZ; end
always @(posedge  CLK50MHZ) begin CLK25MHZ = ~CLK25MHZ; end

dmem InstrMem(.addr(NextPC),.dataout(Instr),.datain(),.rdclk(rdclk),.wrclk(),.memop(3'b010),.we(1'b0));
d_reg32file RegFile(.busa(rs1),.busb(rs2),.busw(busW),.ra(Instr[19:15]),.rb(Instr[24:20]),.rw(Instr[11:7]),.clk(wrclk),.we(RegWr));
InstrToImm(.instr(Instr),.ExtOp(ExtOp),.imm(imm));
ContrGen(.instr(instr),.ExtOp(ExtOp),.RegWr(RegWr),.ALUAsrc(ALUAsrc),.ALUBsrc(ALUBsrc),.ALUctr(ALUctr),.Branch(Branch),.MemtoReg(MemtoReg),.MemWr(MemWr),.MemOp(MemOp));
PCreg(.clk(clk),.NextPC(NextPC),.PC(PC));

wire [31:0] PCadderA;
wire [31:0] PCadderB;
assign PCadderA = PCAsrc ? imm : 32'h00000004;
assign PCadderB = PCBsrc ? PC  : rs1;
Adder32 PCAdder(.f(NextPC),.OF(),.SF(),.ZF(),.CF(),.cout(),.x(PCadderA),.y(PCadderB),.sub(1'b0),.cin(1'b0));

wire [31:0] ALUA;
wire [31:0] ALUB;
assign ALUA = ALUAsrc ? rs1 : PC;
assign ALUB = ALUBsrc == 4'b0000 ? rs2 : ALUBsrc == 4'b0001 ? imm : 32'h00000004;
ALU myALU(.dataa(ALUA),.datab(ALUB),.aluctr(ALUctr),.less(Less),.zero(Zero),.result(Result));

BranchCond BrCond(.Branch(Branch),.Less(Less),.Zero(Zero),.PCAsrc(PCAsrc),.PCBsrc(PCBsrc));

wire [31:0] DataOut;
dmem DataMem(.addr(Result),.dataout(DataOut),.datain(rs2),.rdclk(clk),.wrclk(~clk),.memop(MemOp),.we(MemWr));
assign busW = MemtoReg ? DataOut : Result;

endmodule
