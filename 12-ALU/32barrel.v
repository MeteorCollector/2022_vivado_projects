`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/16 13:55:43
// Design Name: 
// Module Name: barrelsft8
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


module barrelsft32 (
output [31:0] dout,
input [31:0] din,
input [4:0] shamt, //???��??
input LR, // LR=1? ???? LR=0? ?? ??
input AL // AL=1?????????? AR=0????????
);

reg [31:0] layer0;
reg [31:0] layer1;
reg [31:0] layer2;
reg [31:0] layer3;
reg [31:0] layer4;

always @(*)
begin
    if (shamt[0] == 1'b1)
    begin
        case({LR})
            1'b0: 
            begin 
                layer0[30:0] = din[31:1]; layer0[31] = (AL == 1'b1) ? din[31] : 1'b0; 
            end
            1'b1: 
            begin 
                layer0[31:1] = din[30:0]; layer0[0] = 1'b0; 
            end
        endcase
    end
    else
    begin
        layer0 = din;
    end
    if (shamt[1] == 1'b1)
    begin
        case({LR})
            1'b0: 
            begin 
                layer1[29:0] = layer0[31:2];
                layer1[31] = (AL == 1'b1) ? din[31] : 1'b0; layer1[30] = (AL == 1'b1) ? din[31] : 1'b0; 
            end
            1'b1: 
            begin 
                layer1[31:2] = layer0[29:0];
                layer1[1] = 1'b0; layer1[0] = 1'b0; 
            end
        endcase
    end
    else
    begin
        layer1 = layer0;
    end
    if (shamt[2] == 1'b1)
    begin
        case({LR})
            1'b0: 
            begin 
                layer2[27:0] = layer1[31:4];
                layer2[28] = (AL == 1'b1) ? din[31] : 1'b0;
                layer2[29] = (AL == 1'b1) ? din[31] : 1'b0;
                layer2[30] = (AL == 1'b1) ? din[31] : 1'b0;
                layer2[31] = (AL == 1'b1) ? din[31] : 1'b0; 
            end
            1'b1: 
            begin 
                layer2[31:4] = layer1[27:0];
                layer2[3] = 1'b0; layer2[2] = 1'b0;
                layer2[1] = 1'b0; layer2[0] = 1'b0;
            end
        endcase
    end
    else
    begin
        layer2 = layer1;
    end
    if (shamt[3] == 1'b1)
    begin
        case({LR})
            1'b0: 
            begin 
                layer3[23:0] = layer2[31:8];
                layer3[31:24] = (AL == 1'b1 && din[31] == 1'b1) ? 8'hff : 8'h00;
            end
            1'b1: 
            begin 
                layer3[31:8] = layer2[23:0];
                layer3[7:0] = 8'h00;
            end
        endcase
    end
    else
    begin
        layer3 = layer2;
    end
    if (shamt[4] == 1'b1)
    begin
        case({LR})
            1'b0: 
            begin
                layer4[15:0] = layer3[31:16];
                layer4[31:16] = (AL == 1'b1 && din[31] == 1'b1) ? 16'hffff : 16'h0000;
            end
            1'b1: 
            begin 
                layer4[31:16] = layer3[15:0];
                layer4[15:0] = 16'h0000;
            end
        endcase
    end
    else
    begin
        layer4 = layer3;
    end
end

assign dout = layer4;

endmodule
