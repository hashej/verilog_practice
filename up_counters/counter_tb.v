`timescale 1ns/1ps
module counter_tb();

reg clk;
reg rst;
wire [3:0]counter;

counter uu_counter(
    .rst(rst),
    .clk(clk),
    .counter(counter)
);

always #5 clk = ~clk;
 initial begin
    clk=0;rst=0;
    #10;
    rst=1;
    #200
    $finish;
 end
 initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0,counter_tb);
 end
endmodule

    