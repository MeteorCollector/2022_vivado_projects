`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/04 21:58:42
// Design Name: 
// Module Name: BranchCond
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


module BranchCond(
    input [2:0] Branch,
    input Less,
    input Zero,
    output reg PCAsrc,
    output reg PCBsrc
    );
    
always @(*)
begin
    case (Branch)
        3'b000:       begin PCAsrc = 1'b0; PCBsrc = 1'b0; end
        3'b001:       begin PCAsrc = 1'b1; PCBsrc = 1'b0; end
        3'b010:       begin PCAsrc = 1'b1; PCBsrc = 1'b1; end
        3'b100: begin 
            case (Zero)
                1'b0: begin PCAsrc = 1'b0; PCBsrc = 1'b0; end
                1'b1: begin PCAsrc = 1'b1; PCBsrc = 1'b0; end
            endcase
        end
        3'b001: begin 
            case (Zero)
                1'b0: begin PCAsrc = 1'b1; PCBsrc = 1'b0; end
                1'b1: begin PCAsrc = 1'b0; PCBsrc = 1'b0; end
            endcase
        end
        3'b010: begin 
            case (Less)
                1'b0: begin PCAsrc = 1'b0; PCBsrc = 1'b0; end
                1'b1: begin PCAsrc = 1'b1; PCBsrc = 1'b0; end
            endcase
        end
        3'b111: begin 
            case (Less)
                1'b0: begin PCAsrc = 1'b1; PCBsrc = 1'b0; end
                1'b1: begin PCAsrc = 1'b0; PCBsrc = 1'b0; end
            endcase
        end
    endcase
end

endmodule
