`include "t_flip_flop.v"
module my_counter(clk, Q_A, Q_B, Q_C, rst);
    input rst, clk;
    output Q_A, Q_B, Q_C;
    wire not_A, not_B, not_C;
    wire T_A, T_B, T_C;
    not (not_A, Q_A);
    not (not_B, Q_B);
    not (not_C, Q_C);

    and (T_A, Q_B, not_C);
    or (T_B, Q_A, not_B, Q_C);
    wire Tc_1, Tc_2;
    and (Tc_1, not_B, Q_C);
    and (Tc_2, not_A, Q_B, not_C);
    or (T_C, Tc_1, Tc_2);

	t_flip_flop ffA(T_A, clk, Q_A, rst);
	t_flip_flop ffB(T_B, clk, Q_B, rst);
	t_flip_flop ffC(T_C, clk, Q_C, rst);
endmodule