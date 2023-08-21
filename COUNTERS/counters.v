module counters(cnt_in,rst,enab,load,clk,cnt_out);

 input wire [4:0]cnt_in;
 input wire rst;
 input wire enab;
 input wire load;
 input wire clk;
 output reg [4:0]cnt_out;

 always @(posedge clk)
 begin
    if(rst)begin
        cnt_out<=5'b0000;
    end
    else begin
    if(load && enab)begin
        cnt_out<=cnt_in;
     end 
     else if(load==0 && enab)begin
        cnt_out<=cnt_in+1'b1;
     end
     else begin
     cnt_out<=5'b00000;
     end
    end
 end
endmodule