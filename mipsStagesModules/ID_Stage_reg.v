module ID_stage_reg (input clk, input rst, input[4:0] Dest_in, input[31:0] Reg2_in, input[31:0] Val2_in, input[31:0] Val1_in, input[31:0] PC_in, input Br_taken_in, input [3:0] EXE_CMD_in, input MEM_R_EN_in, input MEM_W_EN_in, input WB_EN_in, 
    output reg[4:0] Dest, output reg[31:0] Reg2, output reg[31:0] Val2, output reg[31:0] Val1, output reg[31:0] PC_out, output reg Br_taken, output reg[3:0] EXE_CMD, output reg MEM_R_EN, output reg MEM_W_EN, output reg WB_EN);
always @(posedge clk) begin
	if (rst) begin
		Dest = 5'd0;
		PC_out = 32'd0;
		Reg2 = 32'd0;
		Val2 = 32'd0;
		Val1 = 32'd0;
		Br_taken = 1'd0;
		EXE_CMD = 4'd0;
		MEM_R_EN = 1'd0;
		MEM_W_EN = 1'd0;
		WB_EN = 1'd0;
	end
	else begin
		Dest = Dest_in;
		PC_out = PC_in;
		Reg2 = Reg2_in;
		Val2 = Val2_in;
		Val1 = Val1_in;
		Br_taken = Br_taken_in;
		EXE_CMD = EXE_CMD_in;
		MEM_R_EN = MEM_R_EN_in;
		MEM_W_EN = MEM_W_EN_in;
		WB_EN = WB_EN_in;
	end
end

endmodule