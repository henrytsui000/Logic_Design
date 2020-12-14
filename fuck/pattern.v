`timescale 1ns/1ps
`define CYCLE_TIME 15.0
`define SETTING_TIME 200
`define PATTERN_NUMBER 5
`define SEED_NUMBER  50

module PATTERN_TL();
   wire out;
   reg 	clk, in_interrupt;
   
   integer SEED = `SEED_NUMBER;
   integer index, delay;
   
   real    CYCLE = `CYCLE_TIME;
   always #(CYCLE/2.0) clk = ~clk;
   initial clk = 0;
   
   TL TL1 (.clk(clk), .in_interrupt(in_interrupt), .out(out));
   
   initial begin
      in_interrupt = 1'd0;
      #`SETTING_TIME;
      
      repeat(2)@(negedge clk);
      
      for (index = 0; index < `PATTERN_NUMBER; index = index + 1)
	begin
	   delay = {$random(SEED)}%200 + `CYCLE_TIME + 1;
	   #delay;
	   @(negedge clk);
	   in_interrupt = 1'd1;
	   @(negedge clk);
	   in_interrupt = 1'd0;
	   @(negedge clk);
	end
      #500;
      $finish;
   end
   
   initial begin
      $fsdbDumpfile("TL.fsdb");
      $fsdbDumpvars;
   end
endmodule