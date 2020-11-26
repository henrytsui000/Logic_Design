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
`include "checkbig.v"
`include "mux.v"
module sorting(a, b, c, d, a_4, b_4, c_4, d_4);
    input [3:0]a,b,c,d;
    wire [3:0]a_1,b_1,c_1,d_1;
    wire [3:0]a_2,b_2,c_2,d_2;
    wire [3:0]a_3,b_3,c_3,d_3;
    output [3:0]a_4,b_4,c_4,d_4;

    checkbig ab_1(a,b,res_ab1);
    mux ma_1[3:0](a,b,res_ab1,a_1);
    mux mb_1[3:0](b,a,res_ab1,b_1);
    checkbig cd_1(a,b,res_cd1);
    mux mc_1[3:0](c,d,res_cd1,c_1);
    mux md_1[3:0](d,c,res_cd1,d_1);
    

    checkbig bc_2(b_1,c_1,res_bc2);
    mux mb_2[3:0](b_1,c_1,res_bc2,b_2);
    mux mc_2[3:0](c_1,b_1,res_bc2,c_2);
    assign d_2 = d_1;
    assign a_2 = a_1;
    

    checkbig ab_3(a_2,b_2,res_ab3);
    mux ma_3[3:0](a_2,b_2,res_ab3,a_3);
    mux mb_3[3:0](b_2,a_2,res_ab3,b_3);
    checkbig cd_3(c_2,d_2,res_cd3);
    mux mc_3[3:0](c_2,d_2,res_cd3,c_3);
    mux md_3[3:0](d_2,c_2,res_cd3,d_3);


    checkbig bc_4(b_3,c_3,res_bc4);
    mux mb_4[3:0](b_3,c_3,res_bc4,b_4);
    mux mc_4[3:0](c_3,b_3,res_bc4,c_4);
    assign d_4 = d_3;
    assign a_4 = a_3;   
    // assign a_1 = (a>b?a:b);
    // assign b_1 = (a>b?b:a);

    // assign c_1 = (c>d?c:d);
    // assign d_1 = (c>d?d:c);

    // assign b_2 = (b_1>c_1?b_1:c_1);
    // assign c_2 = (b_1>c_1?c_1:b_1);
    

    // assign a_3 = (a_1>b_2?a_1:b_2);
    // assign b_3 = (a_1>b_2?b_2:a_1);

    // assign c_3 = (c_2>d_1?c_2:d_1);
    // assign d_3 = (c_2>d_1?d_1:c_2);
    

endmodule