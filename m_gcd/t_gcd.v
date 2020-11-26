`timescale 1ns/10ps
module t_gcd();
    reg clk;
    reg [31:0] a,b;
    wire [31:0] opt;
    reg rst;
    gcd test(a, b, opt, clk, rst);
    initial begin
        $dumpfile("gcd.vcd");
        $dumpvars;
        clk = 1'b0;
        rst = 1;
        a = 69;
        b = 81;
        #15
        rst = 0;
        #300
        $finish;
    end
    always begin
        clk = ~clk;
        #10
        clk = clk;
    end
endmodule