`include "mux.v"
`include "d_flip_flop.v"
`include "four_adder.v"
module divider(clk, opt, rst, ia, ib);
    input clk, rst;
    output [4:0] opt;
    wire [4:0] tmp, rst_tmp, a, amb, tmpa, out_a,tmp2;
    input [4:0] ia, ib;
    assign amb = a-ib;
    mux m_tmpa[4:0] (a, amb ,a>ib, out_a);

    mux m[4:0](tmp2, 5'b1, rst, tmp);
    mux m_a[4:0](out_a,ia,  rst, tmpa);

    mux st[4:0](opt,rst_tmp,a>ib,tmp2);
    d_flip_flop d[4:0](tmp, clk, opt);
    d_flip_flop da[4:0](tmpa, clk, a);
    wire fuck;
    wire [4:0]fuck2;
    four_adder enu(opt, 5'b0, 1'b1, rst_tmp);
    assign fuck2 = opt-1;
endmodule

//非gate level寫法
// module binary_counter(clk, opt, rst, a, b);
//     input clk, rst;
//     output reg [4:0] opt;
//     wire [4:0] next_opt;

//     assign next_opt = (rst ? 5'b0 : (opt == 5'd63 ? 5'd0 : opt + 5'd1));
//     always @(posedge clk) begin
//         opt <= next_opt;
//     end

// endmodule