module ControlUnit(input clk, input rst, input [5:0]opCode, output reg[1:0]conditionCheck, 
output reg  is_brj, is_imm, st_bne,output reg [1:0] Mem_signals, output reg wbEn, output reg [3:0]exCommand);

reg memRead, memWrite;


always @(*)begin
   Mem_signals = {memRead, memWrite};
	st_bne <= 0;
	is_imm <= 0;
	is_brj <= 0;
	exCommand <= 4'b0000;
	wbEn <= 1;
	memRead <= 0;
	memWrite <= 0;
	conditionCheck <= 2'b11;
	case(opCode)
		6'd1: begin exCommand <= 4'b0000; end
		6'd2: begin exCommand <= 4'b0010; end
		6'd3: begin exCommand <= 4'b0010; end
		6'd4: begin exCommand <= 4'b0101; end
		6'd5: begin exCommand <=  4'b0100; end
		6'd6: begin exCommand <=  4'b0101; end
		6'd7: begin exCommand <=  4'b0110; end
		6'd8: begin exCommand <=  4'b0111; end
		6'd9: begin exCommand <=  4'b1000; end
		6'd10: begin exCommand <= 4'b1000; end
		6'd11: begin exCommand <= 4'b1001; end
		6'd12: begin exCommand <= 4'b1010; end
		6'd32: begin exCommand <= 4'b0000; is_imm <= 1;end
		6'd33: begin exCommand <= 4'b0010; is_imm <= 1; end
		6'd36: begin exCommand <= 4'b0000; memRead <= 1; end
		6'd37: begin exCommand <= 4'b0000; memWrite <= 1; wbEn <= 0; st_bne<=1; end
		6'd40: begin exCommand <= 4'bxxxx; wbEn <= 0; conditionCheck <= 2'b00; is_brj <= 1; is_imm <= 1; end
		6'd41: begin exCommand <= 4'bxxxx; wbEn <= 0; conditionCheck <= 2'b01; is_brj <= 1; st_bne<=1; is_imm <= 1; end
		6'd42: begin exCommand <= 4'bxxxx; wbEn <= 0; conditionCheck <= 2'b10; is_brj <= 1; is_imm <= 1; end
	endcase
end

endmodule 