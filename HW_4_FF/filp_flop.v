module flip_flop(input D, En, output reg Q);

always @(posedge En)
    Q = D;
endmodule