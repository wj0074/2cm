//최종 출력 모듈
module out_state(
input clk,
input rst,
input [3:0] hipass,
input [1:0] en,
output reg [6:0] out,
output reg sound
);

wire sound_end;
wire [3:0] hipass_sig;

    input_sig in_delay (    //hipass 신호 딜레이 만들어주기

        .clk(clk),
        .in(hipass),
        .rst(rst),
        .out(hipass_sig)

    );

    counter_sound count_sound (     //경보음 종료 카운터

        .clk(clk),
        .en(sound),
        .sound_end(sound_end)

    );


    always @ ( clk or rst ) begin

        if (rst)
            out <= 0;
        else

            if (en == 2'b11) begin
                if(hipass_sig == 4'b0100)
                    out <= 6'd21;

                else if(hipass_sig == 4'b0101)
                    out <= 6'd11;                

                else if(hipass_sig == 4'b0110)
                    out <= 6'd31;

                else if(hipass_sig == 4'b1000)
                    out <= 6'd22;

                else if(hipass_sig == 4'b1001)
                    out <= 6'd12;

                else if(hipass_sig == 4'b1010)
                    out <= 6'd32;

                else if(hipass_sig == 4'b1100) 
                    out <= 6'd23;

                else if(hipass_sig == 4'b1101)
                    out <= 6'd13;

                else if(hipass_sig == 4'b1110)
                    out <= 6'd33;
                else
                    out <= 0;
                end

            else
                out <= 0;

    end

    always @(clk or rst) begin
    if (rst)
        sound <= 0;
    else

        if(hipass_sig == 4'b1111)
                sound <= 1;
                
        else
            sound <= sound & sound_end;
    end

endmodule