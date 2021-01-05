`timescale 1ns/10ps

module t_my_counter();

	reg En, rst, X_1;
	wire Q_A, Q_B, Q_C;
	my_counter ff1(En, X_1, Q_A, Q_B, Q_C, rst);
	initial begin
		$dumpfile("my_counter.vcd");
		$dumpvars;
        rst = 1;
        En = 1;
		X_1 = 0;
        #10;
        rst = 0;
		X_1 = 0;
		#300
		X_1 = 1;
		#300

		$finish;
	end

	always
	begin
		#5 En = ~En;
	end

endmodule