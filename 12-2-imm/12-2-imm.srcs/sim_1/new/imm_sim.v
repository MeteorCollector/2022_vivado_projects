`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/29 15:42:45
// Design Name: 
// Module Name: imm_sim
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/02 15:39:29
// Design Name: 
// Module Name: adder_sim
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


module imm_tst();
reg [31:0] instr = 0; //inst
reg [2:0] ExtOp = 3'b000;
wire [31:0] imm; //result

InstrToImm imm_inst(instr, ExtOp, imm);
initial begin
#10 begin instr=32'h40965df2; ExtOp=3'b000; end
#20 ExtOp=3'b001;
#20 ExtOp=3'b010;
#20 ExtOp=3'b011;
#20 ExtOp=3'b100;
#20 begin instr=32'h55555555; ExtOp=3'b000; end
#20 ExtOp=3'b001;
#20 ExtOp=3'b010;
#20 ExtOp=3'b011;
#20 ExtOp=3'b100;
#20 begin instr=32'ha7e06650; ExtOp=3'b000; end
#20 ExtOp=3'b001;
#20 ExtOp=3'b010;
#20 ExtOp=3'b011;
#20 ExtOp=3'b100;
#20 begin instr=32'hf7eff65f; ExtOp=3'b000; end
#20 ExtOp=3'b001;
#20 ExtOp=3'b010;
#20 ExtOp=3'b011;
#20 ExtOp=3'b100;
end
endmodule

