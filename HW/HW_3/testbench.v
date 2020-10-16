//`timescale reference_time_unit/time_precision
`timescale 1ns/10ps

`include "HW_3.v"
`include "pattern.v"

module testbench();

wire[3:0] a, b, out_sum;
wire c, out_cout;
pattern pattern_1(.A(a), .B(b), .C(c));
HW_3 HW_3_1(.A(a), .B(b), .C(c), .D(out_sum), .E(out_cout));

initial begin
	$fsdbDumpfile("HW_3.fsdb");
	$fsdbDumpvars;
end 

endmodule