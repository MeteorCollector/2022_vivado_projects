`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/23 00:00:40
// Design Name: 
// Module Name: multi8z_tst
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


module multi_32z_tst ( );
reg [31:0] X, Y;
wire [63:0] P;
multi32z UUT ( .x(X), .y(Y), .p(P) ); // Instantiate the UUT

task checkP;
    input i, j, P;
    integer i, j, prod;
    reg [63:0] P;
    begin
        prod = i*j;
        if (P !== prod)
        begin
            $display($time," Error: i=%d, j=%d, expected %d (%16b), got %d (%16b)", i, j, prod, prod, P, P); $stop(1);
        end
    end
endtask
initial begin : TB // Start testing at time 0
integer i, j;
for ( i=17; i<=2000000000; i=i+114 ) //
for ( j=13; j<=2000000000; j=j+514 ) begin //
X = i; Y = j;
#1; // wait 10 ns, then check result
checkP (i, j, P);
end
$display($time, " Test ended"); $stop(1); // end test
end
endmodule
