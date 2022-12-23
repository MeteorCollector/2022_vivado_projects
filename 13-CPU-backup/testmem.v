module Instr_mem(
    input clock,
    input [15:0]address,
    input [31:0]data,
    input wren,
    output [31:0] q
    );
    blk_mem_instr instr_mem(.addra(address),.clka(clock),.dina(data),
            .douta(q), .ena(1'b1), .wea(wren));
endmodule
/*
module testmem(
	address,
	clock,
	data,
	wren,
	q);

	input	[15:0]  address;
	input	  clock;
	input	[31:0]  data;
	input	  wren;
	output reg	[31:0]  q;
	
	reg [31:0] ram [65535:0];
	always@(posedge clock)
		q <= ram[address];
		
endmodule
*/