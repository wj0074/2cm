`timescale 1ns/1ps

module tb_test;
    reg clk;
    reg car;
    reg rst;
    reg [4:0] hipass;
    reg end_output;
    wire [1:0] currentstate;

    main uut(
            .clk(clk),
            .rst(rst),
            .car(car),
            .hipass(hipass),
            .end_output(end_output),
            .currentstate(currentstate)
    );

    initial begin
        $dumpfile("main_out.vcd");
        $dumpvars(0,tb_test); 
        $display("%b",currentstate);
    end


    always #1 clk = ~clk;

    initial begin
        
        clk = 0;
        car = 0;
        rst = 1;
        hipass = 0;
        end_output = 0;

        #4 rst = 0;
        #4 car = 1;
        #4 car = 0;
        #4 hipass = 4'b1111;
        #4 hipass = 0;
        #4 end_output = 1;
        #4 end_output = 0;
        #4 $finish;

    end

endmodule