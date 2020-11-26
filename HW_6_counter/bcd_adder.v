//BCD adder 
`include "four_adder.v"
module bcd_adder(input [4:0]A,B, output [4:0]out);

wire[4:0] sum;

four_adder get_sum(A, B, 1'b0, sum);

wire and1;
and checker1(and1, sum[1], sum[3]);

four_adder ans((and1*6)&5'b11111, sum, 1'b0, out);

endmodule   