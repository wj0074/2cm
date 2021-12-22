module shock_sound(
    input wire clk,
    input wire shock,
    input wire rst,
    output reg sound
);


    counter_sound count (
    .clk(clk),
    .en(en),
    .sound(sound_end)
    );

reg en;
wire sound_end;

always @(negedge shock) begin
    en <= 1;    
end

always @(posedge clk or rst) begin
    if (rst!=1) begin
        if (shock == 1) begin
            sound <= 1;
            en <= 0;
        end
        else
            sound <= sound_end & sound;
    end

    else 
        sound <= 0;

end

endmodule