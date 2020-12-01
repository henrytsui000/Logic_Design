`timescale 1ns/10ps
module t_divider();
    reg clk;
    wire [4:0] opt, low;
    reg reset;
    reg [4:0] a, b;
    divider test(clk, opt, low, reset, a, b);
    initial begin
        $dumpfile("divider.vcd");
        $dumpvars;
        clk = 1'b0;
        reset = 1;
        a = 7;
        b = 3;
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