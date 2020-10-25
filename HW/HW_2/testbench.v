//`timescale reference_time_unit/time_precision
`timescale 1ns/10ps

`include "HW_2.v"
`include "pattern.v"

module testbench();

wire a, b, out_xor;
pattern pattern_1(.A(a), .B(b));
HW_2 HW_2_1(.A(a), .B(b), .C(out_xor));

initial begin
	$fsdbDumpfile("HW_2.fsdb");
	$fsdbDumpvars;
end 

endmodule