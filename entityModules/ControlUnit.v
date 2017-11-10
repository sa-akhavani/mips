module ControlUnit(input clk, input rst, input [5:0] opcode, 
		output reg [1:0] inConCheck, output reg inAND, output reg Is_Imm, output reg ST_or_BNE, 
		output reg Mem_signals, output reg WB_En, output reg [3:0] EXE_CMD);
reg MEM_R_EN, MEM_W_EN;

 always@ (posedge clk, posedge rst) begin
    {EXE_CMD, MEM_R_EN, MEM_W_EN, WB_En, Is_Imm, inAND, ST_or_BNE, inConCheck} = 12'b0;
   Mem_signals = {MEM_R_EN, MEM_W_EN};
   case(opcode)
	6'd0: begin //NOP
		EXE_CMD <= 4'd0;
    end
    6'd1: begin //ADD
		EXE_CMD <= 4'd1;
		WB_En <= 1'd1;
    end
    6'd3: begin //SUB
		EXE_CMD <= 4'd2;
		WB_En <= 1'd1;
    end
    6'd5: begin //AND
		EXE_CMD <= 4'd4;
		WB_En <= 1'd1;
    end
    6'd6: begin //Or
		EXE_CMD <= 4'd5;
		WB_En <= 1'd1;
    end
    6'd7: begin //NOR
		EXE_CMD <= 4'd6;
		WB_En <= 1'd1;
    end
    6'd8: begin //XOR
		EXE_CMD <= 4'd7;
		WB_En <= 1'd1;
    end
    6'd9: begin //SLA
		EXE_CMD <= 4'd8;
		WB_En <= 1'd1;
    end
    6'd10: begin //SLL
		EXE_CMD <= 4'd8;
		WB_En <= 1'd1;
    end
    6'd11: begin //SRA
		EXE_CMD <= 4'd9;
		WB_En <= 1'd1;
    end
    6'd12: begin //SRL
		EXE_CMD <= 4'd10;
		WB_En <= 1'd1;
    end

	 
    6'd32: begin //ADDI
		EXE_CMD <= 4'd1;
		Is_Imm <= 1'd1;
		WB_En <= 1'd1;
    end
    6'd33: begin //SUBI
		EXE_CMD <= 4'd2;
		Is_Imm <= 1'd1;
		WB_En <= 1'd1;
    end
    6'd36: begin //LD
		EXE_CMD <= 4'd0;
	    MEM_R_EN <= 1'd1;
		WB_En <= 1'd1;
    end
    6'd37: begin //ST
		EXE_CMD <= 4'd0;
		MEM_W_EN <= 1'd1;
		ST_or_BNE <= 1'd1;
	end
	6'd40: begin //BEZ
		EXE_CMD <= 4'd0;
		inAND <= 1'd1;
		inConCheck <= 2'd0;
    end
	6'd41: begin //BNE
		EXE_CMD <= 4'd0;
		inAND <= 1'd1;
		inConCheck <= 2'd1;
		ST_or_BNE <= 1'd1;
		
    end
	6'd42: begin //JMP
		EXE_CMD <= 4'd0;
		inAND <= 1'd1;
		inConCheck <= 2'd2;
    end
	 
   endcase
 end
endmodule
