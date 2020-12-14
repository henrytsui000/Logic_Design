module mux(A, B, select,Q);
    input A, B;
    input select;
    output Q;
    wire not_select, tmp1, tmp2;
    not not1(not_select, select);
    and and1(tmp1, A, not_select);
    and and2(tmp2, B, select);
    or or1(Q, tmp1, tmp2);
endmodule

module check_zero(A, Q);
	input [3:0] A;
	output Q;
	wire ret;

	or ans(ret, A[3], A[2], A[1], A[0]);
	not not1(Q, ret);
endmodule

module check_four(A, Q);
	input [3:0] A;
	output Q;
	wire ret, rev_2;
    not not2(rev_2, A[2]);
	or ans(ret, A[3], rev_2, A[1], A[0]);
	not not1(Q, ret);
endmodule

module adder(input A, B, Cin, output sum, Cout);
	wire tmp[3:0];
	//sum
	xor x1(tmp[0], A, B);
	xor x2(sum, tmp[0], Cin);

	//Cout
	and a1(tmp[1], tmp[0], Cin);
	and a2(tmp[2], A, B);
	or o1(Cout, tmp[1], tmp[2]);

endmodule

module full_adder(A, B, Cin, sum);
	input[3:0]A, B;
	input Cin;
	output [3:0]sum;
	wire Cout;

	wire W[4:0];

	adder a1(A[0], B[0], Cin, sum[0], W[0]);
	adder a2(A[1], B[1], W[0], sum[1], W[1]);
	adder a3(A[2], B[2], W[1], sum[2], W[2]);
	adder a4(A[3], B[3], W[2], sum[3], W[3]);

	assign Cout = W[3];

endmodule

module d_latch(Q, D, En);
    input En, D;
    output Q;
    wire up_wire, down_wire, not_D, Q_bar;
    not not1(not_D, D);
    and and1(up_wire, En, not_D);
    and and2(down_wire, En, D);
    nor nor1(Q, Q_bar, up_wire);
    nor nor2(Q_bar, Q, down_wire);
endmodule

module d_flip_flop(D, clk, Q);
    input D, clk;
    output Q;
    wire not_clk, tmp;
    not not1(not_clk, clk);
    d_latch first_latch(tmp, D, clk);
    d_latch second_latch(Q, tmp, not_clk);
endmodule

module fuck(in, clk, rst, out);
    input in, clk, rst;
    output out;
    wire [3:0] cnt;
    wire [3:0] plcnt, pre_cnt, give_plcnt;
    wire tmp, res;

    // assign plcnt = rst || in ? 0 : cnt + 1 == 4 ? 0 : cnt + 1;
    wire RorI;
    or or1(RorI, rst, in);
    wire cp1;
    full_adder FA1(cnt, 4'b1, 1'b0, pre_cnt);
    check_four checkcpo(pre_cnt, cp1);
    mux mCPO[3:0](pre_cnt, 4'b0, cp1, give_plcnt);
    mux mplcnt[3:0](give_plcnt, 4'b0, RorI, plcnt);

    assign tmp = rst ? 1'b0 : (cnt == 0 ? ~out : out);
    wire res_cnt, cnt_equal_zero;
    check_zero check_cnt(cnt, cnt_equal_zero);
    mux m0cnt(out, ~out, cnt_equal_zero, res_cnt);
    mux mtmp(res_cnt, 1'b0, rst, tmp);

    // assign res = rst ? 0 : tmp;
    mux mres(tmp, 1'b0, rst, res);

    d_flip_flop dout(res, clk, out);
    d_flip_flop dcnt[3:0] (plcnt, clk, cnt);
    // always @(posedge clk) begin
    //     out = res;
    //     cnt = plcnt;
    //     prev <= in;
    // end

endmodule

`timescale 1ns/10ps
module t_fuck();
    reg clk,in;
    wire opt;
    reg reset;
    fuck test(in, clk, reset, opt);
    initial begin
        $dumpfile("fuck.vcd");
        $dumpvars;
        clk = 1'b0;
        in = 0;
        reset = 1;
        #10
        reset = 0;
        #90
        in = 1;
        #20
        in = 0;
        #80
        #30
        in = 1;
        #20
        in = 0;
        #80

        $finish;
    end
    always begin
        clk = ~clk;
        #10
        clk = clk;
    end
endmodule