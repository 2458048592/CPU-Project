`timescale 1ns / 1ps

module ADC32 (
	input [31:0] A,
	input [31:0] B,
	input C0,
	output [32:0] S );
	
	assign S = A + {C0, B} + C0;

endmodule
