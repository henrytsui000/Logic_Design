module pattern(A, B, C);
output[31:0] A, B;
output C;
reg[31:0] A, B;
reg C;
initial begin
	A = 32'b10001010000010100000101000001010;
	B = 32'b01111101011111010111110101111101;
	C = 1'b1;
	#100
	$finish;
end

endmodule