`include "d_latch.v"
module d_flip_flop(D, clk, Q);
    input D, clk;
    output Q;
    wire not_clk, tmp;
    not not1(not_clk, clk);
    d_latch first_latch(tmp, D, clk);
    d_latch second_latch(Q, tmp, not_clk);
endmodule