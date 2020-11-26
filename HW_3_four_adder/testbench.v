//`timescale reference_time_unit/time_precision
`timescale 1ns/10ps

`include "HW_3_1.v"
`include "pattern.v"

module testbench();

wire[3:0] a, b, out_sum;
wire c, out_cout;
pattern pattern_1(.A(a), .B(b), .C(c));
HW_3_1 HW_1_3_1(.A(a), .B(b), .Cin(c), .sum(out_sum), .Cout(out_cout));

initial begin
	$fsdbDumpfile("HW_3_1.fsdb");
	$fsdbDumpvars;
end 

endmodule