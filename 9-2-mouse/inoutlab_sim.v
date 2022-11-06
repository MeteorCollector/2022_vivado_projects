`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/23 21:33:32
// Design Name: 
// Module Name: inoutlab_sim
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


module inoutlab_sim(  );
    
/* parameter */
 parameter [31:0] clock_period = 10;

 /* ps2_keyboard interface signals */
 reg clk;
 wire DP;
 wire [6:0] SEG;
 wire [7:0] AN;
 wire BTNC,overflow;
 wire PS2_CLK, PS2_DATA;
 wire [15:0] LED;

 ps2_keyboard_send send(
	.ps2_clk(PS2_CLK),
	.ps2_data(PS2_DATA)
 );

	inoutlab  inoutlab_sam(	
	.CLK100MHZ(clk),	
	.PS2_CLK(PS2_CLK),	
	.PS2_DATA(PS2_DATA),	
	.BTNC(BTNC),	
	.SEG(SEG),
	.AN(AN),
	.DP(DP),
	.LED(LED)
	
	);	
		
	initial begin /* clock driver	*/
	clk = 0;	
	forever	
     	#(clock_period/2) clk	= ~clk;
	end	
		
	initial begin	
	#20;	
	send.kbd_sendcode(8'h15); // press 'Q'
	#20 ;//read data
	send.kbd_sendcode(8'hF0); // break code
	#20; //read data
	send.kbd_sendcode(8'h15); // release 'Q'
	#20;  //read data
	send.kbd_sendcode(8'h1D); // press 'W'
	#20 ; // keep pressing 'S'
	send.kbd_sendcode(8'h1D); // keep pressing 'W'
	#20;
	send.kbd_sendcode(8'hF0); // break code
	#20;
	send.kbd_sendcode(8'h1D); // release 'W'
	#20;
	$stop;
 end
   
    
endmodule

 module ps2_keyboard_send(
	output reg ps2_clk,
	output reg ps2_data
	);
 parameter [31:0] kbd_clk_period = 10;
 initial ps2_clk = 1'b1;

 task kbd_sendcode;
	input [7:0] code; // key to be sent
	integer i;

	reg[10:0] send_buffer;
	begin
	   send_buffer[0]	= 1'b0;	// start bit
	   send_buffer[8:1] = code;	// code
	   send_buffer[9]	= ~(^code); // odd parity bit
	   send_buffer[10]	= 1'b1;	// stop bit
	   i = 0;
	while( i < 11) begin
	           // set kbd_data
	     ps2_data = send_buffer[i];
         #(kbd_clk_period/2) ps2_clk = 1'b0;
	     #(kbd_clk_period/2) ps2_clk = 1'b1;
	     i = i + 1;
	   end
	end
   endtask

 endmodule
