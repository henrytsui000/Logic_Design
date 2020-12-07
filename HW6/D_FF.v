`include "D_latch.v"

module D_FF(D, clk, Q);
input D, clk;
output Q;
wire not_clk, P;

not (not_clk, clk);

D_latch D_latch1(D, not_clk, P);
D_latch D_latch2(P, clk, Q);

endmodule