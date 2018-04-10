module sumador_flotante #(parameter E = 4, parameter M = 8)
	(input logic[E+M-1:0] a, b, 
	input logic cin, 
	output logic[E+M-1:0] s, 
	output logic cout);
	
	assign s = a+b;
	
endmodule
