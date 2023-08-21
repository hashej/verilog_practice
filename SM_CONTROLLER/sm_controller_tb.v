module sm_controller_tb();
    reg [2:0]opcode;
    reg zero;
    reg clk;
    reg rst;
    wire mem_rd;
    wire load_ir;
    wire halt;
    wire inc_pc;
    wire load_ac;
    wire load_pc;
    wire mem_wr; 
    wire state_reg;
    wire n_state;

    sm_controller u_sm_controller(
        .opcode(opcode),
        .zero(zero),
        .clk(clk),
        .rst(rst),
        .mem_rd(mem_rd),
        .load_ir(load_ir),
        .halt(halt),
        .inc_pc(inc_pc),
        .load_ac(load_ac),
        .load_pc(load_pc),
        .mem_wr(mem_wr)
    );
    always #5 clk= ~clk;
    initial begin
        rst=1;opcode=3'b000;zero=0;clk=0;
        rst=0;
        #10;rst=1;
        opcode=3'b000; 
        #20;
        #20;
        #10;
        opcode=3'b001; 
        #20;
        #20;
        #20;
        #20;

        $finish;
    end
    initial begin
    $dumpfile("sm_controller.vcd");
    $dumpvars(0,sm_controller_tb);
    end
endmodule
