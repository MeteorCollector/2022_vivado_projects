`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/18 19:54:41
// Design Name: 
// Module Name: my_first_fpga_test
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
module my_first_fpga_tst();
        wire f; //�������Ҫ����Ϊ wire���͵ģ����� wire����ȱʡ
        reg a,b; //�����������Ϊ reg���͵�
    My_first_fgpa s0(.A(a),.B(b),.F(f));
    initial begin
        begin a = 1'b0; b = 1'b0; end
        #200 begin a = 1'b0; b = 1'b1; end
        #200 begin a = 1'b1; b = 1'b0; end
        #200 begin a = 1'b1; b = 1'b1; end
        #200 begin a = 1'b0; b = 1'b0; end
    end
endmodule
