`timescale 1ns / 1ps

module Muliti_CPU (
	input clk,
	input reset,
	input MIO_ready,
	input INT,
	input [31:0] Data_in,
	output mem_w,
	output CPU_MIO,
	output [4:0] state,
	output [31:0] PC_out,
	output [31:0] inst_out,
	output [31:0] Addr_out,
	output [31:0] Data_out );
	
	wire overflow;
	wire zero;
	wire MemRead;
	wire MemWrite;
	wire IorD;
	wire IRWrite;
	wire RegWrite;
	wire ALUSrcA;
	wire PCWrite;
	wire PCWriteCond;
	wire Branch;
	wire [1:0] RegDst;
	wire [1:0] MemtoReg;
	wire [1:0] ALUSrcB;
	wire [1:0] PCSource;
	wire [2:0] ALU_operation;

	assign mem_w = MemWrite && (~MemRead);
	
	ctrl m_ctrl (
		.clk(clk),
		.reset(reset),
		.Inst_in(inst_out),
		.MIO_ready(MIO_ready),
		.overflow(overflow),
		.zero(zero),
		.MemRead(MemRead),
		.MemWrite(MemWrite),
		.CPU_MIO(CPU_MIO),
		.IorD(IorD),
		.IRWrite(IRWrite),
		.RegWrite(RegWrite),
		.ALUSrcA(ALUSrcA),
		.PCWrite(PCWrite),
		.PCWriteCond(PCWriteCond),
		.Branch(Branch),
		.RegDst(RegDst),
		.MemtoReg(MemtoReg),
		.ALUSrcB(ALUSrcB),
		.PCSource(PCSource),
		.ALU_operation(ALU_operation),
		.state_out(state_out)
	);
	
	M_datapath m_datapath (
		.clk(clk),
		.reset(reset),
		.MIO_ready(MIO_ready),
		.IorD(IorD),
		.IRWrite(IRWrite),
		.RegWrite(RegWrite),
		.ALUSrcA(ALUSrcA),
		.PCWrite(PCWrite),
		.PCWriteCond(PCWriteCond),
		.Branch(Branch),
		.RegDst(RegDst),
		.MemtoReg(MemtoReg),
		.ALUSrcB(ALUSrcB),
		.PCSource(PCSource),
		.ALU_operation(ALU_operation),
		.data2CPU(Data_in),
		.PC_Current(PC_out),
		.Inst(inst_out),
		.data_out(Data_out),
		.M_addr(Addr_out),
		.zero(zero),
		.overflow(overflow)
	);
	
endmodule




