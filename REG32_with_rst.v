`timescale 1ns / 1ps

module REG32_with_rst (
	input clk,
	input rst,
	input CE,
	input [31:0] D,
	output [31:0] Q );
	
	reg [31:0] register;
	
	assign Q = register;
	
	initial begin
		register <= 0;
	end
	
	always @(posedge clk, posedge rst) begin
		if(rst == 1) register <= 0;
		else if(CE == 1) register <= D;
	end
	
endmodule
