`include "d_flip_flop.v"
module my_counter(clk, Q_A, Q_B, Q_C, rst);
    input rst, clk;
    output Q_A, Q_B, Q_C;
    wire not_A, not_B, not_C, A, B, C;
    wire nxt_A, nxt_B, nxt_C;
    not (not_A, Q_A);
    not (not_B, Q_B);
    not (not_C, Q_C);

    and (nxt_A, not_A, not_C);
    and (nxt_B, not_B, Q_C);
    wire C_1;
    and (C_1, Q_B, not_C);
    or (nxt_C, Q_A, C_1);

    not (not_rst, rst);
    and (Q_A, not_rst, A);
    and (Q_B, not_rst, B);
    and (Q_C, not_rst, C);
    d_flip_flop DFFA(nxt_A, clk, A);
    d_flip_flop DFFB(nxt_B, clk, B);
    d_flip_flop DFFC(nxt_C, clk, C);
endmodule