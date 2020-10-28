//`timescale reference_time_unit/time_precision
`timescale 1ns/10ps

module t_HW_4();

// `include "HW_4.v"`


	reg[3 : 0] a,b;
	wire[4 : 0] out_cout;
	HW_4 bcd(a, b, out_cout);
	initial begin
		$dumpfile("HW_4.vcd");
		$dumpvars;
		a = 3; b = 5;
		#50
		a = 5; b = 5;
		#50
		a = 0; b = 9;
		#50
		a = 9; b = 9;
		#50;
	end 

endmodule