`include "checkbig.v"
`include "mux.v"
module sorting(a_0, b_0, c_0, d_0, a_4, b_4, c_4, d_4);
	input [3:0] a_0, b_0, c_0, d_0;
	wire [3:0] a_1, b_1, c_1, d_1;
	wire [3:0] a_2, b_2, c_2, d_2;
	wire [3:0] a_3, b_3, c_3, d_3;
	output [3:0] a_4, b_4, c_4, d_4;

	checkbig ab_1 (a_0, b_0, res_ab1);
	mux ma_1 [3:0](a_0, b_0, res_ab1, a_1);
	mux mb_1 [3:0](b_0, a_0, res_ab1, b_1);
	checkbig cd_1 (c_0, d_0, res_cd1);
	mux mc_1 [3:0](c_0, d_0, res_cd1, c_1);
	mux md_1 [3:0](d_0, c_0, res_cd1, d_1);

	assign a_2 = a_1;
	checkbig bc_2 (b_1, c_1, res_bc2);
	mux mb_2 [3:0](b_1, c_1, res_bc2, b_2);
	mux mc_2 [3:0](c_1, b_1, res_bc2, c_2);
	assign d_2 = d_1;

	checkbig ab_3 (a_2, b_2, res_ab3);
	mux ma_3 [3:0](a_2, b_2, res_ab3, a_3);
	mux mb_3 [3:0](b_2, a_2, res_ab3, b_3);
	checkbig cd_3 (c_2, d_2, res_cd3);
	mux mc_3 [3:0](c_2, d_2, res_cd3, c_3);
	mux md_3 [3:0](d_2, c_2, res_cd3, d_3);

	assign a_4 = a_3;
	checkbig bc_4 (b_3, c_3, res_bc4);
	mux mb_4 [3:0](b_3, c_3, res_bc4, b_4);
	mux mc_4 [3:0](c_3, b_3, res_bc4, c_4);
	assign d_4 = d_3;

endmodule