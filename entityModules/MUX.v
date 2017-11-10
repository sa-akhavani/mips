module MUX #(parameter busSize=32)
  (input [busSize-1:0] I1, I2, input [1:0] sel, output reg [busSize-1:0] O);
   always@ (*)
   case(sel)
	2'b00 : O<=I1;
	2'b01 : O<=I2;
	default : O<=I1;
	endcase
 endmodule
