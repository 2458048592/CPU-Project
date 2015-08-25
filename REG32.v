`timescale 1ns / 1ps

module REG32 (
	input clk,
	input CE,
	input [31:0] D,
	output [31:0] Q );
	
	reg [31:0] register;
	
	assign Q = register;
	
	initial begin
		register <= 0;
	end
	
	always @(posedge clk) begin
		if(CE == 1) register <= D;
	end
	
endmodule
