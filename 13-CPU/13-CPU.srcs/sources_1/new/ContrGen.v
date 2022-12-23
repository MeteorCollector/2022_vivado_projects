`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 20:15:16
// Design Name: 
// Module Name: ContrGen
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


module ContrGen(
    input [31:0] instr,
    output reg [2:0] ExtOp,
    output reg       RegWr,
    output reg       ALUAsrc,
    output reg [1:0] ALUBsrc,
    output reg [3:0] ALUctr,
    output reg [2:0] Branch,
    output reg       MemtoReg,
    output reg       MemWr,
    output reg [2:0] MemOp
    );
    
    wire [6:0] op;
    wire [2:0] func3;
    wire [6:0] func7;
    
    /* these wires are just for debug */
    wire [4:0] ra;
    wire [4:0] rb;
    wire [4:0] rw;
    assign ra = instr[19:15];
    assign rb = instr[24:20];
    assign rw = instr[11:7];
    /* end here */
    
    assign op    = instr[6:0];
    assign func3 = instr[14:12];
    assign func7 = instr[31:25];
    assign s7 = func7[5];
    
    always @(*)
    begin
        case (op[6:2])
            5'b01101: begin ExtOp = 3'b001; RegWr = 1'b1; Branch = 3'b000; MemtoReg = 1'b0; MemWr = 1'b0;                 ALUBsrc = 2'b01; ALUctr = 4'b1111; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, lui", instr, ra, rb, rw); end // lui
            5'b00101: begin ExtOp = 3'b001; RegWr = 1'b1; Branch = 3'b000; MemtoReg = 1'b0; MemWr = 1'b0; ALUAsrc = 1'b1; ALUBsrc = 2'b01; ALUctr = 4'b0000; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, auipc", instr, ra, rb, rw); end // auipc
            5'b00100: 
            begin 
                ExtOp = 3'b000; RegWr = 1'b1; Branch = 3'b000; MemtoReg = 1'b0; MemWr = 1'b0; ALUAsrc = 1'b0; ALUBsrc = 2'b01;
                case (func3)
                    3'b000:       begin ALUctr = 4'b0000; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, addi", instr, ra, rb, rw); end // addi
                    3'b010:       begin ALUctr = 4'b0010; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, slti", instr, ra, rb, rw); end // slti
                    3'b011:       begin ALUctr = 4'b0011; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, sltiu", instr, ra, rb, rw); end // sltiu
                    3'b100:       begin ALUctr = 4'b0100; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, xori", instr, ra, rb, rw); end // xori
                    3'b110:       begin ALUctr = 4'b0110; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, ori", instr, ra, rb, rw); end // ori
                    3'b111:       begin ALUctr = 4'b0111; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, andi", instr, ra, rb, rw); end // andi
                    3'b001:       begin 
                        case (s7)
                            1'b0: begin ALUctr = 4'b0001; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, slli", instr, ra, rb, rw); end // slli
                        endcase
                    end
                    3'b101: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0101; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, srli", instr, ra, rb, rw); end // srli
                            1'b1: begin ALUctr = 4'b1101; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, srai", instr, ra, rb, rw); end // srai
                        endcase
                    end
                endcase
            end
            5'b01100: 
            begin
                                RegWr = 1'b1; Branch = 3'b000; MemtoReg = 1'b0; MemWr = 1'b0; ALUAsrc = 1'b0; ALUBsrc = 2'b00; 
                case (func3)
                    3'b000: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0000; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, add", instr, ra, rb, rw); end // add
                            1'b1: begin ALUctr = 4'b1000; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, sub", instr, ra, rb, rw); end // sub
                        endcase
                    end
                    3'b001: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0001; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, sll", instr, ra, rb, rw); end // sll
                            //1'b1: begin end
                        endcase
                    end
                    3'b010: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0010; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, slt", instr, ra, rb, rw); end // slt
                            //1'b1: begin end
                        endcase
                    end
                    3'b011: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0011; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, sltu", instr, ra, rb, rw); end // sltu
                            //1'b1: begin end
                        endcase
                    end
                    3'b100: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0100; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, xor", instr, ra, rb, rw); end // xor
                            //1'b1: begin end
                        endcase
                    end
                    3'b101: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0101; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, srl", instr, ra, rb, rw); end // srl
                            1'b1: begin ALUctr = 4'b1101; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, sra", instr, ra, rb, rw); end // sra
                        endcase
                    end
                    3'b110: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0110; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, or", instr, ra, rb, rw); end // or
                            //1'b1: begin end
                        endcase
                    end
                    3'b111: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0111; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, and", instr, ra, rb, rw); end // and
                            //1'b1: begin end
                        endcase
                    end
                endcase   
            end
            
            5'b11011:       begin ExtOp = 3'b100; RegWr = 1'b1; Branch = 3'b001; MemtoReg = 1'b0; MemWr = 1'b0; ALUAsrc = 1'b1; ALUBsrc = 2'b10; ALUctr = 4'b0000; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, jal", instr, ra, rb, rw); end // jal
            5'b11001: begin
                case (func3)
                    3'b000: begin ExtOp = 3'b000; RegWr = 1'b1; Branch = 3'b010; MemtoReg = 1'b0; MemWr = 1'b0; ALUAsrc = 1'b1; ALUBsrc = 2'b10; ALUctr = 4'b0000; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, jalr", instr, ra, rb, rw); end // jalr
                endcase
            end
            5'b11000: begin
                ExtOp = 3'b011; RegWr = 1'b0;                                   MemWr = 1'b0; ALUAsrc = 1'b0; ALUBsrc = 2'b00;
                case (func3)
                    3'b000: begin Branch = 3'b100; ALUctr = 4'b0010; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, beq", instr, ra, rb, rw); end // beq
                    3'b001: begin Branch = 3'b101; ALUctr = 4'b0010; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, bne", instr, ra, rb, rw); end // bne
                    3'b100: begin Branch = 3'b110; ALUctr = 4'b0010; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, blt", instr, ra, rb, rw); end // blt
                    3'b101: begin Branch = 3'b111; ALUctr = 4'b0010; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, beg", instr, ra, rb, rw); end // beg
                    3'b110: begin Branch = 3'b110; ALUctr = 4'b0011; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, bltu", instr, ra, rb, rw); end // bltu
                    3'b111: begin Branch = 3'b111; ALUctr = 4'b0011; end //$display("instr = %h, ra = %h, rb = %h, rw = %h, bgeu", instr, ra, rb, rw); end // bgeu
                endcase
            end
            
            5'b00000: begin
                ExtOp = 3'b000; RegWr = 1'b1; Branch = 3'b000; MemtoReg = 1'b1; MemWr = 1'b0; ALUAsrc = 1'b0; ALUBsrc = 2'b01; ALUctr = 4'b0000; 
                case (func3)
                    3'b000: begin  MemOp = 3'b000; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, lb", instr, ra, rb, rw); end // lb
                    3'b001: begin  MemOp = 3'b001; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, lh", instr, ra, rb, rw); end // lh
                    3'b010: begin  MemOp = 3'b010; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, lw", instr, ra, rb, rw); end // lw
                    3'b100: begin  MemOp = 3'b100; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, lbu", instr, ra, rb, rw); end // lbu
                    3'b101: begin  MemOp = 3'b101; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, lhu", instr, ra, rb, rw); end // lhu
                endcase
            end
            5'b01000: begin
                ExtOp = 3'b010; RegWr = 1'b0; Branch = 3'b000;                  MemWr = 1'b1; ALUAsrc = 1'b0; ALUBsrc = 2'b01; ALUctr = 4'b0000; 
                case (func3)
                    3'b000: begin  MemOp = 3'b000; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, sb", instr, ra, rb, rw); end // sb
                    3'b001: begin  MemOp = 3'b001; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, sh", instr, ra, rb, rw); end // sh
                    3'b010: begin  MemOp = 3'b010; end // $display("instr = %h, ra = %h, rb = %h, rw = %h, sw", instr, ra, rb, rw); end // sw
                endcase
            end
        endcase
    end
endmodule
