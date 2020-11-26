`include "checkbig.v"
`include "mux.v"
module sorting(a_0, b_0, c_0, d_0, a_4, b_4, c_4, d_4);
	input [31:0] a_0, b_0, c_0, d_0;
	wire [31:0] a_1, b_1, c_1, d_1;
	wire [31:0] a_2, b_2, c_2, d_2;
	wire [31:0] a_3, b_3, c_3, d_3;
	output [31:0] a_4, b_4, c_4, d_4;

	checkbig ab_1 (a_0, b_0, res_ab1);
	mux m_a_1 [31:0](a_0, b_0, res_ab1, a_1);
	mux m_b_1 [31:0](b_0, a_0, res_ab1, b_1);
	checkbig cd_1 (c_0, d_0, res_cd1);
	mux m_c_1 [31:0](c_0, d_0, res_cd1, c_1);
	mux m_d_1 [31:0](d_0, c_0, res_cd1, d_1);

	assign a_2 = a_1;
	checkbig bc_2 (b_1, c_1, res_bc2);
	mux m_b_2 [31:0](b_1, c_1, res_bc2, b_2);
	mux m_c_2 [31:0](c_1, b_1, res_bc2, c_2);
	assign d_2 = d_1;

	checkbig ab_3 (a_2, b_2, res_ab3);
	mux m_a_3 [31:0](a_2, b_2, res_ab3, a_3);
	mux m_b_3 [31:0](b_2, a_2, res_ab3, b_3);
	checkbig cd_3 (c_2, d_2, res_cd3);
	mux m_c_3 [31:0](c_2, d_2, res_cd3, c_3);
	mux m_d_3 [31:0](d_2, c_2, res_cd3, d_3);

	assign a_4 = a_3;
	checkbig bc_4 (b_3, c_3, res_bc4);
	mux m_b_4 [31:0](b_3, c_3, res_bc4, b_4);
	mux m_c_4 [31:0](c_3, b_3, res_bc4, c_4);
	assign d_4 = d_3;

endmodule