`timescale 1ns/10ps

module t_sm();

	reg En, a, b, rst;
  wire Q;
  sm sm1(a, b, En, Q, rst);
	initial begin
		$dumpfile("sm.vcd");
		$dumpvars;
		rst = 1'b1;
    En = 1'b0;
    a = 1'b0;
    b = 1'b0;
    #20
		rst = 1'b0;
    #30
    a = 1'b1;
    b = 1'b0;
    #50
    a = 1'b0;
    b = 1'b1;
    #50
    a = 1'b0;
    b = 1'b0;
    #50
    a = 1'b1;
    b = 1'b0;
    #50
    a = 1'b0;
    b = 1'b0;
    #50

    $finish;
  end

  always
  begin
    #10 En = ~En;
  end

endmodule