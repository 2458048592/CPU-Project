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
			input wire [15:0] RGB,
			input wire font_dot,
			input wire graph_mode,
			
			output reg [7:0] data,
			output wire [14:0] vga_address,
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

	assign vga_address = (graph_mode == 0) ? (xpix >> 3) + (ypix >> 3) * 80 : ((xpix - 250 + (ypix - 150) * 140) >> 1) + 4800;
	assign font_address = (xpix & 7) + (ypix & 7) * 8;
	
	always @(posedge clk25)
	begin
		if (vidon == 0)
		begin
			data <= 0;
		end
		else
		if (graph_mode == 1)
		begin
			if (xpix < 251 | (xpix > 388) | ypix < 151 | (ypix > 328))
				data <= 8'hff;
			else
			begin
				if ((4800 + xpix - 250 + (ypix - 150) * 140) & 1 == 1)
					data <= RGB[15:8];
				else
					data <= RGB[7:0];
			end
		end
		else
		begin
			if (font_dot == 1)
				data <= RGB[15:8];
			else
				data <= 0;
		end
	end
	
endmodule
