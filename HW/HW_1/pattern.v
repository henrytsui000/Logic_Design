module pattern(A, B);
output A, B;
reg A, B;
initial begin
	A = 0; B = 0;
	#5 B = 1;
	#5 A = 1;
	B = 0;
	#5 B = 1;
	#5 $finish;
end

endmodule
