//내부 clk과 맞지 않는 입력 받을 시 오차 발생 방지
module input_sig (
    input clk,
    input [3:0] in,
    input rst,
    output reg [3:0] out
);

reg [3:0] in_d;

always @(posedge clk or rst) begin

    if(rst) begin
        out <= 4'b0;
        in_d <= 4'b0;
    end
    
    else begin
        in_d <= in;         // clk 만큼 신호 밀어서 준다.
        out <= in_d;
    end
end

endmodule