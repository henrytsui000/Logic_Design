`include "d_flip_flop.v"
module my_counter(clk, Q_A, Q_B, Q_C, rst);
    input rst, clk;
    output Q_A, Q_B, Q_C;
    wire not_A, not_B, not_C, A, B, C;
    wire nxt_A, nxt_B, nxt_C;
    not (not_A, Q_A);
    not (not_B, Q_B);
    not (not_C, Q_C);

    wire C_1, C_2;
    and (C_1, Q_C, Q_A);
    and (C_2, Q_B, not_A);
    or (nxt_C, C_1, C_2);

    wire B_1;
    and (B_1, Q_B, not_A);
    or (nxt_B, B_1, not_C);

    wire A_1, A_2, A_3;
    and (A_1, not_C, not_B);
    and (A_2, Q_C, Q_B);
    and (A_3, not_B, not_A);
    or (nxt_A, A_1, A_2, A_3);

    not (not_rst, rst);
    and (Q_A, not_rst, A);
    and (Q_B, not_rst, B);
    and (Q_C, not_rst, C);
    d_flip_flop DFFA(nxt_A, clk, A);
    d_flip_flop DFFB(nxt_B, clk, B);
    d_flip_flop DFFC(nxt_C, clk, C);
endmodule