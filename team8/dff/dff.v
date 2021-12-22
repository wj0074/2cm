module dff(

        input clk,

        input reset,

        input in,

        output out,
);      
        reg out;

        // triggered at the falling edge of clk or reset

        always @(posedge clk )

               begin

                       // meaning of 1'b0

                       // 1: 1-bit, b: binary, 0: low

                       if (reset == 1'b0) // if reset is low

                               out <= 1'b0;  // out is zero

                       else

                               out <= in;  // out is in

               end
                      
endmodule