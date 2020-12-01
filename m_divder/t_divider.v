`timescale 1ns/10ps
module t_divider();
    reg clk;
    wire [20:0] opt;
    reg reset;
    reg [20:0] a, b;
    divider test(clk, opt, reset, a, b);
    initial begin
        $dumpfile("divider.vcd");
        $dumpvars;
        clk = 1'b0;
        reset = 1;
        a = 922;
        b = 5;
        #10
        reset = 0;
        #30000
        $finish;
    end
    always begin
        clk = ~clk;
        #10
        clk = clk;
    end
endmodule