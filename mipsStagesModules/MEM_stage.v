module MEM_stage (input clk, input rst, input MEM_R_EN_in, MEM_W_EN_in, input [31:0] ALU_result_in, input [31:0]ST_val, output[31:0] Mem_read_value);

	Memory xMemory(clk, rst, MEM_R_EN_in, MEM_W_EN_in, ALU_result_in, ST_val, Mem_read_value);

endmodule 