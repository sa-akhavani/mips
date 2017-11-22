module ID_stage (input clk, input rst, input [31:0] Instruction, input [31:0] reg1, input [31:0] reg2,
                output [4:0] src1, output [4:0] src2, output[4:0] Dest, output[31:0] Reg2, output[31:0] Val2,
                output [31:0] Val1, output Br_taken, output[3:0] EXE_CMD, output MEM_R_EN, output MEM_W_EN,
					 output WB_EN);
					 
wire [31:0]extended;
wire [1:0] inConCheck, MEM_Signals;
wire inAND, outConCheck, ST_or_BNE, Is_Imm;

ControlUnit CU(clk, rst, Instruction[31:26], inConCheck, inAND, Is_Imm, ST_or_BNE, MEM_Signals, WB_EN, EXE_CMD);
ConditionCheck myCK(reg1, reg2, inConCheck, outConCheck);
and andami(Br_taken, outConCheck, inAND);
SignExtend mySE(Instruction[15:0], extended);
MUX myMUX(reg2, extended, Is_Imm, Val2);

wire [4:0] mux2_out;
MUX #(5) myMUX2(Instruction[15:11], Instruction[25:21], ST_or_BNE, mux2_out);

assign src2 = mux2_out;

assign Val1 = reg1;
assign Reg2 = reg2;
assign Dest = Instruction[25:21];

assign MEM_W_EN = MEM_Signals[0];
assign MEM_R_EN = MEM_Signals[1];
assign src1 = Instruction[20:16];
endmodule 