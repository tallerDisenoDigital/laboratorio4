module comparador_exponentes (parameter bus_numero = 12, bus_exponente = 2, bus_mantisa = 8)
	(input logic[bus_numero-1:0] a,b, output logic[bus_numero-1:0] menor,mayor)

	
	if (a <= b)
	begin
		assign menor = a;
		assign mayor = b;
	end
	else
	begin
		assign menor = b;
		assign mayor = a;
	end
	
endmodule
