//가장 상위

module top(
    input clk,
    input car,
    input [3:0] hipass_out,
    input wire rst,
    output [6:0]out,   
    output wire sound
);

    wire [3:0] hipass_in;
    reg [3:0] hipass;
    wire [1:0] en;
    wire [3:0] hipass_sync;                    //외부에서 들어온 hipass 신호를 스테이트에 맞게 주도록 바꾼 신호

    always @(*) begin  //카운터가 만들어준 1111짜리 hipass 신호와 외부에서 진짜 들어온 hipass를 하나로 합친다.
        if (hipass_in == 0)
        hipass = hipass_sync;
        else
        hipass = hipass_in;
    end

        input_sync interface(        // 외부 신호를 받아 각자의 스테이트일때까지 대기시켜준다
            .clk(clk),
            .car(car),
            .hipass_out(hipass_out),
            .en(en),
            .hipass_in(hipass_in),
            .rst(rst),
            .car_sync(car_sync),
            .hipass_sync(hipass_sync)
        );

        main moore (       //무어머신
            .clk(clk),
            .rst(rst),
            .car(car_sync),
            .hipass(hipass),
            .currentstate(en)
        );

        out_state out_state (        //출력단
            .clk(clk),
            .en(en),
            .rst(rst),
            .hipass(hipass),
            .out(out),
            .sound(sound)
        );

        counter counter (       //hipass 신호를 기다리는 카운터
            .clk(clk),
            .en(en),
            .rst(rst),
            .car(car),
            .hipass_in(hipass_in)
        );



endmodule