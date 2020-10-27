
`include "adder.v"
module four_adder(input [4:0]A, B,input Cin, output [4:0]sum);

wire W[4:0];

adder a1(A[0], B[0], Cin, sum[0], W[0]);
adder a2(A[1], B[1], W[0], sum[1], W[1]);
adder a3(A[2], B[2], W[1], sum[2], W[2]);
adder a4(A[3], B[3], W[2], sum[3], W[3]);
adder a5(A[4], B[4], W[3], sum[4], W[4]);

endmodule