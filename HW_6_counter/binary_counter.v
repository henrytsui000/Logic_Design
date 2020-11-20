`include "mux.v"
`include "d_flip_flop.v"
`include "four_adder.v"
module binary_counter(clk, opt, rst);
    input clk, rst;
    output [4:0] opt;
    wire [4:0] tmp;
    wire [4:0] rst_tmp;
    mux m[4:0](rst_tmp, 5'b0, rst, tmp);
    d_flip_flop d[4:0](tmp, clk, opt);
    four_adder enu(opt, 5'b0, 1'b1, rst_tmp);
endmodule

//非gate level寫法
// module binary_counter(clk, opt, rst);
//     input clk, rst;
//     output reg [4:0] opt;
//     wire [4:0] next_opt;

//     assign next_opt = (rst ? 5'b0 : (opt == 5'd63 ? 5'd0 : opt + 5'd1));
//     always @(posedge clk) begin
//         opt <= next_opt;
//     end

// endmodule