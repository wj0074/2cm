// 사운드 길이 카운터
module counter_sound(
    input clk,
    input en,
    output wire sound_end
    );
    
    reg [3:0] count;

    always @ ( clk or posedge en) 
    begin
      
      if(en == 1)
        count <= count + 1;

      else
        count <= 4'b0000;
    
    end

    assign sound_end = (count == 'b1111 ) ? 0 : 1;        //카운터가 다 차면 sound_end가 0이 됨

endmodule