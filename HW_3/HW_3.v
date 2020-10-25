module HW_3( A, B, C, D, E );
//D is sum 
//E is carry-out
input[3:0] A, B;
input C;
output[3:0] D;
output E;

wire W[3:0];
wire tmp[4:0];

assign tmp[0] = C;

genvar idx;
generate
	for(idx = 0;idx < 4;idx = idx +1)
	begin: m
		assign W[idx] = A[idx] ^ B[idx];
		assign D[idx] = W[idx] ^ tmp[idx];
		assign tmp[idx+1] = (tmp[idx] & W[idx]) | (A[idx] & B[idx]);
	end
endgenerate

assign E = tmp[4];

endmodule

//7408 7432 2*7486 1*switch
//4*and 4*or 8*xor 1*switch