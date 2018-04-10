module comparador #(parameter bus = 8)
	(input logic[bus-1:0] a,b, output logic out);
	
	logic[bus-1:0] notb,temp_out;
	logic cin,cout;
	assign cin = 1;
	parameterizable_not #(bus) notdut(b,notb);	
	sumador_simple #(bus) sum(a,notb,cin,temp_out,cout);

	assign out = cout ^ ~( |(temp_out) );
	
endmodule
