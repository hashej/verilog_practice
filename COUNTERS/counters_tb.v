`timescale 1ns/1ps
module counters_tb();
  reg [4:0]cnt_in;
  reg rst;
  reg enab;
  reg  load;
  reg clk;
  wire [4:0]cnt_out;

  counters u_counters(
   .cnt_in(cnt_in),
   .rst(rst),
   .enab(enab),
   .load(load),
   .clk(clk),
   .cnt_out(cnt_out)
   );
   always #5 clk = ~clk;
   initial begin
        rst=0;load=0;enab=0;clk=0; cnt_in=5'b00000;
        #20;
        rst=0; load=1; enab=1; cnt_in=5'b10101;
        #10;
        rst=0; load=1; enab=1; cnt_in=5'b01010;
        #10;
        rst=0; load=1; enab=1; cnt_in=5'b11111;
        #10;
        rst=1; load=1; enab=1; cnt_in=5'b11111;
        #10;
        rst=0; load=1; enab=1; cnt_in=5'b11111;
        #10;
        rst=0; load=0; enab=1; cnt_in=5'b11111;
        #10;
        $finish;
    end

 initial begin
    $dumpfile("counters.vcd");
    $dumpvars(0,counters_tb);
 end
endmodule














































