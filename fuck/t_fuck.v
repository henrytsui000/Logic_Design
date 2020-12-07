`timescale 1ns/10ps
module t_fuck();
    reg clk,in;
    wire opt;
    reg reset;
    fuck test(in, clk, reset, opt);
    initial begin
        $dumpfile("fuck.vcd");
        $dumpvars;
        clk = 1'b0;
        in = 0;
        reset = 1;
        #10
        reset = 0;
        #90
        in = 1;
        #20
        in = 0;
        #80
        #30
        in = 1;
        #20
        in = 0;
        #80

        $finish;
    end
    always begin
        clk = ~clk;
        #10
        clk = clk;
    end
endmodule