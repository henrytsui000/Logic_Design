`timescale 1ns/10ps

module t_my_counter();

	reg En, T, rst;
	wire Q_A, Q_B, Q_C;
	my_counter ff1(En, Q_A, Q_B, Q_C, rst);
	initial begin
		$dumpfile("my_counter.vcd");
		$dumpvars;
        rst = 1;
        En = 1;
        #10;
        rst = 0;
		#300

		$finish;
	end

	always
	begin
		#5 En = ~En;
	end

endmodule