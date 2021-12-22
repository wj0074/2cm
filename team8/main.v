//무어머신 부분
module main(
            input clk,

            input rst,
      
            input car,

            input [3:0] hipass,

            output reg[1:0] currentstate
            );

 reg [1:0] nextstate = 2'b00;
 parameter state_initial = 2'b00;
 parameter state_car = 2'b01;
 parameter state_hipass = 2'b10;
 parameter state_output = 2'b11;

  always @( posedge clk or rst ) begin

    if (rst) currentstate <= 00;

    else
       
        case (currentstate)
            state_initial: begin
                nextstate <= 2'b01;           //초기 모드에서 바로 차량 대기로 넘어감
            end

            state_car: begin
              if (car) nextstate <= 2'b10;              //car 신호가 오면 하이패스 대기로 넘어감
            end
            
            state_hipass: begin
              if (hipass) nextstate <= 2'b11;          //hipass 신호가 오면 출력단으로 넘어감
            end

            state_output: begin
              nextstate <= 2'b01;             //출력을 위한 en 신호만 전달하고 차량대기로 돌아감
            end

        endcase

        currentstate <= nextstate ;
  end

endmodule