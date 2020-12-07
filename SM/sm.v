`include "mux.v"
`include "d_flip_flop.v"
module sm(a, b, clk, opt, rst);
    input clk, rst, a, b;
    output opt;
    wire abo, ab, ipt;
    xor xor1(ab, a, b);
    xor xor2(abo, ab, opt);
    mux m(abo, 1'b0, rst, ipt);
    d_flip_flop d(ipt, clk, opt);
    // always @(posedge clk) begin
    //     opt <= ipt;
    // end
endmodule