module exp1(
	input [1:0] X0,
	input [1:0] X1,
	input [1:0] X2,
	input [1:0] X3,
	input [1:0] Y,
	output reg [1:0] F
);

always @(*)
    case (Y)
        2'b00: Y=X0;
        2'b01: Y=X1;
        2'b10: Y=X2;
        2'b11: Y=X3;
    endcase
endmodule