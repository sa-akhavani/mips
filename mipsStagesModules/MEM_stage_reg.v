module MEM_stage_reg(input clk, input rst, input WB_en_in, input MEM_R_EN_in, input[31:0] ALU_result_in, input[31:0] Mem_read_value_in, input[4:0] Dest_in, output reg WB_en, output reg MEM_R_EN, output reg[31:0] ALU_result, output reg[31:0] Mem_read_value, output reg[4:0] Dest);

always @(posedge clk) begin
	if (rst) begin
		MEM_R_EN = 1'bz;
		Mem_read_value = 1'bz;
		ALU_result = 1'bz;
		WB_en = 1'bz;
		Dest = 1'bz;
	end
	else begin
		MEM_R_EN = MEM_R_EN_in;
		Mem_read_value = Mem_read_value_in;
		ALU_result = ALU_result_in;
		WB_en = WB_en_in;
		Dest = Dest_in;
	end
end

endmodule 