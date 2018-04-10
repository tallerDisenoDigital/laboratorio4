module swap_bus #(bus = 8)
	(input logic[bus-1:0] a,b, input logic select, output logic[bus-1:0] out1,out2);
	
	assign out1 = select? a:b;
	assign out2 = select? b:a;
	
	
endmodule

