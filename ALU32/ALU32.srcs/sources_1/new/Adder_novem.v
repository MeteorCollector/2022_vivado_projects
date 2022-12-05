`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/29 10:51:18
// Design Name: 
// Module Name: Adder32_new
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


module FA_1(
    input a,
    input b,
    input cin,
    output f,
    output cout
);
  assign f = a ^ b ^ cin;
  assign cout = (a ^ b) & cin | a & b;
endmodule

module CLA_4(
              input p1,  input p2,  input p3,  input p4,
              input g1,  input g2,  input g3,  input g4,
    input c0, output c1, output c2, output c3, output c4
);
     assign c1 = g1 ^ (p1 & c0),
            c2 = g2 ^ (p2 & g1) ^ (p2 & p1 & c0),
            c3 = g3 ^ (p3 & g2) ^ (p3 & p2 & g1) ^ (p3 & p2 & p1 & c0),
            c4 = g4 ^ (p4 & g3) ^ (p4 & p3 & g2) ^ (p4 & p3 & p2 & g1) ^ (p4 & p3 & p2 & p1 & c0);
endmodule

/* 4 digits */
module ADDER_4(
      input [4:1] x,
      input [4:1] y,
      input c0,
      output c4, c3, Gg, Pg,
      output [4:1] F
);
      wire p1, p2, p3, p4, g1, g2, g3, g4;
      wire c1, c2;
      FA_1 adder1(.a(x[1]), .b(y[1]), .cin(c0), .f(F[1]), .cout());
      FA_1 adder2(.a(x[2]), .b(y[2]), .cin(c0), .f(F[2]), .cout());
      FA_1 adder3(.a(x[3]), .b(y[3]), .cin(c0), .f(F[3]), .cout());
      FA_1 adder4(.a(x[4]), .b(y[4]), .cin(c0), .f(F[4]), .cout());
      CLA_4 cla(.p1(p1), .p2(p2), .p3(p3), .p4(p4), .g1(g1), .g2(g2), .g3(g3), .g4(g4), .c0(c0), .c1(c1), .c2(c2), .c3(c3), .c4(c4));

  assign p1 = x[1] ^ y[1];
  assign p2 = x[2] ^ y[2];
  assign p3 = x[3] ^ y[3];
  assign p4 = x[4] ^ y[4];
  assign g1 = x[1] & y[1];
  assign g2 = x[2] & y[2];
  assign g3 = x[3] & y[3];
  assign g4 = x[4] & y[4];

  assign Pg = p1 & p2 & p3 & p4, // between groups
         Gg = g4 ^ (p4 & g3) ^ (p4 & p3 & g2) ^ (p4 & p3 & p2 & g1);
endmodule


module CLA_16(
    input [16:1] A,
    input [16:1] B,
    input c0,
    output gx, px, c15,
    output [16:1] F
    );
    
    wire c4, c8, c12;
    wire Pg1, Gg1, Pg2, Gg2, Pg3, Gg3, Pg4, Gg4;

    ADDER_4 adder1(.x(A[4:1]), .y(B[4:1]), .c0(c0), .c4(), .c3(), .F(F[4:1]), .Gg(Gg1), .Pg(Pg1));
    ADDER_4 adder2(.x(A[8:5]), .y(B[8:5]), .c0(c4), .c4(), .c3(), .F(F[8:5]), .Gg(Gg2), .Pg(Pg2));
    ADDER_4 adder3(.x(A[12:9]), .y(B[12:9]), .c0(c8), .c4(), .c3(), .F(F[12:9]), .Gg(Gg3), .Pg(Pg3));
    ADDER_4 adder4(.x(A[16:13]), .y(B[16:13]), .c0(c12), .c4(), .c3(c15), .F(F[16:13]), .Gg(Gg4), .Pg(Pg4));

    assign c4 = Gg1 ^ (Pg1 & c0);
    assign c8 = Gg2 ^ (Pg2 & Gg1) ^ (Pg2 & Pg1 & c0);
    assign c12 = Gg3 ^ (Pg3 & Gg2) ^ (Pg3 & Pg2 & Gg1) ^ (Pg3 & Pg2 & Pg1 & c0);
    assign px = Pg1 & Pg2 & Pg3 & Pg4;
    assign gx = Gg4 ^ (Pg4 & Gg3) ^ (Pg4 & Pg3 & Gg2) ^ (Pg4 & Pg3 & Pg2 & Gg1);
endmodule

module ADDER_32(
    output [32:1] f,
    output OF, SF, ZF, CF,
    output cout,
    input [32:1] x,
    input [32:1] y,
    input sub
);

    wire [32:1] A;
    wire [32:1] B;
    assign A = x;
    assign B = sub ? y ^ 32'h00000000 : y;
    
    wire px1, gx1, px2, gx2;
    wire c16, c31;

    CLA_16 CLA1(.A(A[16:1]), .B(B[16:1]), .c0(sub), .F(f[16:1]), .px(px1), .c15(), .gx(gx1));
    CLA_16 CLA2(.A(A[32:17]), .B(B[32:17]), .c0(c16), .F(f[32:17]), .px(px2), .c15(c31), .gx(gx2));
    
    assign c16 = gx1 ^ (px1 && sub);
    assign cout = gx2 ^ (px2 && c16);

    assign OF = cout ^ c31;
    assign SF = f[32];
    assign ZF = f == 32'h00000000;
    assign CF = cout ^ sub;
endmodule