`include "t_flip_flop.v"
module my_counter(clk, Q_A, Q_B, Q_C, rst);
    input rst, clk;
    output Q_A, Q_B, Q_C;
    wire not_A, not_B, not_C;
    wire T_A, T_B, T_C;
    not (not_A, Q_A);
    not (not_B, Q_B);
    not (not_C, Q_C);

    wire Ta_1, Ta_2, Ta_3;
    and (Ta_1, Q_B, Q_A, not_C);
    and (Ta_2, Q_C, not_B);
    and (Ta_3, not_A, Q_C);
    or (T_A, Ta_1, Ta_2, Ta_3);

    wire Tb_1, Tb_2;
    and (Tb_1, not_C, not_B);
    and (Tb_2, Q_C, Q_B, Q_A);
    or (T_B, Tb_1, Tb_2);

    wire Tc_1, Tc_2;
    and (Tc_1, not_A, not_C);
    and (Tc_2, not_A, not_B);
    or (T_C, Tc_1, Tc_2);

	t_flip_flop ffA(T_A, clk, Q_A, rst);
	t_flip_flop ffB(T_B, clk, Q_B, rst);
	t_flip_flop ffC(T_C, clk, Q_C, rst);
endmodule