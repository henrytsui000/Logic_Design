module fuck(in, clk, rst, out);
    input in, clk, rst;
    output reg out;
    reg [2:0] cnt;
    reg prev;
    wire [2:0] plcnt;
    wire tmp, res;
    assign plcnt = rst || in ? 0 : cnt + 1 == 4 ? 0 : cnt + 1; 
    assign tmp = rst ? 1'b0 : (cnt == 0 ? ~out : out);
    assign res = rst ? 0 : tmp;

    always @(posedge clk) begin
        out = res;
        cnt = plcnt;
        prev <= in;
    end


endmodule