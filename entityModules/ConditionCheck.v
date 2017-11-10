module ConditionCheck(input[31:0] reg1, input[31:0] reg2, input[1:0] in, output reg out);
always@(*) begin
    if (in == 0 && reg1 == 0)
		out = 1;
	 else if (in == 1 && reg1 == reg2)
	   out = 1;
	 else if (in == 2)
      out = 1;
    else
      out = 0;
end
endmodule 