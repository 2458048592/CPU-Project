`timescale 1ns / 1ps

module ALU (
	input [2:0] ALU_operation,
	input [31:0] A,
	input [31:0] B,
	output overflow,
	output zero,
	output [31:0] res );
	
	wire or_all_bits;
	wire [32:0] S;
	wire [31:0] outand;
	wire [31:0] outor;
	wire [31:0] outxor;
	wire [31:0] outnor;
	wire [31:0] outsrl;
	wire [31:0] addnumber;
	wire [31:0] mask;
	wire [31:0] res_DUMMY;
	
	assign res[31:0] = res_DUMMY[31:0];
	assign zero = ~or_all_bits;
	
	and32 O1 (.A(A[31:0]), .B(B[31:0]), .res(outand[31:0]));	
	or32  O2 (.A(A[31:0]), .B(B[31:0]), .res(outor[31:0]));
	ADC32 O3 (.A(A[31:0]), .B(addnumber[31:0]), .C0(ALU_operation[2]), .S(S[32:0]));
	xor32 O4 (.A(A[31:0]), .B(B[31:0]), .res(outxor[31:0]));
	nor32 O5 (.A(A[31:0]), .B(B[31:0]), .res(outnor[31:0]));
	srl32 O6 (.A(A[31:0]), .B(B[31:0]), .res(outsrl[31:0]));
	xor32 O7 (.A(mask[31:0]), .B(B[31:0]), .res(addnumber[31:0]));
	
	mux8to1_32 muxout (
		.sel(ALU_operation[2:0]),
		.x0(outand[31:0]),
		.x1(outor[31:0]),
		.x2(S[31:0]),
		.x3(outxor[31:0]),
		.x4(outnor[31:0]),
		.x5(outsrl[31:0]),
		.x6(S[31:0]),
		.x7({31'b0, S[32]}),
		.o(res_DUMMY[31:0])
	);
	
	or_bit_32 Or_bit (.A(res_DUMMY[31:0]), .o(or_all_bits));
	SignalExt_32 sign (.S(ALU_operation[2]), .So(mask[31:0]));

endmodule
