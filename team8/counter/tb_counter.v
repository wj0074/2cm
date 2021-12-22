`timescale 1ns/1ps
module tb_counter;
    reg clk;
    reg [1:0] en;
    wire [3:0] count;
    wire [3:0] hipass_in;

    counter uut
            (
                .clk (clk),
                .en (en),
                .count (count),
                .hipass_in (hipass_in)
            );            

    initial begin
        $dumpfile("counter_out.vcd");
        $dumpvars(0,tb_counter); 
        $display("%b",count);
    end


        always #5 clk = ~clk;

        initial begin

        clk <= 0;
        en  <= 00;

        #20 en <= 10;
        #18 en <= 10;
        #50 en <= 00;
        #30 $finish;

        end
endmodule