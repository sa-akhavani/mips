module MIPS(input clk50, input rst);

	wire clk;
	assign clk = clk50;
	
	// IF_stage
	wire [31:0] IF_PC, IF_Instruction;
	IF_stage xIF_stage(clk, rst, IDR_Br_taken, IDR_Val2, IF_PC, IF_Instruction);
	
	// IF_stage_Reg
	wire IF_Flush;
	wire [31:0] IFR_PC, IFR_Instruction;
	or ori(IF_Flush, IDR_Br_taken, ID_Br_taken);
	IF_stage_reg xIF_stage_reg(clk, rst, IF_Flush, IF_PC, IF_Instruction, IFR_PC, IFR_Instruction);
	

	// ID_stage
	wire ID_Br_taken, ID_MEM_R_EN, ID_MEM_W_EN, ID_WB_EN;
	wire [5:0] ID_src1, ID_src2, ID_Dest;
	wire [31:0] ID_Reg2, ID_Val1, ID_Val2; // ID_InstOut ??
	wire [3:0] ID_EXE_CMD;
	ID_stage xID_stage(clk, rst, IFR_Instruction, RegFile_reg1 , RegFile_reg2, ID_src1, ID_src2, ID_Dest, ID_Reg2, ID_Val2, ID_Val1, ID_Br_taken, ID_EXE_CMD, ID_MEM_R_EN, ID_MEM_W_EN, ID_WB_EN);
	
	// RegFile
	wire[31:0] RegFile_reg1, RegFile_reg2;
	RegFile xRegFile(clk, rst, WB_WB_en, WB_Dest, WB_Write_Value, ID_src1, ID_src2, RegFile_reg1, RegFile_reg2);
	

	// ID_stage_Reg
	wire IDR_Br_taken, IDR_MEM_R_EN, IDR_MEM_W_EN, IDR_WB_EN;
	wire[3:0] IDR_EXE_CMD;
	wire[4:0] IDR_Dest;
	wire[31:0] IDR_Reg2, IDR_Val2, IDR_Val1, IDR_PC_out; // Branch_Offset = IDR_Val2
	ID_stage_reg xID_stage_reg(clk, rst, ID_Dest, ID_Reg2, ID_Val2, ID_Val1, IFR_PC, ID_Br_taken, ID_EXE_CMD, ID_MEM_R_EN, ID_MEM_W_EN, ID_WB_EN, 
		IDR_Dest, IDR_Reg2, IDR_Val2, IDR_Val1, IDR_PC_out, IDR_Br_taken, 
		IDR_EXE_CMD, IDR_MEM_R_EN, IDR_MEM_W_EN, IDR_WB_EN);
		
	// EXE_stage	
	wire [31:0] EXE_ALU_result;
	EXE_stage xEXE_stage(clk, IDR_EXE_CMD, IDR_Val1, IDR_Val2, EXE_ALU_result);
	
	
	// EXE_stage_reg
	wire EXER_WB_en, EXER_MEM_R_EN, EXER_MEM_W_EN;
	wire [31:0] EXER_PC, EXER_ALU_result, EXER_ST_val;
	wire [4:0] EXER_Dest;
	EXE_stage_reg xEXE_stage_reg(clk, rst, IDR_WB_EN, IDR_MEM_R_EN, IDR_MEM_W_EN, IDR_PC_out, EXE_ALU_result, IDR_Reg2, IDR_Dest, EXER_WB_en, 
		EXER_MEM_R_EN, EXER_MEM_W_EN, EXER_PC, EXER_ALU_result, EXER_ST_val, EXER_Dest);

		
	// MEM_stage
	wire [31:0] MEM_read_value;
	MEM_stage xMEM_stage(clk, rst, EXER_MEM_R_EN, EXER_MEM_W_EN, EXER_ALU_result, EXER_ST_val, MEM_read_value);

	
	// MEM_stage_reg
	wire MEMR_WB_en, MEMR_EM_R_EN;
	wire[31:0] MEMR_ALU_result, MEMR_Mem_read_value;
	wire[4:0] MEMR_Dest;
	MEM_stage_reg xMEM_stage_reg(clk, rst, EXER_WB_en, EXER_MEM_R_EN, EXER_ALU_result, MEM_read_value, EXER_Dest, 
		MEMR_WB_en, MEMR_MEM_R_EN, MEMR_ALU_result, MEMR_Mem_read_value, MEMR_Dest);

	
	// WB_stage
	wire WB_WB_en;
	wire[31:0] WB_Write_Value;
	wire[4:0] WB_Dest;
	WB_stage xWB_stage(clk, MEMR_WB_en, MEMR_MEM_R_EN, MEMR_ALU_result, MEMR_Mem_read_value, MEMR_Dest, 
		WB_WB_en, WB_Write_Value, WB_Dest);
	
endmodule 