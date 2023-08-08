`timescale 1ns/1ps
module fa_tb();
   reg a_tb;
   reg b_tb;
   reg cin_tb;
   wire sum_tb;
   wire carry_tb;

   initial begin       
      a_tb=0; b_tb=0; cin_tb=0;
      #3
      a_tb=1; b_tb=0; cin_tb=1;
      #5
      a_tb=1; b_tb=1; cin_tb=1;
      $display("sum_tb value is %d",sum_tb);
      $display("carry_tb value is %d",carry_tb);
      // #3
   end
   fa U_faO
 (
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .sum(sum_tb),
    .carry(carry_tb)
 );

 initial begin
    $dumpfile("fa.vcd");
    $dumpvars(0,fa_tb);
 end
endmodule
