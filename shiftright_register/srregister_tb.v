
module srregister_tb();

    reg clk;
    reg  rst;
    wire [3:0] q;
    reg in;

    always #5  clk = ~clk;

    initial begin
        clk = 1;rst=1;in=1;
        #10;
        rst=0;in=1;
        #10;
        in=0;
        #10;
        in=0;
        #10;
        in=0;
        #10;
       $finish;
    end
     srregister u_srregister0(
        .clk(clk),
        .rst(rst),
        .in(in),
        .q(q)
    );

    initial begin
        $dumpfile("srregister.vcd");
        $dumpvars(0, srregister_tb);
    end


endmodule