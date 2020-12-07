module D_latch(input D,G ,output Q);

wire notD, S, R, notQ;
not (notD, D);
and (S, D, G);
and (R, notD, G);
nor (Q, R, notQ);
nor (notQ, S, Q);

endmodule




