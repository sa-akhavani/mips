module WB_stage (input clk, input WB_en_in, input MEM_R_EN, input [31:0] ALU_result, input [31:0] Mem_read_value, input [4:0] Dest_in, 
					  output WB_en, output [31:0] Write_value, output [4:0] Dest);
wire [31:0] MuxOutput;
MUX myMUX(ALU_result, MEM_read_value, MEM_R_EN, MuxOutput);
assign Write_value = MuxOutput;					  
assign WB_en = WB_en_in;
assign Dest = Dest_in;

endmodule 