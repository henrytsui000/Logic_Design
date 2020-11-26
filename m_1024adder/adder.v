module adder(input A, B, Cin, output sum, Cout);
	wire tmp[3:0];
	//sum
	xor x1(tmp[0], A, B);
	xor x2(sum, tmp[0], Cin);

	//Cout
	and a1(tmp[1], tmp[0], Cin);
	and a2(tmp[2], A, B);
	or o1(Cout, tmp[1], tmp[2]);

endmodule