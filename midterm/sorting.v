// `include "mux.v"
// `include "d_flip_flop.v"
// `include "four_adder.v"
// module binary_counter(clk, opt, rst);
//     input clk, rst;
//     output [4:0] opt;
//     wire [4:0] tmp;
//     wire [4:0] rst_tmp;
//     mux m[4:0](rst_tmp, 5'b0, rst, tmp);
//     d_flip_flop d[4:0](tmp, clk, opt);
//     four_adder enu(opt, 5'b0, 1'b1, rst_tmp);
// endmodule

// 非gate level寫法
module sorting(a, b, c, d, a_3, b_3, c_3, d_3);
    input [3:0]a,b,c,d;
    wire [3:0]a_1,b_1,c_1,d_1;
    wire [3:0]b_2,c_2;
    output [3:0]a_3,b_3,c_3,d_3;
    
    assign a_1 = (a>b?a:b);
    assign b_1 = (a>b?b:a);

    assign c_1 = (c>d?c:d);
    assign d_1 = (c>d?d:c);

    assign b_2 = (b_1>c_1?b_1:c_1);
    assign c_2 = (b_1>c_1?c_1:b_1);
    

    assign a_3 = (a_1>b_2?a_1:b_2);
    assign b_3 = (a_1>b_2?b_2:a_1);

    assign c_3 = (c_2>d_1?c_2:d_1);
    assign d_3 = (c_2>d_1?d_1:c_2);
    

endmodule