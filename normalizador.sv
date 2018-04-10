module normalizador #(parameter E = 8, parameter M = 8)
	(input logic[M:0] mantisa_entrada,input logic[E-1:0] exponente_entrada,  input cout_mantisa_entrada, 
	 output logic[M-1:0] mantisa_salida, output logic[E-1:0] exponente_salida,output exp_cout);
	 
	 logic[M:0] mantisa_tmp;
	 logic[M:0] shift_value;
	 
	 sumador_simple #(E) sum_exp(exponente_entrada,0,cout_mantisa_entrada, exponente_salida ,exp_cout);
	 
	 
	 assign shift_value[M:1] = 0;
	 assign shift_value[0] = cout_mantisa_entrada;
	 
	 parameterizable_shift_right #(M+1) shiftrightdut(mantisa_entrada,shift_value,mantisa_tmp);
	 
	 assign mantisa_salida = mantisa_tmp[M-1:0];
	 
	 
endmodule

