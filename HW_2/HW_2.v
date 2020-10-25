module HW_2(A, B, C);
input A, B;
output C;
reg C;
 
always @ (A or B) begin
	C = !(!(A & !(A & B)) & !(!(A & B) & B));
end

endmodule
