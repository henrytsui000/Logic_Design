`include "d_latch.v"
module D_flip_flop(input D, En, output reg Q);

wire not_clk;
not not1(not_clk,En);
d_latch first_latch(,En);
d_latch second_latch()

endmodule