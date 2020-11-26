`timescale 1ns/10ps
module t_sorting();
    reg [3:0]a,b,c,d;
    wire [3:0] a_4,b_4,c_4,d_4;
    
    sorting test(a, b, c, d, a_4, b_4, c_4, d_4);
    initial begin
        $dumpfile("sorting.vcd");
        $dumpvars;
        a = 5;
        b = 4;
        c = 2;
        d = 0;
        #300
        $finish;
    end
endmodule