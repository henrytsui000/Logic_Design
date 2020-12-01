`include "adder.v"
module four_adder(A, B, Cin, sum, Cout);
	input[20:0]A, B;
	input Cin;
	output [20:0]sum;
	output Cout;

	wire W[21:0];

	adder a1(A[0], B[0], Cin, sum[0], W[0]);
	adder a2(A[1], B[1], W[0], sum[1], W[1]);
	adder a3(A[2], B[2], W[1], sum[2], W[2]);
	adder a4(A[3], B[3], W[2], sum[3], W[3]);
	adder a5(A[4], B[4], W[3], sum[4], W[4]);
	adder a6(A[5], B[5], W[4], sum[5], W[5]);
	adder a7(A[6], B[6], W[5], sum[6], W[6]);
	adder a8(A[7], B[7], W[6], sum[7], W[7]);
	adder a9(A[8], B[8], W[7], sum[8], W[8]);
	adder a10(A[9], B[9], W[8], sum[9], W[9]);
	adder a11(A[10], B[10], W[9], sum[10], W[10]);
	adder a12(A[11], B[11], W[10], sum[11], W[11]);
	adder a13(A[12], B[12], W[11], sum[12], W[12]);
	adder a14(A[13], B[13], W[12], sum[13], W[13]);
	adder a15(A[14], B[14], W[13], sum[14], W[14]);
	adder a16(A[15], B[15], W[14], sum[15], W[15]);
	adder a17(A[16], B[16], W[15], sum[16], W[16]);
	adder a18(A[17], B[17], W[16], sum[17], W[17]);
	adder a19(A[18], B[18], W[17], sum[18], W[18]);
	adder a20(A[19], B[19], W[18], sum[19], W[19]);
	adder a21(A[20], B[20], W[19], sum[20], W[20]);

	assign Cout = W[20];

endmodule