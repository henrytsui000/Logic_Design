module HW_3(input [31:0]A,B,input Cin, 
				output [31:0]sum,output Cout );

wire W[31:0], tmp[31 + 1:0], pin1[31:0], pin2[31:0];

assign tmp[0] = Cin;

genvar idx;
generate
	for(idx = 0;idx < 31 + 1 ;idx = idx +1)
	begin: m
		xor (W[idx], 	A[idx], 		B[idx]);
		xor (sum[idx], W[idx], 		tmp[idx]);
		and (pin1[idx], tmp[idx],	W[idx]);
		and (pin2[idx], A[idx],		B[idx]);
		or (tmp[idx+1], pin1[idx], pin2[idx]);
	end
endgenerate

assign Cout = tmp[31 + 1];

endmodule

//31408 314312 2*31486 1*switch
//4*and 4*or 8*xor 1*switch