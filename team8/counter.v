// 하이패스 신호 대기 카운터
module counter(
    input clk,
    input [1:0] en,
    input car,
    input rst,
    output [3:0] hipass_in
    );
    
    reg [2:0] count;
    reg [3:0] hipass;

    always @ (posedge clk or posedge en or rst) begin
      if (rst) begin
        
        count <= 0;
        hipass <= 0;

        end
      else 
        if(en == 2'b10)
            if (car == 1)
              hipass <= 4'b1111;
            else
              count <= count + 1;
        else
          count <= 3'b000;
    end

    always @(*) begin

      hipass = (count == 3'b111 ) ? 4'b1111 : 4'b0;         //카운터가 다 차면 hipass 신호로 1111을 넣어준다

    end


    input_sig delay (    //hipass 신호 딜레이 만들어주기

        .clk(clk),
        .in(hipass),
        .rst(rst),
        .out(hipass_in)

    );

endmodule