module HW_1(A, B, C, D);
input A, B;
output C, D;
reg C, D;

always @ (A or B) begin
	C = ((!A | !B) & (A | B));
	D = (!A | !B);
end

endmodule
