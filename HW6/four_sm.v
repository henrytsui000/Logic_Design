//HW_6


`include "D_FF.v"
`include "mux.v"
module four_sm(input x,clk,rst, output A,B,y);

wire next_A,next_B;
wire tmpA,tmpB;
wire AoB,nA;

or (AoB,A,B);
not (nA,A);
not (nx,x);

and (next_A,AoB,x);
and (next_B,nA,x);


mux muxA(next_A,1'b0,rst,tmpA);
mux muxB(next_B,1'b0,rst,tmpB);
and (y,AoB,nx);


D_FF DFF_A(tmpA,clk,A);
D_FF DFF_B(tmpB,clk,B);
endmodule