`timescale 1ns/10ps
module t_name();
    reg input_name;
    wire output_name;
    module_name my_name(input_name, output_name);
    initial begin
        $dumpfile("name.vcd");
        $dumpvars;
        input_name = xxx;
        #time
        $finish;
    end
    
    always begin
        clk = ~clk;
        #10 
    end
endmodule