module d_latch(En, D, Q);
    input En, D;
    output Q;
    wire up_wire, down_wire, not_D, Q_bar;
    not not1(not_D, D);
    and and1(up_wire, En, not_D);
    and and2(down_wire, En, D);
    nor nor1(Q, Q_bar, up_wire);
    nor nor2(Q_bar, Q, down_wire);
endmodule