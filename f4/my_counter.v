`include "d_flip_flop.v"
module my_counter(clk, X_1, X_2, out_z, rst);
    input rst, clk, X_1, X_2;
    output out_z;
    wire Q_1, Q_2;
    wire nxt_Q1, nxt_Q2;

    and (out_z, Q_1, Q_2);
    
    wire Q1_1, Q1_2, Q1_3;
    and (Q1_1, X_1, X_2, Q_1);
    and (Q1_2, Q_1, Q_2);
    and (Q1_3, X_1, Q_2);
    or (nxt_Q1, Q1_1, Q1_2, Q1_3);

    wire not_Q1, not_X1, not_Q2, not_X2;
    not (not_Q1, Q_1);
    not (not_X1, X_1);
    not (not_Q2, Q_2);
    not (not_X2, X_2);

    wire Q2_1, Q2_2, Q2_3, Q2_4;
    and (Q2_1, X_1, not_Q1);
    and (Q2_2, Q_2, not_X1);
    and (Q2_3, X_2, not_Q1);
    and (Q2_4, X_1, not_X2, not_Q2);
    or (nxt_Q2, Q2_1, Q2_2, Q2_3, Q2_4);


    wire real_nxt_Q1, real_nxt_Q2, not_rst;
    not (not_rst, rst);
    and (real_nxt_Q1, not_rst, nxt_Q1);
    and (real_nxt_Q2, not_rst, nxt_Q2);
    d_flip_flop DFFA(real_nxt_Q1, clk, Q_1);
    d_flip_flop DFFB(real_nxt_Q2, clk, Q_2);
endmodule