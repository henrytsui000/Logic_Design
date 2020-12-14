`timescale 1ns/10ps
module t_ex_sm();
    reg clk, rst;
    reg a, b, c;
	wire d, e, f;
    ex_sm test(a, b, c, clk, rst, d, e, f);
    initial begin
        $dumpfile("ex_sm.vcd");
        $dumpvars;
        clk = 1'b0;
        rst = 1;
        #15
        rst = 0;
		a = 0;
		b = 0;
		c = 0;
		#15
		a = 0;
		b = 1;
		c = 0;
		#15
		a = 1;
		b = 0;
		c = 1;
		#15
		a = 1;
		b = 0;
		c = 0;
		#15
        $finish;
    end
    always begin
        clk = ~clk;
        #5
        clk = clk;
    end
endmodule