`timescale 1ns/10ps
module t_four_sm();
    reg clk,x,rst;
    wire A,B,y;
    
    four_sm test(x, clk, rst, A, B, y);
    initial begin
        $dumpfile("four_sm.vcd");
        $dumpvars;
        clk = 1'b0;
        rst = 1;
        #10
        rst = 0;
        x=1;
        #30;
        x=0;
        #10;
        x=1;
        #10
        $finish;
    end
    always begin
        clk = ~clk;
        #3
        clk = clk;
    end
endmodule