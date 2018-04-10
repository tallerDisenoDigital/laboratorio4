module sumador_flotante #(parameter E = 8, parameter M = 23)
	(input logic[E+M:0] a, b, 
	output logic[E+M:0] s, 
	output logic exp_cout);
	
	logic[E-1:0] exp_mayor,exp_menor,not_exp_menor,diff_exp;
	logic[M-1:0] mant_mayor,mant_menor;
	logic[M:0] suma_mant;
	logic exp_cout1,mant_cout;
	comparador_exponentes #(E) comp_exp_dut(a[E+M:M],b[E+M:M],exp_mayor,exp_menor); 
	comparador_mantisas #(M) comp_mant_dut(a[M-1:0],b[M-1:0],mant_menor,mant_mayor);
	
	parameterizable_not #(E) not_exp_dut(exp_menor,not_exp_menor);
	sumador_simple #(E) sum_exp_dut(exp_mayor,not_exp_menor,1, diff_exp,exp_cout1);
	
	logic[M:0] res_exp;
	
	assign res_exp[M:E] = 0;
	assign res_exp[E-1:0] = diff_exp;
	
	suma_mantisas #(M) suma_mant_dut(mant_menor,mant_mayor,res_exp, suma_mant,mant_cout);
	
	normalizador #(E,M) normalizador_dut(suma_mant,exp_mayor, mant_cout, s[M-1:0], s[E+M:M],exp_cout);
	
	assign s[M+E] = a[M+E];
endmodule
