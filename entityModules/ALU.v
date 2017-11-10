module ALU(input [31:0]in1, input [31:0]in2, input [3:0]sel, output reg [31:0]O);
    always @(sel, in1, in2) begin
      case (sel)
        0: O <= in1 + in2;
        1: O <= in1 - in2;
        4: O <= in1 & in2;
        5: O <= in1 | in2;
        7: O <= in1 ^ in2;
        // 8, 9, 10 are left alone :(
		default : O<=32'b0;
      endcase
    end
endmodule 