//BCD adder 
`include "four_adder.v"
module HW_4(input [4:0]A,B, output [4:0]out);

wire[4:0] sum;

four_adder get_sum(A, B, 1'b0, sum);

wire and1, and2, or1, key;
and checker1(and1, sum[1], sum[3]);
and checker2(and2, sum[2], sum[3]);

or checker3(or1, and2, sum[4]);
or S(key, and1, or1);

four_adder ans((key*6)&5'b11111, sum, 1'b0, out);

	
endmodule