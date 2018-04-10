module comparador_mantisas #(parameter bus = 8)
	(input logic[bus-1:0] a,b, output logic[bus-1:0] mayor,menor);
	
	logic select;
	comparador #(bus) compdut(a,b,select);
	swap_bus #(bus) swapdut(a,b,~select,mayor,menor);
	
	
endmodule
