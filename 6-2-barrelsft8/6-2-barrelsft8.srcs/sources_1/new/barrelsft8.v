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


module barrelsft8 (
output [7:0] dout,
input [7:0] din,
input [2:0] shamt, //移动位数
input LR, // LR=1时 右移 LR=0时 左 移
input AL // AL=1时算术右移， AR=0时逻辑右移
);

reg [7:0] layer0;
reg [7:0] layer1;
reg [7:0] layer2;

always @(*)
begin
    if (shamt[0] == 1'b1)
    begin
        case({LR})
            1'b0: 
            begin 
                layer0[0] = din[1]; layer0[1] = din[2]; layer0[2] = din[3]; 
                layer0[3] = din[4]; layer0[4] = din[5]; layer0[5] = din[6];
                layer0[6] = din[7]; layer0[7] = (AL == 1'b1) ? din[7] : 1'b0; 
            end
            1'b1: 
            begin 
                layer0[7] = din[6]; layer0[6] = din[5]; layer0[5] = din[4]; 
                layer0[4] = din[3]; layer0[3] = din[2]; layer0[2] = din[1];
                layer0[1] = din[0]; layer0[0] = 1'b0; 
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
                layer1[0] = layer0[2]; layer1[1] = layer0[3]; layer1[2] = layer0[4]; 
                layer1[3] = layer0[5]; layer1[4] = layer0[6]; layer1[5] = layer0[7];
                layer1[6] = (AL == 1'b1) ? din[7] : 1'b0; layer1[7] = (AL == 1'b1) ? din[7] : 1'b0; 
            end
            1'b1: 
            begin 
                layer1[7] = layer0[5]; layer1[6] = layer0[4]; layer1[5] = layer0[3]; 
                layer1[4] = layer0[2]; layer1[3] = layer0[1]; layer1[2] = layer0[0];
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
                layer2[0] = layer1[4]; layer2[1] = layer1[5]; 
                layer2[2] = layer1[6]; layer2[3] = layer1[7]; 
                layer2[4] = (AL == 1'b1) ? din[7] : 1'b0;
                layer2[5] = (AL == 1'b1) ? din[7] : 1'b0;
                layer2[6] = (AL == 1'b1) ? din[7] : 1'b0;
                layer2[7] = (AL == 1'b1) ? din[7] : 1'b0; 
            end
            1'b1: 
            begin 
                layer2[7] = layer1[3]; layer2[6] = layer1[2]; layer2[5] = layer1[1]; 
                layer2[4] = layer1[0]; layer2[3] = 1'b0; layer2[2] = 1'b0;
                layer2[1] = 1'b0; layer2[0] = 1'b0;
            end
        endcase
    end
    else
    begin
        layer2 = layer1;
    end
end

assign dout = layer2;

endmodule
