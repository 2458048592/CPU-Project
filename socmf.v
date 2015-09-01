`timescale 1ns / 1ps

module socmf (
	input clk,
	input [3:0] BTN,
	input [7:0] SW,
	output[7:0] LED,
	output[7:0] SEGMENT,
	output[3:0] AN,

	input wire PS2KeyboardData,
	input wire PS2KeyboardClk,
	output wire [2:0] vgaRed,
	output wire [2:0] vgaGreen,
	output wire [2:0] vgaBlue,
	output wire Hsync,
	output wire Vsync
	);

	wire Clk_CPU;
	wire mem_w;
	wire NOT_Clk_CPU;
	wire NOT_clk;
	wire counter_we;
	wire counter0_out;
	wire counter1_out;
	wire counter2_out;
	wire GPIOe0000000_we;
	wire GPIOf0000000_we;
	wire MIO_ready;
	wire [4:0] state;
	wire [3:0] blinke;
	wire [3:0] blinking;
	wire [3:0] point_out;
	wire [7:0] SW_OK;
	wire [3:0] button_out;
	wire [12:0] ram_addr;
	wire [0:0] data_ram_we;
	wire [1:0] counter_ch;
	wire [7:0] LED_DUMMY;
	wire [31:0] pc;
	wire [31:0] disp_num;
	wire [31:0] clkdiv;
	wire [31:0] inst_out;
	wire [31:0] Data_in;
	wire [31:0] Addr_out;
	wire [31:0] Data_out;
	wire [31:0] ram_data_in;
	wire [31:0] douta;
	wire [31:0] counter_val;
	wire [31:0] counter_out;
	
	wire clk25;
	wire [15:0] xkey;
	wire [9:0] hc;
	wire [9:0] vc;
	wire vidon;
	wire GPIOc0000000_we;
	wire [15:0] char_data;
	wire font_dot;
	wire [7:0] data;
	wire [14:0] char_address;
	wire [14:0] vga_address;
	wire [9:0] font_address;
	
	wire graph_mode;
	assign graph_mode = SW_OK[2];
	
	assign LED[7:0] = {LED_DUMMY[7] | Clk_CPU, LED_DUMMY[6:0]};
	assign NOT_clk = ~clk;
	assign NOT_Clk_CPU = ~Clk_CPU;
	assign MIO_ready = 1'b1;
	
	Muliti_CPU U1 (
		.clk(Clk_CPU),
		.Data_in(Data_in[31:0]),
		.inst_out(inst_out[31:0]),
		.INT(counter0_out),
		.MIO_ready(MIO_ready),
		.reset(rst),
		.Addr_out(Addr_out[31:0]),
		.CPU_MIO(),
		.Data_out(Data_out[31:0]),
		.mem_w(mem_w),
		.PC_out(pc[31:0]),
		.state(state[4:0])
	);
	
	RAM_B U3 (
		.addra(ram_addr),
		.clka(NOT_clk),
		.dina(ram_data_in[31:0]),
		.wea(data_ram_we[0]),
		.douta(douta[31:0])
	);
	
	MIO_BUS U4 (
		.addr_bus(Addr_out[31:0]),
		.BTN(button_out[3:0]),
		.clk(clk),
		.counter_out(counter_out[31:0]),
		.counter0_out(counter0_out),
		.counter1_out(counter1_out),
		.counter2_out(counter2_out),
		.Cpu_data2bus(Data_out[31:0]),
		.led_out(LED_DUMMY[7:0]),
		.mem_w(mem_w),
		.ram_data_out(douta[31:0]),
		.rst(rst),
		.SW(SW_OK[7:0]),
		.counter_we(counter_we),
		.Cpu_data4bus(Data_in[31:0]),
		.data_ram_we(data_ram_we[0]),
		.GPIOe0000000_we(GPIOe0000000_we),
		.GPIOf0000000_we(GPIOf0000000_we),
		.Peripheral_in(counter_val[31:0]),
		.ram_addr(ram_addr),
		.ram_data_in(ram_data_in[31:0]),
		
		.xkey(xkey),
		.char_data(char_data),
		.GPIOc0000000_we(GPIOc0000000_we)
	);
	
	seven_seg_Dev_IO U5 (
		.blink_in({24'h000000, blinke[3:0], blinke[3:0]}),
		.clk(NOT_Clk_CPU),
		.disp_cpudata(counter_val[31:0]),
		.GPIOe0000000_we(GPIOe0000000_we),
		.point_in(32'hFFFFFFFF),
		.rst(rst),
		.Test(SW_OK[7:5]),
		.Test_data1({16'h0000, xkey}),
		.Test_data2(counter_out[31:0]),
		.Test_data3(inst_out[31:0]),
		.Test_data4(Addr_out[31:0]),
		.Test_data5(Data_out[31:0]),
		.Test_data6(Data_in[31:0]),
		.Test_data7(pc[31:0]),
		.blink_out(blinking[3:0]),
		.Disp_num(disp_num[31:0]),
		.point_out(point_out[3:0])
	);
	
	seven_seg_dev U6 (
		.blinking(blinking[3:0]),
		.disp_num(disp_num[31:0]),
		.flash_clk(clkdiv[26]),
		.pointing(point_out[3:0]),
		.Scanning(clkdiv[19:18]),
		.SW(SW_OK[1:0]),
		.AN(AN[3:0]),
		.SEGMENT(SEGMENT[7:0])
	);
	
	led_Dev_IO U7 (
		.clk(NOT_Clk_CPU),
		.GPIOf0000000_we(GPIOf0000000_we),
		.Peripheral_in(counter_val[31:0]),
		.rst(rst),
		.counter_set(counter_ch[1:0]),
		.GPIOf0(),
		.led_out(LED_DUMMY[7:0])
	);
	
	clk_div U8 (
		.clk(clk),
		.rst(rst),
		.SW2(SW_OK[2]),
		.clkdiv(clkdiv[31:0]),
		.Clk_CPU(Clk_CPU)
	);
	
	Anti_jitter U9 (
		.clk(clk),
		.button(BTN[3:0]),
		.SW(SW[7:0]),
		.button_out(button_out[3:0]),
		.SW_OK(SW_OK[7:0]),
		.rst(rst)
	);
				 
	Counter_x U10 (
		.clk(NOT_Clk_CPU),
		.clk0(clkdiv[7]),
		.clk1(clkdiv[10]),
		.clk2(clkdiv[10]),
		.counter_ch(counter_ch[1:0]),
		.counter_val(counter_val[31:0]),
		.counter_we(counter_we),
		.rst(rst),
		.counter_out(counter_out[31:0]),
		.counter0_OUT(counter0_out),
		.counter1_OUT(counter1_out),
		.counter2_OUT(counter2_out)
	);

	

	clk_div_4 U11(
		.clk100(clk),
		.clk25(clk25)
	);
	
	keyboard U12(
		.clk25(clk25),
		.PS2D(PS2KeyboardData),
		.PS2C(PS2KeyboardClk),
		.xkey(xkey)
	);
	
	vga_640x480 U13(
		.clk(clk25),
		.Hsync(Hsync),
		.Vsync(Vsync),
		.hc(hc),
		.vc(vc),
		.vidon(vidon)
    );
	 
	vga_display U14(
		.clk(clk25), 
		.vidon(vidon), 
		.data(data), 
		.vgaRed(vgaRed), 
		.vgaGreen(vgaGreen), 
		.vgaBlue(vgaBlue)
	);
	
	vga_control U15 (
			.clk25(clk25),
			.hc(hc),
			.vc(vc),
			.vidon(vidon),
			.RGB(char_data[15:0]),
			.font_dot(font_dot),
			.graph_mode(graph_mode),
			
			.data(data),
			.vga_address(vga_address),
			.font_address(font_address)
	);
	
	font_table U16 (
			.ascii(char_data[7:0]),
			.font_address(font_address),
			
			.font_dot(font_dot)
	);
	
	char_ram U17 (
			.addra(char_address),
			.dina(counter_val[31:16]),
			.douta(char_data),
			.wea(GPIOc0000000_we),
			.clka(clk25)
	);
	
	char_mode U18 (
			.cpu_address(counter_val[14:0]),
			.vga_address(vga_address),
			.char_address(char_address),
			.mode(GPIOc0000000_we)
	);
	
endmodule
