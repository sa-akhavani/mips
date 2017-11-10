module SignExtend (input [15:0]I, output [31:0]W);
	assign W = (I[15]) ? {16'b1111111111111111, I[15:0]} : {16'b0000000000000000, I[15:0]} ;
endmodule 