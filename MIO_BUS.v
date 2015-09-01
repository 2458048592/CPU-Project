`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:14 06/30/2012 
// Design Name: 
// Module Name:    MIO_BUS 
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
module MIO_BUS(clk,
					rst,
					BTN,
					SW,
					mem_w,
					Cpu_data2bus,									//data from CPU
					addr_bus,
					ram_data_out,
					led_out,
					counter_out,
					counter0_out,
					counter1_out,
					counter2_out,
					
					Cpu_data4bus,									//write to CPU
					ram_data_in,								//from CPU write to Memory
					ram_addr,									//Memory Address signals
					data_ram_we,
					GPIOf0000000_we,
					GPIOe0000000_we,
					counter_we,
					Peripheral_in,
					
					char_data,
					GPIOc0000000_we,
					xkey
					);
					
					
input clk,rst,mem_w;
input counter0_out,counter1_out,counter2_out;
input [3:0]BTN;
input [7:0]SW,led_out;
input [31:0] Cpu_data2bus,ram_data_out,addr_bus,counter_out;					
output data_ram_we,GPIOe0000000_we,GPIOf0000000_we,counter_we;
output [31:0]Cpu_data4bus,ram_data_in,Peripheral_in;	
output reg [12:0] ram_addr;

reg data_ram_we,GPIOf0000000_we,GPIOe0000000_we,counter_we;
reg data_ram_rd,GPIOf0000000_rd,GPIOe0000000_rd,counter_rd;
reg[31:0] Cpu_data4bus,ram_data_in,Peripheral_in;
reg[7:0] led_in;
wire[7:0] led_out;
wire counter_over;

input [15:0] xkey;
input [15:0] char_data;
output reg GPIOc0000000_we;
reg keyboard_rd;

always@* begin
	data_ram_we=0;
	data_ram_rd=0;
	counter_we=0;
	counter_rd=0;
	GPIOf0000000_we=0;
	GPIOe0000000_we=0;
	GPIOf0000000_rd=0;
	GPIOe0000000_rd=0;
	ram_addr=13'h0;
	ram_data_in=32'h0;
	Peripheral_in=32'h0;
	Cpu_data4bus =32'h0;
	
	keyboard_rd = 0;
	GPIOc0000000_we = 0;
		
	case(addr_bus[31:28])
	4'h0:begin
		data_ram_we = mem_w;
		ram_addr = addr_bus[14:2];
		ram_data_in = Cpu_data2bus;
		Cpu_data4bus = ram_data_out;
		data_ram_rd = ~mem_w;
	end
	4'he:begin              //7 segments LEDs
		GPIOe0000000_we = mem_w;
		Peripheral_in = Cpu_data2bus;
		Cpu_data4bus = counter_out;
		GPIOe0000000_rd = ~mem_w;
	end
	4'hf:begin
		if(addr_bus[2])begin
			counter_we = mem_w;
			Peripheral_in = Cpu_data2bus;
			Cpu_data4bus = counter_out;
			counter_rd = ~mem_w;
		end
		else begin
			GPIOf0000000_we = mem_w;
			Peripheral_in = Cpu_data2bus;
			Cpu_data4bus = {counter0_out,counter1_out,counter2_out,9'h00,led_out,BTN,SW};
			GPIOf0000000_rd = ~mem_w;
		end
	end
	
	4'hd:
	begin
		//Peripheral_in = Cpu_data2bus;
		Cpu_data4bus = {16'h0000, xkey};
		keyboard_rd = ~mem_w;
	end
	
	4'hc:
	begin
		GPIOc0000000_we = mem_w;
		Peripheral_in = Cpu_data2bus;
	end
	
	endcase
	casex({data_ram_rd,GPIOe0000000_rd,counter_rd,GPIOf0000000_rd, keyboard_rd})
		5'b1xxxx:Cpu_data4bus = ram_data_out; //read from RAM
		5'bx1xxx:Cpu_data4bus = counter_out;  //read from Counter
		5'bxx1xx:Cpu_data4bus = counter_out;  //read from Counter
		5'bxxx1x:Cpu_data4bus = {counter0_out,counter1_out,counter2_out,9'h00,led_out,BTN,SW}; //read from SW & BTN
		5'bxxxx1:Cpu_data4bus = {16'h0000, xkey};
	endcase
end


endmodule
