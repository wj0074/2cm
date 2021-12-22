module input_sig (
    input clk,
    input [3:0] in,
    input rst,
    output reg [3:0] out
);

reg in_d;

always @(posedge clk or posedge rst) begin

    if(rst) begin
        out <= 0;
        in_d <= 0;
    end
    
    else begin
        in_d <= in;
        out <= in_d;
    end
end

endmodule