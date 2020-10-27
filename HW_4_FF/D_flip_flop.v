`include "D_latch.v"
module D_flip_flop(input D, En, output Q);
wire tmp,nEn;
not not_En(nEn, En);
D_latch latch1(tmp, D, En);
D_latch latch2(Q, tmp, nEn);

endmodule