`timescale 1ns/10ps
module t_fulladder();
	reg [1023:0]A, B;
	wire [1023:0] sum;
    wire Cout;
	full_adder test(A,B,1'b0,sum,Cout);
	initial begin
		$dumpfile("fulladder.vcd");
		$dumpvars;
        A = 1;
        B = 0;
		#100000
		$finish;
	end
endmodule


