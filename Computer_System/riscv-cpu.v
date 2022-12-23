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
    input reset,
    input clk,
    input [31:0] NextPC,
    output reg [31:0] PC
);

initial begin PC = 32'h00000000; end

always @(negedge clk) begin 
    //$display("pc = 0x%h", PC);
    if (reset) begin PC <= 32'h00000000; end
    else begin PC <= NextPC; end 
end // '<=' or '=' ?
endmodule

module rv32is(
    input clock,
    input reset,
    output [31:0] imemaddr,
    input  [31:0] imemdataout,
    output        imemclk,
    output [31:0] dmemaddr,
    input  [31:0] dmemdataout,
    output [31:0] dmemdatain,
    output        dmemrdclk,
    output        dmemwrclk,
    output [2:0]  dmemop,
    output        dmemwe,
    output [31:0] dbgdata,
    output [31:0] reg10
    
    /*
    output [31:0] dbgresult,
    output [31:0] dpc,
    output [31:0] dnextpc,
    
    output [31:0] PCA,
    output [31:0] PCB,
    output [31:0] PCASRC,
    output [31:0] PCBSRC,
    
    output [31:0] x1,
    output [31:0] x2,
    output [31:0] x3,
    output [31:0] x4,
    
    output [31:0] imem0,
    output [31:0] imem1,
    output [31:0] imem2,
    
    output [31:0] dmem0,
    output [31:0] dmem1,
    output [31:0] dmem2
    */
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
wire [2:0]  MemOp;
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

assign clk = clock; // single step. to be mmodified in real application.
assign rdclk = clk;
assign wrclk = ~clk;

initial
begin
    CLK50MHZ = 1'b0; CLK25MHZ = 1'b0;
end

always @(posedge    clock) begin CLK50MHZ = ~CLK50MHZ; end
always @(posedge CLK50MHZ) begin CLK25MHZ = ~CLK25MHZ; end
/*
dmem instructions(.addr(PC),.dataout(Instr),.datain(32'h0),.rdclk(rdclk),.wrclk(1'b0),.memop(3'b010),.we(1'b0)
              ,.m0(imem0),.m1(imem1),.m2(imem2)
              );
*/
assign imemaddr = PC;
assign Instr = imemdataout;
assign imemclk = rdclk;

d_reg32file myregfile(.busa(rs1),.busb(rs2),.busw(busW),.ra(Instr[19:15]),.rb(Instr[24:20]),.rw(Instr[11:7]),.clk(wrclk),.we(RegWr)
                      ,.a0(reg10)
                      );
InstrToImm InToTmm(.instr(Instr),.ExtOp(ExtOp),.imm(imm));
ContrGen CGen(.instr(Instr),.ExtOp(ExtOp),.RegWr(RegWr),.ALUAsrc(ALUAsrc),.ALUBsrc(ALUBsrc),.ALUctr(ALUctr),.Branch(Branch),.MemtoReg(MemtoReg),.MemWr(MemWr),.MemOp(MemOp));
PCreg PCR(.reset(reset),.clk(clk),.NextPC(NextPC),.PC(PC));

wire [31:0] PCadderA;
wire [31:0] PCadderB;
assign PCadderA = PCAsrc ? imm : 32'h00000004;
assign PCadderB = PCBsrc ? rs1 : PC;
//Adder32 PCAdder(.f(NextPC),.OF(),.SF(),.ZF(),.CF(),.cout(),.x(PCadderA),.y(PCadderB),.sub(1'b0),.cin(1'b0));
SimplifiedAdder PCAdder(.A(PCadderA),.B(PCadderB),.SUBctr(1'b0),.F(NextPC),.uless(),.sless(),.zero());

wire [31:0] ALUA;
wire [31:0] ALUB;
assign ALUA = ALUAsrc ? PC : rs1;
assign ALUB = ALUBsrc == 2'b00 ? rs2 : ALUBsrc == 2'b01 ? imm : 32'h00000004;
ALU myALU(.dataa(ALUA),.datab(ALUB),.aluctr(ALUctr),.less(Less),.zero(Zero),.result(Result));

BranchCond BrCond(.Branch(Branch),.Less(Less),.Zero(Zero),.PCAsrc(PCAsrc),.PCBsrc(PCBsrc));

wire [31:0] DataOut;
//dmem datamem(.addr(Result),.dataout(DataOut),.datain(rs2),.rdclk(clk),.wrclk(~clk),.memop(MemOp),.we(MemWr)
          //,.m0(dmem0),.m1(dmem1),.m2(dmem2)
//           );
assign busW = MemtoReg ? DataOut : Result;

assign dmemaddr = Result;
assign DataOut = dmemdataout;
assign dmemdatain = rs2;
assign dmemrdclk = clk;
assign dmemwrclk = ~clk;
assign dmemop = MemOp;
assign dmemwe = MemWr;
assign dbgdata = imm; //{Instr[31:4], 1'b0, clk, rdclk, wrclk};
/*
assign dpc = PC;
assign dnextpc = NextPC;
assign PCA = ALUA;
assign PCB = ALUB;
assign PCASRC = ALUAsrc;
assign PCBSRC = ALUBsrc; // mixed use
assign dbgresult = Result;
*/
endmodule
