`timescale 1ns / 1ps

module ctrl (
	input clk,
	input reset,
	input zero,
	input overflow,
	input MIO_ready,
	input [31:0] Inst_in,
	output [4:0] state_out,
	output reg MemRead,
	output reg MemWrite,
	output reg CPU_MIO,
	output reg IorD,
	output reg IRWrite,
	output reg RegWrite,
	output reg ALUSrcA,
	output reg PCWrite,
	output reg PCWriteCond,
	output reg Branch,
	output reg [1:0] RegDst,
	output reg [1:0] MemtoReg,
	output reg [1:0] ALUSrcB,
	output reg [1:0] PCSource,
	output reg [2:0] ALU_operation );

	parameter
		IF     = 5'b00000,
		ID     = 5'b00001,
		EX_R   = 5'b00010,
		EX_MEM = 5'b00011,
		EX_I   = 5'b00100,
		WB_LUI = 5'b00101,
		EX_BEQ = 5'b00110,
		EX_BNE = 5'b00111,
		EX_JR  = 5'b01000,
		EX_JAL = 5'b01001,
		EX_J   = 5'b01010,
		MEM_RD = 5'b01011,
		MEM_WD = 5'b01100,
		WB_R   = 5'b01101,
		WB_I   = 5'b01110,
		WB_LW  = 5'b01111,
		ERROR  = 5'b11111
	;
	
	parameter
		AND  = 3'b000,
		OR   = 3'b001,
		ADD  = 3'b010,
		XOR  = 3'b011,
		NOR  = 3'b100,
		SRL  = 3'b101,
		SUB  = 3'b110,
		SLTU = 3'b111
	;
	
	`define CPU_ctrl_signals { \
		PCWrite,                \
		PCWriteCond,            \
		IorD,                   \
		MemRead,                \
		MemWrite,               \
		IRWrite,                \
		MemtoReg,               \
		PCSource,               \
		ALUSrcB,                \
		ALUSrcA,                \
		RegWrite,               \
		RegDst,                 \
		CPU_MIO                 \
	}
		
	reg [4:0] state;
	
	assign state_out = state;
	assign mem_w = MemWrite && (~MemRead);
	
	initial begin
		`CPU_ctrl_signals <= 17'h12821;
		ALU_operation <= ADD;
		state <= IF;
	end
	
	always @ (posedge clk or posedge reset) begin
		if (reset == 1) begin
			`CPU_ctrl_signals <= 17'h12821;
			ALU_operation <= ADD;
			state <= IF;
		end
		else case (state)
			IF: begin 
				if(MIO_ready) begin
					`CPU_ctrl_signals <= 17'h00060;
					state <= ID;
					ALU_operation <= ADD;
				end
				else begin
					`CPU_ctrl_signals <= 17'h12821;
					state <= IF;
					ALU_operation <= ADD;
				end
			end
			
			ID: begin
				case (Inst_in[31:26])
					6'h00: begin
						if(Inst_in[5:0] == 6'h08) begin
							`CPU_ctrl_signals <= 17'h10010;
							state <= EX_JR;
							ALU_operation <= ADD;
						end else begin
							`CPU_ctrl_signals <= 17'h00010;
							state <= EX_R;
							case (Inst_in[5:0])
								6'h02: ALU_operation <= SRL;
								6'h20: ALU_operation <= ADD;
								6'h22: ALU_operation <= SUB;
								6'h24: ALU_operation <= AND;
								6'h25: ALU_operation <= OR;
								6'h26: ALU_operation <= XOR;
								6'h27: ALU_operation <= NOR;
								6'h2B: ALU_operation <= SLTU;
								default: ALU_operation <= ADD;
							endcase
						end
					end
					6'h23: begin
						`CPU_ctrl_signals <= 17'h00050;
						state <= EX_MEM;
						ALU_operation <= ADD;
					end
					6'h2B: begin
						`CPU_ctrl_signals <= 17'h00050;
						state <= EX_MEM;
						ALU_operation <= ADD;
					end
					6'h04: begin
						`CPU_ctrl_signals <= 17'h08090;
						state <= EX_BEQ;
						ALU_operation <= SUB;
						Branch <= 1;
					end
					6'h05: begin
						`CPU_ctrl_signals <= 17'h08090;
						state <= EX_BNE;
						ALU_operation <= SUB;
						Branch <= 0;
					end
					6'h08: begin
						`CPU_ctrl_signals <= 17'h00050;
						state <= EX_I;
						ALU_operation <= ADD;
					end
					6'h0C: begin
						`CPU_ctrl_signals <= 17'h00050;
						state <= EX_I;
						ALU_operation <= AND;
					end
					6'h0D: begin
						`CPU_ctrl_signals <= 17'h00050;
						state <= EX_I;
						ALU_operation <= OR;
					end
					6'h0E: begin
						`CPU_ctrl_signals <= 17'h00050;
						state <= EX_I;
						ALU_operation <= XOR;
					end
					6'h0B: begin
						`CPU_ctrl_signals <= 17'h00050;
						state <= EX_I;
						ALU_operation <= SLTU;
					end
					6'h0F:  begin
						`CPU_ctrl_signals <= 17'h00468;
						state <= WB_LUI;
						ALU_operation <= ADD;
					end
					6'h02: begin
						`CPU_ctrl_signals <= 17'h10160;
						state <= EX_J;
						ALU_operation <= ADD;
					end
					6'h03: begin
						`CPU_ctrl_signals <= 17'h1076C;
						state <= EX_JAL;
						ALU_operation <= ADD;
					end
				endcase
			end
			
			EX_MEM: begin
				case (Inst_in[31:26])
					6'h23: begin
						`CPU_ctrl_signals <= 17'h06051;
						state <= MEM_RD;
						ALU_operation <= ADD;
					end
					6'h2B: begin
						`CPU_ctrl_signals <= 17'h05051;
						state <= MEM_WD;
						ALU_operation <= ADD;
					end
				endcase
			end
			
			EX_R: begin
				`CPU_ctrl_signals <= 17'h0001A;
				state <= WB_R;
				ALU_operation <= ADD;
			end
			
			EX_I: begin
				`CPU_ctrl_signals <= 17'h00058;
				state <= WB_I;
				ALU_operation <= ADD;
			end
			
			WB_LUI: begin
				`CPU_ctrl_signals <= 17'h12821;
				state <= IF;
				ALU_operation <= ADD;
			end
			
			EX_BEQ: begin
				`CPU_ctrl_signals <= 17'h12821;
				state <= IF;
				ALU_operation <= ADD;
			end
			
			EX_BNE: begin
				`CPU_ctrl_signals <= 17'h12821;
				state <= IF;
				ALU_operation <= ADD;
			end
			
			EX_JR: begin
				`CPU_ctrl_signals <= 17'h12821;
				state <= IF;
				ALU_operation <= ADD;
			end
			
			EX_JAL: begin
				`CPU_ctrl_signals <= 17'h12821;
				state <= IF;
				ALU_operation <= ADD;
			end
			
			EX_J: begin
				`CPU_ctrl_signals <= 17'h12821;
				state <= IF;
				ALU_operation <= ADD;
			end
			
			MEM_RD: begin
				if(MIO_ready) begin
					`CPU_ctrl_signals <= 17'h00208;
					state <= WB_LW;
					ALU_operation <= ADD;
				end
				else begin
					`CPU_ctrl_signals <= 17'h06051;
					state <= MEM_RD;
					ALU_operation <= ADD;
				end
			end
			
			MEM_WD: begin
				if(MIO_ready) begin
					`CPU_ctrl_signals <= 17'h12821;
					state <= IF;
					ALU_operation <= ADD;
				end
				else begin
					`CPU_ctrl_signals <= 17'h05051;
					state <= MEM_WD;
					ALU_operation <= ADD;
				end
			end
			
			WB_R: begin
				`CPU_ctrl_signals <= 17'h12821;
				state <= IF;
				ALU_operation <= ADD;
			end
			
			WB_I: begin
				`CPU_ctrl_signals <= 17'h12821;
				state <= IF;
				ALU_operation <= ADD;
			end
			
			WB_LW: begin
				`CPU_ctrl_signals <= 17'h12821;
				state <= IF;
				ALU_operation <= ADD;
			end
		endcase
	end
endmodule
