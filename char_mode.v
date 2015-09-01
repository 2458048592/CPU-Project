`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:44:41 08/26/2015 
// Design Name: 
// Module Name:    char_mode 
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
module char_mode(
			input [14:0] cpu_address,
			input [14:0] vga_address,
			input mode,
			output [14:0] char_address
    );

	assign char_address = (mode == 1) ? cpu_address : vga_address;

endmodule
