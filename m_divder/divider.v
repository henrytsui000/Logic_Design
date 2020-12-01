`include "mux.v"
`include "d_flip_flop.v"
`include "four_adder.v"
module divider(clk, opt, a,rst, ia, ib);
    input clk, rst;//clk是時間 , rst 是一開始要初始化
    output [4:0] opt,a;//這是counter跟餘數
    //也就是說 opt = 商數, a = 餘數
    wire [4:0] tmp, rst_tmp, amb, tmpa, out_a,tmp2;
    /*
    邏輯是這樣的 我有兩個數字a,ib
    如果a-ib>0
    那我就a-=ib
    然後計數器+1
    直到a<ib
    
    tmp, rsttmp 計數器的東西
    amb 是a-b

    */
    input [4:0] ia, ib;
    assign amb = a-ib;
    mux m_tmpa[4:0] (a, amb ,a>ib, out_a);
    mux st[4:0](opt,rst_tmp,a>ib,tmp2);
    four_adder enu(opt, 5'b0, 1'b1, rst_tmp);

    //以下是初始化
    /*如果rst = true（初始化的時候rst 會是true一下下）
    那我就計數器 ＝ 1
    否則tmp = tmp2
    tmpa同理：
    如果要初始化 那我的tmpa = input_a 也就是我的ia
    如果不用初始化 那我的tmpa = out_a
    */
    mux m[4:0](tmp2, 5'b0, rst, tmp);
    mux m_a[4:0](out_a,ia,  rst, tmpa);

    /*
    我每一次clk = posedge我就更新一次數據(DFF)
    把商數計算器tmp 給 opt
    把餘數 tmpa = a
    */
    d_flip_flop d[4:0](tmp, clk, opt);
    d_flip_flop da[4:0](tmpa, clk, a);
endmodule