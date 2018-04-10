module sumador_flotante_tb ();



	logic[31:0] a,b,s;
	//logic[7:0] ea,eb,es;
	//logic[22:0] ma,mb,ms;
	logic exp_out;
	/*	
	assign ea = a[30:23];
	assign eb = b[30:23];
	assign es = s[30:23];
	
	assign ma = a[22:0];
	assign mb = b[22:0];
	assign ms = s[22:0];



	assign a[31] = 0;
	assign b[31] = 0;
   */
	
	sumador_flotante #(8,23) sum_flot(a,b,s,exp_out);

	
	initial begin
	
	
	a = 32'b01000000111111000000000000000000;
	
	b = 32'b00111110010000000000000000000000;
	
	assert (s===32'b01000001000000010000000000000000) $info("7.875 + 0.1875 = 8.0625, success"); else $error("7.875 + 0.1875 = 8.0625. Failed");
	
	#10
	
	a = 32'b11000010010110100011000100100111;
	
	b = 32'b11000010001100100001011110001101;
	
	assert (s===32'b) $info("=)"); else $error("15 + 0 = 15. Failed");
	
	#10
	
	a = 32'b01000010110001110001100010010011;
	
	b = 32'b01000001010001111010111000010100;
	
	assert (s===4'b1010) $info("=)"); else $error("15 + 0 = 15. Failed");
	
	#10
	
	a = 32'b00111111100000000000000000000000;
	
	b = 32'b01000001000011100110011001100110;
	
	assert (s===4'b1010) $info("=)"); else $error("15 + 0 = 15. Failed");
	
	#10
	
	b = 32'b01000001000111100110011001100110;
	
	a = 32'b00000000000000000000000000000000;
	
	assert (s===4'b1010) $info("=)"); else $error("15 + 0 = 15. Failed");
	
	#10
	
	b = 32'b11000100010100110110001101000111;
	
	a = 32'b11000001000010001010001111010111;

	assert (s===4'b1010) $info("=)"); else $error("15 + 0 = 15. Failed");

	
	
	#10;
	
	end



endmodule
