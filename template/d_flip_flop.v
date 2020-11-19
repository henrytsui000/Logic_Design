`include "d_latch.v"
module d_flip_flop(D, clk, Q);
    input [4:0]D, clk;
    output [4:0]Q;
    wire not_clk, tmp;
    not not1(not_clk, En);
    d_latch first_latch(tmp, D, clk);
    d_latch second_latch(Q, tmp, not_clk);
endmodule