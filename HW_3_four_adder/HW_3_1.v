//min
module HW_3_1(input [3:0]A, B, input Cin, 
				output [3:0]sum, output Cout);

wire W[3:0], tmp[3 + 1:0], pin1[3:0], pin2[3:0];
wire[3:0] nB;

assign tmp[0] = Cin;


assign nB = ~B+1;

genvar idx;
generate
	for(idx = 0;idx < 3 + 1 ;idx = idx +1)
	begin: m
		xor (W[idx], 	A[idx], 		nB[idx]);
		xor (sum[idx], W[idx], 		tmp[idx]);
		and (pin1[idx], tmp[idx],	W[idx]);
		and (pin2[idx], A[idx],		nB[idx]);
		or (tmp[idx+1], pin1[idx], pin2[idx]);
	end
endgenerate

assign Cout = tmp[3 + 1];

endmodule

//3408 3432 2*3486 1*switch
//4*and 4*or 8*xor 1*switch