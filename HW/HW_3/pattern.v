module pattern(A, B, C);
output[3:0] A, B;
output C;
reg[3:0] A, B;
reg C;
initial begin
	A = 4'b1111;
	B = 4'b0001;
	C = 1'b1;
	#100
	$finish;
end

endmodule