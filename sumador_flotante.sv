module sumador_flotante #(parameter E = 4, parameter M = 8)
	(input logic[E+M-1:0] a, b, 
	output logic[E+M-1:0] s, 
	output logic exp_cout);
	
	logic[E-1:0] exp_mayor,exp_menor,not_exp_menor,diff_exp;
	logic[M-1:0] mant_mayor,mant_menor;
	logic[M:0] suma_mant;
	logic exp_cout1,mant_cout;
	comparador_exponentes #(E) comp_exp_dut(a[E+M-2:M],b[E+M-2:M],exp_mayor,exp_menor); 
	comparador_mantisas #(M) comp_mant_dut(a[M-1:0],b[M-1:0],mant_menor,mant_mayor);
	
	parameterizable_not #(E) not_exp_dut(exp_menor,not_exp_menor);
	sumador_simple #(E) sum_exp_dut(exp_mayor,not_exp_menor,1, diff_exp,exp_cout1);
	suma_mantisas #(M) suma_mant_dut(mant_menor,mant_mayor,diff_exp, suma_mant,mant_cout);
	
	normalizador #(E,M) normalizador_dut(suma_mant,exp_mayor, mant_cout, s[M-1:0], s[E+M-2:M],exp_cout);
	
	
endmodule
