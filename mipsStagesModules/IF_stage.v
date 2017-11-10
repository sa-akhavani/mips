module IF_stage (input clk, input rst, input Br_taken, input [31:0] Br_offset, output [31:0] PC, output [31:0] Instruction);
	wire[31:0] adderOut, pcOut, Inst;
	wire [31:0] four, myMUX_out;
	assign four	= {32'd4};
	
	PC_adder adder(pcOut, /*myMUX_out*/ four, adderOut);
	register PCreg(adderOut, clk, rst, pcOut);
	InstructionMemory myInstructionMem(pcOut, clk, Inst);
	MUX myMUX(four, Br_offset, myMUX_out);
	
	assign PC = pcOut;
	assign Instruction = Inst;
	
endmodule 