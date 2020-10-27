`timescale 1ns/10ps

module t_flip_flop();


	reg En,D;
    wire Q;
    flip_flop ff1(D, En, Q);
	initial begin
		$dumpfile("flip_flop.vcd");
		$dumpvars;
		
    En = 1'b0;

    D = 0;
    #50
    D = 1;
    #50
    D = 0;
    #50
    D = 1;
    #50

    $finish;
  end

  always
  begin
    #25 En = ~En;
  end

endmodule