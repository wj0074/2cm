`timescale 1ns/1ps

module tb_output_state;
    reg clk;
    reg car;
    reg rst;
    reg [1:0] en;
    reg [3:0] hipass_out;
    wire [6:0] out;
    wire sound;

    out_state uut(
            .clk(clk),
            .en(en),
            .hipass(hipass_out),
            .rst(rst),
            .out(out),
            .sound_out(sound)   
    );


    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0,tb_output_state); 
        $display("next");
    end

    always #1 clk = ~clk;

    initial begin
        
        clk = 0;
        en = 0;
        rst = 1;
        hipass_out = 0;
        #4 rst = 0;
        #4 en = 3;
        #4 hipass_out = 4'b1110;
        #4 hipass_out = 4'b0000;
        #4 hipass_out = 4'b1111;
        #50 $finish;
    end

endmodule