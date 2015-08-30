`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:20 08/26/2015 
// Design Name: 
// Module Name:    vga_control 
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
module vga_control(
			input clk25,
			input wire [9:0] hc,
			input wire [9:0] vc,
			input wire vidon,
			input wire [7:0] RGB,
			input wire font_dot,
			
			output reg [7:0] data,
			output wire [12:0] vga_address,
			output wire [9:0] font_address
    );

	parameter h_pixel = 800;
	parameter h_total = 521;
	parameter hbp = 144;
	parameter hfp = 784;
	parameter vbp = 31;
	parameter vfp = 511;

	wire [9:0] xpix;
	wire [9:0] ypix;

	assign xpix = hc - hbp;
	assign ypix = vc - vbp;

	//assign address = (xpix >> 4) + (ypix >> 4) * 40;
	assign vga_address = (xpix >> 3) + (ypix >> 3) * 80;
	assign font_address = (xpix & 7) + (ypix & 7) * 8;
	
	always @(posedge clk25)
	begin
		if (vidon == 0)
		begin
			data <= 0;
		end
		else
		begin
			if (font_dot == 1)
				data <= RGB;
			else
				data <= 0;
		end
	end
	
endmodule
