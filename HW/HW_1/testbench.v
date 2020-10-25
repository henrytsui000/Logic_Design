//`timescale reference_time_unit/time_precision
`timescale 1ns/10ps

`include "HW_1.v"
`include "pattern.v"

module testbench();

wire a, b, out_nor, out_nand;
pattern pattern_1(.A(a), .B(b));
HW_1 HW_1_1(.A(a), .B(b), .C(out_nor), .D(out_nand));

initial begin
	$fsdbDumpfile("HW_1.fsdb");
	$fsdbDumpvars;
end 

endmodule