// 사운드 길이 카운터
module counter_sound(
    input clk,
    input en,
    output wire sound
    );
    
    reg [2:0] count;

    always @ (posedge clk or posedge en) 
    begin
      
      if(en == 1)
        count <= count + 1;

      else
        count <= 3'b000;
    
    end

    assign sound = (count == 3'b111 ) ? 0 : 1;

endmodule