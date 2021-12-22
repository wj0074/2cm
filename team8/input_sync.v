//외부의 입력 신호를 받아 스테이트를 맞춰 넣어주는 모듈 
module input_sync(
    input clk,
    input car,
    input [3:0] hipass_out,
    input [3:0] hipass_in,
    input [1:0] en,
    input rst,
    output reg car_sync,
    output reg [3:0] hipass_sync
);

reg car_d;
reg [3:0] hipass_d;
wire hipass_on;

assign hipass_on = (hipass_out == 0)? 0:1;

always @( posedge clk or negedge rst or posedge rst ) begin   //car_d에 저장된 값을 car_sync에 전달

    if (rst) begin
        car_sync <= 0;
        car_d <= 0;
            end
    else
        if (en == 2'b01) begin
            car_sync <= car_d;  //car state에서는 값을 전달 후 초기화
            car_d <= 0;
            end


        else
            car_sync <= 0;


end

    always @( posedge clk or rst ) begin

        if (rst) begin
            hipass_d <=0;
            hipass_sync <= 0;
                end
        else
            if (en == 2'b10 & hipass_in != 1111) begin
                hipass_sync <= hipass_d;  //hapss state에서는 값을 전달 후 초기화
                hipass_d <= 4'b0;
                end

            else
                hipass_sync <= 0;

    end

    always @( posedge car ) begin   //car의 입력을 car_d에 저장
        car_d <= car;
    end


    always @( posedge hipass_on ) begin
        hipass_d <= hipass_out; 
    end


endmodule