module tb_input;

    reg rst;
    reg clk;
    reg [3:0] in;
    wire [3:0] out;

    input_sig uut(
        .rst(rst),
        .in(in),
        .clk(clk),
        .out(out)
    );

    initial begin
        $dumpfile("input_sig_out.vcd");
        $dumpvars(0,tb_input); 
        $display("%b",out);
    end

    initial begin
        clk = 0;
        rst = 1;
        in = 1;
        #4 in = 0;
        #4 rst = 0;
        #4 in = 1;
        #4 in = 0;
        #4 $finish;
    end

    always #1 clk = ~clk;

endmodule