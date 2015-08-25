`timescale 1ns / 1ps

module mux4to1_32 (
	input [1:0] sel,
	input [31:0] a,
	input [31:0] b,
	input [31:0] c,
	input [31:0] d,
	output reg[31:0] o );
	
	always @* begin
		case(sel)
			2'b00: o = a;
			2'b01: o = b;
			2'b10: o = c;
			2'b11: o = d;
		endcase
	end

endmodule
