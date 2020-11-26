`timescale 1ns/10ps
module t_HW_4();

	reg[3 : 0] a,b;
	wire[3 : 0] out_cout;
	wire Cout;
	four_adder adder(a, b, 1'b0, out_cout, Cout);
	initial begin
		$dumpfile("full_adder.vcd");
		$dumpvars;
		a = 3; b = -5;
		#50
		a = 5; b = -5;
		#50
		a = -2; b = 5;
		#50
		a = -8; b = -6;
		#50;
	end 

endmodule