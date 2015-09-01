`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:20 08/30/2015 
// Design Name: 
// Module Name:    GraphMem_control 
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
module GraphMem_control(
			input clk,
			input write_enable,
			input CPU_read,
			input [25:0] CPU_address,
			input [15:0] CPU_data,
			input [25:0] VGA_address,
			
			output wire [15:0] MemData,
			inout [15:0] MemDB,
			output wire [25:0] MemAdr,
			output wire MemOE,
			output wire MemWR,
			output wire RamAdv,
			output wire RamCS,
			output wire RamClk,
			output wire RamCRE,
			output wire RamLB,
			output wire RamUB,
			output wire RamWait
    );

	assign RamAdv = 0;
	assign RamCS = 0;
	assign RamClk = clk;
	assign RamCRE = 1;
	assign RamLB = 0;
	assign RamUB = 0;
	assign RamWait = 1;
	assign MemWR = ~write_enable;
	assign MemOE = 0;
	assign MemData = MemDB;


	assign MemDB = (write_enable == 1) ? CPU_data : 16'bzzzz_zzzz_zzzz_zzzz;
	assign MemAdr = ((write_enable == 1) | (CPU_read == 1)) ? CPU_address : VGA_address;

endmodule
