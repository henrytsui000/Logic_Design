`timescale 1ns/10ps

module t_my_counter();

	reg En, rst, X_1, X_2;
	wire out_Z;
	my_counter ff1(En, X_1, X_2, out_Z, rst);
	initial begin
		$dumpfile("my_counter.vcd");
		$dumpvars;
        rst = 1;
        En = 1;
        #10;
        rst = 0;
		X_1 = 0;
		X_2 = 0;
		#20
		X_1 = 1;
		X_2 = 1;
		#40

		$finish;
	end

	always
	begin
		#5 En = ~En;
	end

endmodule