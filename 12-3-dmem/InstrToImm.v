`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/29 15:12:18
// Design Name: 
// Module Name: InstrToImm
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


module InstrToImm (
    input [31:0] instr,
    input [2:0] ExtOp,
    output reg [31:0] imm
);


always @(*)
begin
    //imm = 32'h66666666;
    
    case ({ExtOp})
        3'b000: begin imm = {{20{instr[31]}}, instr[31:20]}; end                                           // immI
        3'b001: begin imm = {instr[31:12], 12'h000}; end                                                   // immU
        3'b010: begin imm = {{20{instr[31]}}, instr[31:25], instr[11:7]}; end                              // immS
        3'b011: begin imm = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0}; end   // immB
        3'b100: begin imm = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0}; end // immJ
        default: begin end
    endcase
    
end
endmodule
