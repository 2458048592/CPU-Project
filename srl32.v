`timescale 1ns / 1ps

module srl32 (
	input [31:0] A,
	input [31:0] B,
	output [31:0] res );
	
	assign res = {1'b0, res[31:1]};

endmodule
