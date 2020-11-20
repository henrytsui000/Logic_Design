`include "mux.v"
`include "d_flip_flop.v"
`include "bcd_adder.v"
module bcd_counter(clk, opt, rst);
    input clk, rst;
    output [4:0] opt;
    wire [4:0] tmp;
    wire [4:0] rst_tmp;
    mux m[4:0](rst_tmp, 5'b0, rst, tmp);
    d_flip_flop d[4:0](tmp, clk, opt);
    bcd_adder enu(opt, 5'b00001, rst_tmp);
endmodule