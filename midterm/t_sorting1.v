`timescale 1ns/10ps
module t_sorting();
	reg [3:0] a_0, b_0, c_0, d_0;
	wire [3:0] a_4, b_4, c_4, d_4;
	sorting1 test(a_0, b_0, c_0, d_0, a_4, b_4, c_4, d_4);
	initial begin
		$dumpfile("sorting.vcd");
		$dumpvars;
		a_0 = 0;
		b_0 = 5;
		c_0 = 3;
		d_0 = 2;
		#300
		$finish;
	end
endmodule
