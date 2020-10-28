module D_latch(input D, En, output Q);

wire up_input, down_input, nD, Q_bar;
not not_D(nD, D);
nand ul(up_input, D, En);
nand dl(down_input, nD, En);
nand ur(Q, Q_bar, up_input);
nand dr(Q_bar, Q, down_input);
endmodule