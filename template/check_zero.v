module check_zero(A, Q);
	input [3:0] A;
	output Q;
	wire ret;

	or ans(ret, A[3], A[2], A[1], A[0]);
	not not1(Q, ret);
endmodule