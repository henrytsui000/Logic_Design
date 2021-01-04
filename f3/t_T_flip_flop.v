`timescale 1ns/10ps

module t_T_flip_flop();

	reg En, T, rst;
	wire Q;
	t_flip_flop ff1(T, En, Q, rst);
	initial begin
		$dumpfile("T_flip_flop.vcd");
		$dumpvars;
		
		En = 1'b0;
		rst = 1;
		T = 0;
		#50
		rst = 0;
		T = 0;
		#60
		T = 1;
		#70
		T = 0;
		#65
		T = 1;
		#80

		$finish;
	end

	always
	begin
		#5 En = ~En;
	end

endmodule