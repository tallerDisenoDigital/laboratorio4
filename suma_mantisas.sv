module suma_mantisas #(parameter bus = 8)
	(input logic[bus-1:0] a,b,shamt, output logic[bus:0] s,output logic cout);
	
	logic[bus:0] extended_a,extended_b,extended_shift,shifted_a;
	logic cin;
	assign cin = 0;
	assign extended_a[bus] = 1;
	assign extended_b[bus] = 1;
	assign extended_shift[bus] = 0;
	assign extended_a[bus-1:0] = a[bus-1:0];
	assign extended_b[bus-1:0] = b[bus-1:0];
	assign extended_shift[bus-1:0] = shamt[bus-1:0];

	
	parameterizable_shift_right #(bus+1) shiftrightdut(extended_a,extended_shift,shifted_a);
	
	sumador_simple #(bus+1) sum(shifted_a,extended_b,cin, s ,cout);

endmodule
