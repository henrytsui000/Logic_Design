module pattern(A, B, C);
output[3:0] A, B;
output C;
reg[3:0] A, B;
reg C;
initial begin
	A = 3'b010;
	B = 3'b101;
	C = 1'b0;
	#100
	$finish;
end

endmodule