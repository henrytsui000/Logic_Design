module HW_2(A, B, C);
input A, B;
output C;
reg C;
 
always @ (A or B) begin
	C = !((!(A & B )) & !((!(A & A)) & (!(B & B))));
//	C = !(!(A & B)) & (!( !(A & A) & (!(B & B))));
end

endmodule
