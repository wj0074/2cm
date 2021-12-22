module main(
            input clk,

            input rst,
      
            input car,

            input [3:0] hipass,

            input end_output,

            output reg[1:0] currentstate
            );

 reg [1:0] nextstate = 2'b00;
 parameter state_initial = 2'b00;
 parameter state_car = 2'b01;
 parameter state_hipass = 2'b10;
 parameter state_output = 2'b11;

  always @( posedge clk ) begin

    if (rst) currentstate <= 00;

    else

      currentstate <= nextstate ;
       
        case (currentstate)
            state_initial: begin
                nextstate <= 2'b01;
            end

            state_car: begin
              if (car) nextstate <= 2'b10;
            end
            
            state_hipass: begin
              if (hipass) nextstate <= 2'b11;
            end

            state_output: begin
              if (end_output) nextstate <= 2'b01;
            end

        endcase
  end

endmodule