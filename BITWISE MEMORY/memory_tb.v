module memory_tb();

    reg [7:0] addr;
    reg clk;
    reg wr;
    reg c_en;
    reg [31:0] mask;
    reg [31:0] wr_data;
    wire [31:0] rd_data;

    memory dut (
        .addr(addr),
        .wr(wr),
        .clk(clk),
        .mask(mask),
        .c_en(c_en),
        .wr_data(wr_data),
        .rd_data(rd_data)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        addr = 0;
        wr = 0;
        c_en = 0;
        mask = 32'b0;
        wr_data = 32'b0;
        #5;
        addr = 8'b00000001;
        mask=32'b00000000000000000000000000000011;
        wr = 1;
        wr_data=32'b00000000000000000000000000000001;
        c_en = 1;
        #10;
        wr=1;
        addr = 8'b00000011;
        wr_data=32'b00000000000000000000000000000111;
        mask=32'b00000000000000000000000000000111;
        c_en = 1;
        #10;
        wr=0;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("memory.vcd");
        $dumpvars(0, memory_tb);
    end

endmodule
