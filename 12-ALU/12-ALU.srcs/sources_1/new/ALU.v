`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/28 21:52:57
// Design Name: 
// Module Name: ALU
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
module SimplifiedAdder(
    input [31:0] A,
    input [31:0] B,
    input SUBctr,
    output [31:0] F,
    output uless,
    output sless,
    output zero
);
    wire [32:0] realB;
    wire cout, OF;
    assign realB = {1'b0, {32{SUBctr}} ^ B};
    assign {cout, F} = realB + A + SUBctr;
    assign OF = (A[31] == realB[31]) & (F[31] ^ A[31]);
    assign uless = SUBctr ^ cout;
    assign sless = OF ^ F[31];
    assign zero = (F == 32'h0);
endmodule

/*
module ALU (
input [31:0] dataa,
input [31:0] datab,
input [3:0] aluctr,
output reg less,
output reg zero,
output reg [31:0] result
);

reg mux2;
wire [31:0] Add_Result;
wire Add_Carry;
wire Add_Overflow;
wire Add_Sign;
wire Zero;

wire [31:0] Dout;

reg SUBctr;
reg SFTctr;
reg ALctr;
reg [2:0] OPctr;
reg SIGctr;

wire [31:0] ADD_a;
wire [31:0] ADD_b;

always @(*)
begin
    case(aluctr)
        4'b0000: begin SUBctr = 1'b0;                                             OPctr = 3'b000; end
        4'b0001: begin                               ALctr = 1'b0; SFTctr = 1'b0; OPctr = 3'b100; end
        4'b0010: begin SUBctr = 1'b1; SIGctr = 1'b1;                              OPctr = 3'b110; end
        4'b0011: begin SUBctr = 1'b1; SIGctr = 1'b0;                              OPctr = 3'b110; end
        4'b0100: begin                                                            OPctr = 3'b011; end
        4'b0101: begin                               ALctr = 1'b0; SFTctr = 1'b1; OPctr = 3'b100; end
        4'b0110: begin                                                            OPctr = 3'b010; end
        4'b0111: begin                                                            OPctr = 3'b001; end
        4'b1000: begin SUBctr = 1'b1;                                             OPctr = 3'b000; end
        4'b1101: begin                               ALctr = 1'b1; SFTctr = 1'b1; OPctr = 3'b100; end
        4'b1111: begin                                                            OPctr = 3'b101; end
        default: begin end
    endcase
    
    case(SIGctr)
        1'b0: begin mux2 = Add_Carry; end
        1'b1: begin mux2 = Add_Overflow ^ Add_Sign; end
    endcase
    
    case(OPctr)
        3'b000: begin result = Add_Result; end
        3'b001: begin result = dataa | datab; end
        3'b010: begin result = dataa & datab; end
        3'b011: begin result = dataa ^ datab; end
        3'b100: begin result = Dout; end
        3'b101: begin result = datab; end
        3'b110: begin result = {28'h0000000, 3'b000, mux2}; end
        3'b111: begin result = 32'h00000000; end
    endcase
    
    zero = Zero;
    less = mux2;
end

Adder32 my_adder(Add_Result, Add_Overflow, Add_Sign, Zero, Add_Carry, cout, dataa, datab, SUBctr, 1'b0);
assign ADD_a = dataa;
assign ADD_b = SUBctr ? datab ^ 32'h00000000 : datab;
//ADDER_32 my_adder(.A(ADD_a), .B(ADD_b), .cin(SUBctr), .F(Add_Result), .OF(Add_Overflow), .SF(Add_Sign), .ZF(Zero), .CF(Add_Carry), .cout());

barrelsft32 my_barrel(Dout, dataa, datab[4:0], ~SFTctr, ALctr);

endmodule
*/

module ALU (
input [31:0] dataa,
input [31:0] datab,
input [3:0] aluctr,
output reg less,
output reg zero,
output reg [31:0] result
);

reg mux2;
wire [31:0] Add_Result;
wire Add_Carry;
wire Add_Overflow;
wire Add_Sign;
wire Zero;
wire uless;
wire sless;

wire [31:0] Dout;

reg SUBctr;
reg SFTctr;
reg ALctr;
reg [2:0] OPctr;
reg SIGctr;

wire [31:0] ADD_a;
wire [31:0] ADD_b;

always @(*)
begin
    case(aluctr)
        4'b0000: begin SUBctr = 1'b0;                                             OPctr = 3'b000; end
        4'b0001: begin                               ALctr = 1'b0; SFTctr = 1'b0; OPctr = 3'b100; end
        4'b0010: begin SUBctr = 1'b1; SIGctr = 1'b1;                              OPctr = 3'b110; end
        4'b0011: begin SUBctr = 1'b1; SIGctr = 1'b0;                              OPctr = 3'b110; end
        4'b0100: begin                                                            OPctr = 3'b011; end
        4'b0101: begin                               ALctr = 1'b0; SFTctr = 1'b1; OPctr = 3'b100; end
        4'b0110: begin                                                            OPctr = 3'b010; end
        4'b0111: begin                                                            OPctr = 3'b001; end
        4'b1000: begin SUBctr = 1'b1;                                             OPctr = 3'b000; end
        4'b1101: begin                               ALctr = 1'b1; SFTctr = 1'b1; OPctr = 3'b100; end
        4'b1111: begin                                                            OPctr = 3'b101; end
        default: begin end
    endcase
    
    case(SIGctr)
        1'b0: begin mux2 = uless; end
        1'b1: begin mux2 = sless; end
    endcase
    
    case(OPctr)
        3'b000: begin result = Add_Result; end
        3'b001: begin result = dataa | datab; end
        3'b010: begin result = dataa & datab; end
        3'b011: begin result = dataa ^ datab; end
        3'b100: begin result = Dout; end
        3'b101: begin result = datab; end
        3'b110: begin result = {28'h0000000, 3'b000, mux2}; end
        3'b111: begin result = 32'h00000000; end
    endcase
    
    zero = Zero;
    less = mux2;
end

SimplifiedAdder my_adder(dataa, datab, SUBctr, Add_Result, uless, sless, Zero);
assign ADD_a = dataa;
assign ADD_b = datab; //SUBctr ? datab ^ 32'h00000000 : datab;
//ADDER_32 my_adder(.A(ADD_a), .B(ADD_b), .cin(SUBctr), .F(Add_Result), .OF(Add_Overflow), .SF(Add_Sign), .ZF(Zero), .CF(Add_Carry), .cout());

barrelsft32 my_barrel(Dout, dataa, datab[4:0], ~SFTctr, ALctr);

endmodule