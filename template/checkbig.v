module checkbig(A, B, Q);
	input [3:0] A, B;
	output Q;
	wire [3:0] rev_B, bit, rev_xor, state;
	not not3(rev_B[3], B[3]);
	not not2(rev_B[2], B[2]);
	not not1(rev_B[1], B[1]);
	not not0(rev_B[0], B[0]);

	xor xor3(bit[3], A[3], B[3]);
	xor xor2(bit[2], A[2], B[2]);
	xor xor1(bit[1], A[1], B[1]);
	xor xor0(bit[0], A[0], B[0]);

	not not7(rev_xor[3], bit[3]);
	not not6(rev_xor[2], bit[2]);
	not not5(rev_xor[1], bit[1]);
	not not4(rev_xor[0], bit[0]);

	and and3(state[3], A[3], rev_B[3]);
	and and2(state[2], A[2], rev_B[2], rev_xor[3]);
	and and1(state[1], A[1], rev_B[1], rev_xor[3], rev_xor[2]);
	and and0(state[0], A[0], rev_B[0], rev_xor[3], rev_xor[2], rev_xor[1]);

	or ans(Q, state[3], state[2], state[1], state[0]);
endmodule