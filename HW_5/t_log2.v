`timescale 1ns/10ps
`define N 8
module t_HW_5();

	reg [`N-1:0]in;
    wire [`N-1:0] out;
    HW_5 log2(in, out);
	initial begin
		$dumpfile("log2.vcd");
		$dumpvars;

    in = 3'b000;
    #50
    in = 3'b010;
    #50
    in = 3'b100;
    #50
    in = 3'b111;
    #50

    $finish;
  end
endmodule