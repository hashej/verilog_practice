module counter(rst,counter,clk);

 input wire rst;
 input wire clk;
 output reg [3:0]counter;

 always @(posedge clk)
 begin
 if(!rst)
 counter <= 4'b0000;
 else begin
    counter <= counter+4'b0001;
 end   
 end
endmodule 
