module register(input[31:0] in, input clk, input rst, output reg[31:0] out);
	always @(posedge clk) begin
		if (rst)
			out = 32'd0;
		else 
			out = in;
	end
	
endmodule 