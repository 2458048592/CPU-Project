`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:41:04 08/30/2015 
// Design Name: 
// Module Name:    colors 
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
module colors(
			input graph_mode,
			input [15:0] char_color,
			input font_dot,
			output [7:0] color
    );

	assign color = (graph_mode == 1) ? char_color[7:0] : ( (font_dot == 1) ? char_color[15:8] : 8'h00 );

endmodule
