module mux_tb();

    
    reg [3:0] x;
    reg en;
    reg [1:0] sel;
    wire out;

    
    mux u_mux(
        .x(x),
        .en(en),
        .sel(sel),
        .out(out)
    );

    
    initial begin
        x = 4'b0111;
        en = 1'b1;
        sel = 2'b00;

        // Test case 1: sel = 00, en = 1
        #10;
        en = 1'b1;
        sel = 2'b00;
        #10;
        $display("Test Case 1: out = %b", out);

        
        #10;
        sel = 2'b01;
        #10;
        $display("Test Case 2: out = %b", out);

        
        #10;
        sel = 2'b10;
        #10;
        $display("Test Case 3: out = %b", out);

        
        #10;
        sel = 2'b11;
        #10;
        $display("Test Case 4: out = %b", out);

        $finish;
    end
    initial begin
    $dumpfile("mux.vcd");
    $dumpvars(0,mux_tb);
    end

endmodule

