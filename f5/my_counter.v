`include "d_flip_flop.v"
module my_counter(clk, X_1, Q_A, Q_B, Q_C, rst);
    input rst, clk, X_1;
    output Q_A, Q_B, Q_C;
    wire not_A, not_B, not_C, A, B, C;
    wire Z_1;


    not (not_A, Q_A);
    not (not_B, Q_B);
    not (not_C, Q_C);
    not (not_X, X_1);

    wire Z_2, Z_3;
    and (Z_2, not_X, not_B);
    and (Z_3, X_1, Q_B);
    or (Z_1, Z_2, Z_3);

    wire C_1, C_2;
    and (C_1, not_A, not_B, not_C, not_X);
    and (C_2, Q_A, X_1);
    or (nxt_C, C_1, C_2);

    wire B_1, B_2, B_3;
    and (B_1, not_A, not_B, not_C, not_X);
    and (B_2, not_A, Q_B, Q_C, not_X);
    and (B_3, not_A, not_B, not_C, Q_X);
    or (nxt_B, B_1, B_2, B_3);

    wire A_1, A_2, A_3;
    and (A_1, not_A, Q_B, not_C, not_X);
    and (A_2, not_A, not_B, Q_C, X_1);
    and (A_3, not_A, Q_B, not_C, not_X);
    or (nxt_A, A_1, A_2, A_3);

    not (not_rst, rst);
    and (Q_A, not_rst, A);
    and (Q_B, not_rst, B);
    and (Q_C, not_rst, C);
    d_flip_flop DFFA(nxt_A, clk, A);
    d_flip_flop DFFB(nxt_B, clk, B);
    d_flip_flop DFFC(nxt_C, clk, C);
endmodule

