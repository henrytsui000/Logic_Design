`include "mux.v"
`include "checkbig.v"
// `include "full_adder.v"
`include "check_zero.v"
`include "d_flip_flop.v"
module gcd(a, b, opt, clk, rst);
    input [31:0] a,b;
    input clk, rst;
    output [31:0] opt;
    wire [31:0] ca, cb;

    wire cmp, cmp2;
    wire [31:0] aminb, inb;
    wire [31:0] a_1, b_1;
    checkbig cmp_1(ca, cb, cmp);
    mux mux1 [31:0](ca, cb, cmp, b_1);
    mux mux2 [31:0](cb, ca, cmp , a_1);
    
    mux muxinb [31:0](b_1, b, rst, inb);
    mux muxaminb [31:0](a_1 - b_1,a , rst, aminb);
    checkbig cmp_2(aminb, inb, cmp2);
    mux muxopt [31:0](inb, aminb, cmp2, opt);
    wire keep_doing, check_equ, kp;
    check_zero check(inb, check_equ);
    mux muxkd(1'b1, clk, check_equ, keep_doing);
    d_flip_flop dff1 [31:0](aminb, keep_doing, ca);
    d_flip_flop dff2 [31:0](inb, keep_doing, cb);

endmodule

// module gcd(a, b, opt, clk, rst);
//     input [31:0] a,b;
//     input clk, rst;
//     output [31:0] opt;
//     reg [31:0] ca, cb;

//     wire [31:0] a_1, b_1, aminb, inb;
//     assign a_1 = ca > cb ? ca : cb;
//     assign b_1 = (ca > cb? cb : ca);
    
//     assign inb = (rst? b : b_1);
//     assign aminb = (rst ? a : a_1 - b_1);
//     assign opt = aminb > inb? aminb : inb;
//     wire keep_doing;
//     assign keep_doing = (inb == 0 ? 1 : clk);
//     always @(posedge keep_doing)begin
//         ca <= aminb;
//         cb <= inb;
//     end

// endmodule
