`timescale 1ns/1ps

module tb_top;
    reg clk;
    reg car;
    reg rst;
    reg [3:0] hipass_out;
    wire [6:0] out;
    wire sound;

    top uut(
            .clk(clk),
            .car(car),
            .hipass_out(hipass_out),
            .rst(rst),
            .out(out),
            .sound(sound)   
    );


    initial begin
        $dumpfile("top_out.vcd");
        $dumpvars(0,tb_top); 
        $display("next");
    end

    always #1 clk = ~clk;

    initial begin
        
        clk = 0;
        car = 0;
        rst = 1;
        hipass_out = 0;
        #4 car = 1;
        #4 car = 0;
        #4 hipass_out = 4'b1110;
        #4 hipass_out = 4'b0000;
        #4 rst = 0;
        #4 car = 1;
        #4 car = 0;
        #4 hipass_out = 4'b1110;
        #4 hipass_out = 4'b0000;
        #4 car = 1;
        #4 car = 0;
        #4 car = 1;
        #4 car = 0;
        #4 hipass_out = 4'b0100;
        #4 hipass_out = 0;
        #4 car = 1;
        #4 car = 0;
        #50 $finish;
    end

endmodule