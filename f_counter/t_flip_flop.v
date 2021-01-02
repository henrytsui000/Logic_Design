`include "d_flip_flop.v"
module t_flip_flop(T, clk, real_Q, rst);
    input T, clk, rst;
    wire not_rst;
    wire xor_T, Q;
    output real_Q;

    not (not_rst, rst);
    xor (xor_T, real_Q, T);
    and (real_Q, Q, not_rst);
    d_flip_flop DFF(xor_T, clk, Q);
endmodule