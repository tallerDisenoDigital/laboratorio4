module normalizador #(parameter E = 8, parameter M = 8)
	(input logic[M:0] mantisa_entrada,input logic[E-1:0] exponente_entrada,  input cout_mantisa_entrada, 
	 output logic[M-1:0] mantisa_salida, output logic[E-1:0] exponente_salida,output exp_cout);
	 
	 logic[M:0] mantisa_tmp;
	 sumador_simple #(E) sum_exp(exponente_entrada,0,cout_mantisa_entrada, exponente_salida ,exp_cout);
	 parameterizable_shift_right #(M+1) shiftrightdut(mantisa_entrada,cout_mantisa_entrada,mantisa_tmp);
	 assign mantisa_salida = mantisa_tmp[M-1:0];
	 
	 
endmodule

