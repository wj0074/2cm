module counter #(parameter N = 4)(
    input clk,
    input [1:0] en,
    output reg [N-1:0] count,
    );
    
    always @ (posedge clk or posedge en) 
    begin
      
      if(en == 2'b10)
        count <= count + 1;

      else
        count <= 4'b0000;
    
    end

endmodule