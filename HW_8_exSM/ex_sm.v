`include "mux.v"
`include "adder.v"
`include "d_flip_flop.v"
module ex_mux(a, rst, clk, d);
	input a, rst, clk;
	output d;

    wire apd, fuckad, check_d, check_a, opt_d0, opt_d1, out_d, F_d;
    adder ad_ad(a, d, 1'b0, apd, fuckad);

    mux mpad0(apd, 1'b0, d, opt_d0);
    mux mpad1(apd, 1'b1, d, opt_d1);
    mux mpad(opt_d0, opt_d1, a, opt_d);
    mux mr(opt_d, 1'b0, rst, F_d);
    d_flip_flop dff(F_d, clk, d);
endmodule

module ex_sm(a, b, c, clk, rst, d, e, f);
    input a, b, c, clk, rst;
    output d, e, f;
    ex_mux ad(a, rst, clk, d);
    ex_mux be(b, rst, clk, e);
    ex_mux cf(c, rst, clk, f);
endmodule
