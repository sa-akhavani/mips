module InstructionMemory(input [31:0] PC, input clk, output reg[31:0] Instruction);

reg [7:0] instmem [127:0];

always @(*) begin

	{instmem[0],instmem[1],instmem[2],instmem[3]} = {32'd0};
	{instmem[4],instmem[5],instmem[6],instmem[7]} = {32'd0};
	{instmem[8],instmem[9],instmem[10],instmem[11]} = {32'd0};
	{instmem[12],instmem[13],instmem[14],instmem[15]} = {32'd0};
	{instmem[16],instmem[17],instmem[18],instmem[19]} = {32'b10000000001000100000000000000111};
				
end

always @(posedge clk) begin
	Instruction = {instmem[PC], instmem[PC+1], instmem[PC+2], instmem[PC+3]};
end

endmodule 