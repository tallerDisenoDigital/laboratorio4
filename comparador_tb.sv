module comparador_tb ();


	logic[3:0] a,b,mayor,menor;

	comparador_exponentes #(4) comp(a,b,mayor,menor);

	
	initial begin
	
	a = 5;
	b = 4;
	#10
	
	a = 2;
	b = 4;
	#10
	
	a = 5;
	b = 12;
	#10
	
	a = 10;
	b = 4;
	#10
	
	a = 9;
	b = 9;
	#10
	
	a = 14;
	b = 4;
	#10;
	
	end
	
	
	
endmodule

