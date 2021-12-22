module tb_sound;

    reg clk;
    reg shock;
    reg rst;
    wire sound;

    shock_sound uut (
        .clk(clk),
        .shock(shock),
        .rst(rst),
        .sound(sound)
    );

initial
   begin
      $dumpfile("test_out.vcd");
      $dumpvars(0,tb_sound);  // tb는 위에 nand4_if tb(a,y)의 tb를 말한다. 
      $display("good");
   end

    always #1 clk = ~clk;

initial begin
        clk = 0;
        shock = 0;
        rst = 1;

        #4 rst = 0;
        #4 shock = 1;
        #4 shock = 0;
        #4 shock = 1;
        #4 shock = 0;
        #40 $finish;
end

endmodule