module mux(input A, B, select,Q);
    input A, B, select;
    output Q;
    wire not_select, tmp1, tmp2;
    not not1(not_select, select);
    and and1(tmp1, A, not_select);
    and and2(tmp2, B, select);
    or or1(Q, tmp1, tmp2);
endmodule