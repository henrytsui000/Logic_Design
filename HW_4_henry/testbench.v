//`timescale reference_time_unit/time_precision
`timescale 1ns/10ps

`include "HW_4.v"
`include "pattern.v"

module testbench();

wire[4 : 0] a,b;
wire[5 : 0] out_cout;
pattern pattern_1(.A(a), .B(b));
HW_4 HW_4_1(.A(a), .B(b), .out(out_cout));

initial begin
	$fsdbDumpfile("HW_4.fsdb");
	$fsdbDumpvars;
end 

endmodule