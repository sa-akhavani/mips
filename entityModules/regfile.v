module RegFile(input clk, input reset, input write, input [4:0] wrAddr, input [31:0] wrData,
					input [4:0] rdAddrA, input [4:0] rdAddrB, output [31:0] rdDataA, output [31:0] rdDataB);

   reg[31:0] regfile[0:31];
   
//   always @(*) regfile[0] <= 32'b0;
   
   initial begin
		regfile[0] = 32'b00000000000000000000000000000000;		
      regfile[1] = 32'b00000000000000000000000000000001;
      regfile[2] = 32'b00000000000000000000000000000010;
      regfile[3] = 32'b00000000000000000000000000000011;
      regfile[4] = 32'b00000000000000000000000000000100;
      regfile[5] = 32'b00000000000000000000000000100000;
      regfile[6] = 32'b00000000000000000000000000010000;
      regfile[7] = 32'b00000000000000000000001000000000;
      regfile[8] = 32'b00000000000000000000000010000000;
      regfile[9] = 32'b00000000000000000000000000100000;
      regfile[10] = 32'b00000000000000000000010000000000;
      regfile[11] = 32'b00000000000000000000000100000000;
      regfile[12] = 32'b00000000000000000000000000010010;
      regfile[13] = 32'b00000000000000000000000010100000;
      regfile[14] = 32'b00000000000000000000000000111000;
      regfile[15] = 32'b00000000000000000000011001000000;
      regfile[16] = 32'b00000000000000000000000000100000;
      regfile[17] = 32'b00000000000000000000000000010000;
      regfile[18] = 32'b00000000000000000000000010100000;
      regfile[19] = 32'b00000000000000000000000001000000;
      regfile[20] = 32'b00000000000000000000000101000000;
      regfile[21] = 32'b00000000000000000010000000000000;
      regfile[22] = 32'b00000000000000000001000000000000;
      regfile[23] = 32'b00000000000000000000100000000000;
      regfile[24] = 32'b00000000000000001000000100000000;
      regfile[25] = 32'b00000000000000001100100000000000;
      regfile[26] = 32'b00000000000000000000000100000000;
      regfile[27] = 32'b00000000000000000100100000000000;
      regfile[28] = 32'b00000000000000000000100001000000;
      regfile[29] = 32'b00000000000000000000000100010000;
      regfile[30] = 32'b00000000000010100010000000000000;
      regfile[31] = 32'b00000000000000010000100101100000;
	end
	
   assign rdDataA = regfile[rdAddrA];
   assign rdDataB = regfile[rdAddrB];
	
   always @(negedge clk) begin
    	 if (write) regfile[wrAddr] <= wrData;
   end
endmodule
