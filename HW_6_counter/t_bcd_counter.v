`timescale 1ns/10ps
module t_bcd_counter();
    reg clk;
    wire [4:0] opt;
    reg reset;
    bcd_counter test(clk, opt, reset);
    initial begin
        $dumpfile("bcd_counter.vcd");
        $dumpvars;
        clk = 1'b0;
        reset = 1;
        #10
        reset = 0;
        #300
        $finish;
    end
    always begin
        clk = ~clk;
        #10
        clk = clk;
    end
endmodule