`timescale 1ns / 1ps

module M_datapath (
	input clk,
	input reset,
	input IorD,
	input ALUSrcA,
	input RegWrite,
	input IRWrite,
	input MIO_ready,
	input PCWrite,
	input PCWriteCond,
	input Branch,
	input [1:0] PCSource,
	input [1:0] RegDst,
	input [1:0] MemtoReg,
	input [1:0] ALUSrcB,
	input [2:0] ALU_operation,
	input [31:0] data2CPU,
	output zero,
	output overflow,
	output [31:0] PC_Current,
	output [31:0] M_addr,
	output [31:0] data_out,
	output [31:0] Inst );
	
	wire [4:0] Wt_addr;
	wire [31:0] A;
	wire [31:0] B;
	wire [31:0] res;
	wire [31:0] Wt_data;
	wire [31:0] rdata_A;
	wire [31:0] rdata_B;
	wire [31:0] MDR_data;
	wire [31:0] PC_in;
	wire [31:0] ALU_Out;
	wire [31:0] Imm_32;
	
	assign data_out = rdata_B;
	assign PC_CE = MIO_ready & (PCWrite | (PCWriteCond & (~(zero ^ Branch))));
	
	ALU U1 (.A(A), .B(B), .ALU_operation(ALU_operation), .zero(zero), .res(res), .overflow(overflow));
	
	Regs U2 (
		.clk(clk), .rst(reset), .L_S(RegWrite), .R_addr_A(Inst[25:21]), .R_addr_B(Inst[20:16]),
		.Wt_addr(Wt_addr), .Wt_data(Wt_data), .rdata_A(rdata_A), .rdata_B(rdata_B)
	);
	
	REG32_with_rst PC (.clk(clk), .rst(rst), .CE(PC_CE), .D(PC_in), .Q(PC_Current));
	
	REG32
		IR (.clk(clk), .CE(IRWrite), .D(data2CPU), .Q(Inst)),
		MDR (.clk(clk), .CE(1), .D(data2CPU), .Q(MDR_data)),
		ALUout (.clk(clk), .CE(1), .D(res), .Q(ALU_Out))
	;
	
	mux4to1_5 MUX1 (.a(Inst[20:16]), .b(Inst[15:11]), .c(5'b11111), .d(5'bx), .sel(RegDst), .o(Wt_addr));
	
	mux2to1_32 
		MUX4 (.a(rdata_A), .b(PC_Current), .o(A), .sel(ALUSrcA)),
		MUX5 (.a(ALU_Out), .b(PC_Current), .o(M_addr), .sel(IorD))
	;
	
	mux4to1_32
		MUX2 (.a(ALU_Out), .b(MDR_data), .c({Inst[15:0], {16{1'b0}}}), .d(PC_Current), .sel(MemtoReg), .o(Wt_data)),
		MUX3 (.a(rdata_B), .b(4), .c(Imm_32), .d({Imm_32[29:0], 2'b00}), .sel(ALUSrcB), .o(B)),
		MUX6 (.a(res), .b(ALU_Out), .c({PC_Current[31:28], Inst[25:0], 2'b00}), .d(ALU_Out), .sel(PCSource), .o(PC_in))
	;
	
	Ext_32 Ext_32 (.imm_16(Inst[15:0]), .Imm_32(Imm_32));
	
endmodule
