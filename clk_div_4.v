`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:21 08/24/2015 
// Design Name: 
// Module Name:    clk_div_4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module clk_div_4(
			input clk100,
			output clk25
    );
	 reg [1:0] count;
	 
	 always @(posedge clk100)
	 begin
			count <= count + 1;
	 end

	assign clk25 = count[1];
endmodule
