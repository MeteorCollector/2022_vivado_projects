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
    
    assign op    = instr[6:0];
    assign func3 = instr[14:12];
    assign func7 = instr[31:25];
    assign s7 = func7[5];
    
    always @(*)
    begin
        case (op[6:2])
            5'b01101: begin ExtOp = 3'b001; RegWr = 1'b1; Branch = 3'b000; MemtoReg = 1'b0; MemWr = 1'b0;                 ALUBsrc = 2'b01; ALUctr = 4'b0011; end // lui
            5'b00101: begin ExtOp = 3'b001; RegWr = 1'b1; Branch = 3'b000; MemtoReg = 1'b0; MemWr = 1'b0; ALUAsrc = 1'b1; ALUBsrc = 2'b01; ALUctr = 4'b0000; end // auipc
            5'b00100: 
            begin 
                ExtOp = 3'b000; RegWr = 1'b1; Branch = 3'b000; MemtoReg = 1'b0; MemWr = 1'b0; ALUAsrc = 1'b0; ALUBsrc = 2'b01;
                case (func3)
                    3'b000:       begin ALUctr = 4'b0000; end // addi
                    3'b010:       begin ALUctr = 4'b0010; end // slti
                    3'b011:       begin ALUctr = 4'b1010; end // sltiu
                    3'b100:       begin ALUctr = 4'b0100; end // xori
                    3'b110:       begin ALUctr = 4'b0110; end // ori
                    3'b111:       begin ALUctr = 4'b0111; end // andi
                    3'b001:       begin 
                        case (s7)
                            1'b0: begin ALUctr = 4'b0001; end // slli
                        endcase
                    end
                    3'b101: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0101; end // srli
                            1'b1: begin ALUctr = 4'b1101; end // srai
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
                            1'b0: begin ALUctr = 4'b0000; end // add
                            1'b1: begin ALUctr = 4'b1000; end // sub
                        endcase
                    end
                    3'b001: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0001; end // sll
                            //1'b1: begin end
                        endcase
                    end
                    3'b010: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0010; end // slt
                            //1'b1: begin end
                        endcase
                    end
                    3'b011: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b1010; end // sltu
                            //1'b1: begin end
                        endcase
                    end
                    3'b100: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0100; end // xor
                            //1'b1: begin end
                        endcase
                    end
                    3'b101: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0101; end // srl
                            1'b1: begin ALUctr = 4'b1101; end // sra
                        endcase
                    end
                    3'b110: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0110; end // or
                            //1'b1: begin end
                        endcase
                    end
                    3'b111: begin
                        case (s7)
                            1'b0: begin ALUctr = 4'b0111; end // and
                            //1'b1: begin end
                        endcase
                    end
                endcase   
            end
            
            5'b11011:       begin ExtOp = 3'b100; RegWr = 1'b1; Branch = 3'b001; MemtoReg = 1'b0; MemWr = 1'b0; ALUAsrc = 1'b1; ALUBsrc = 2'b10; ALUctr = 4'b0000; end // jal
            5'b11001: begin
                case (func3)
                    3'b000: begin ExtOp = 3'b000; RegWr = 1'b1; Branch = 3'b010; MemtoReg = 1'b0; MemWr = 1'b0; ALUAsrc = 1'b1; ALUBsrc = 2'b10; ALUctr = 4'b0000; end // jalr
                endcase
            end
            5'b11000: begin
                ExtOp = 3'b011; RegWr = 1'b0;                                   MemWr = 1'b0; ALUAsrc = 1'b0; ALUBsrc = 2'b00;
                case (func3)
                    3'b000: begin Branch = 3'b100; ALUctr = 4'b0010; end // beq
                    3'b001: begin Branch = 3'b101; ALUctr = 4'b0010; end // bne
                    3'b100: begin Branch = 3'b110; ALUctr = 4'b0010; end // blt
                    3'b101: begin Branch = 3'b111; ALUctr = 4'b0010; end // beg
                    3'b110: begin Branch = 3'b110; ALUctr = 4'b1010; end // bltu
                    3'b111: begin Branch = 3'b111; ALUctr = 4'b1010; end // bgeu
                endcase
            end
            
            5'b00000: begin
                ExtOp = 3'b000; RegWr = 1'b1; Branch = 3'b000; MemtoReg = 1'b1; MemWr = 1'b0; ALUAsrc = 1'b0; ALUBsrc = 2'b01; ALUctr = 4'b0000; 
                case (func3)
                    3'b000: begin  MemOp = 3'b000; end // lb
                    3'b001: begin  MemOp = 3'b001; end // lh
                    3'b010: begin  MemOp = 3'b010; end // lw
                    3'b100: begin  MemOp = 3'b100; end // lbu
                    3'b101: begin  MemOp = 3'b101; end // lhu
                endcase
            end
            5'b01000: begin
                ExtOp = 3'b010; RegWr = 1'b0; Branch = 3'b000;                  MemWr = 1'b1; ALUAsrc = 1'b0; ALUBsrc = 2'b01; ALUctr = 4'b0000; 
                case (func3)
                    3'b000: begin  MemOp = 3'b000; end // sb
                    3'b001: begin  MemOp = 3'b001; end // sh
                    3'b010: begin  MemOp = 3'b010; end // sw
                endcase
            end
        endcase
    end
endmodule
