module PC_adder(input[31:0] in1, input[31:0] in2, output [31:0] out);
	wire cout;
	assign {cout,out} = in1 + in2;
endmodule 