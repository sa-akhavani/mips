module MUX #(parameter busSize=32)
  (input [busSize-1:0] I1, I2, input sel, output reg [busSize-1:0] O);
   always@ (*)
   case(sel)
		1'b0 : O<=I1;
		1'b1 : O<=I2;
	default : O<=I1;
	endcase
 endmodule
