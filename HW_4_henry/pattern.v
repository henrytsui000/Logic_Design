module pattern(A,B);
output[4:0] A, B;
reg[4:0] A, B;
initial begin
	A = 8;
	B = 9;
	#100
	$finish;
end

endmodule