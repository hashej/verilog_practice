`timescale 1ps/1ps
module controller_tb();

    reg [2:0]phase;
    reg [2:0]opcode;
    reg zero;
    wire sel;
    wire rd;
    wire id_ir;
    wire inc_pc;
    wire halt;
    wire id_pc;
    wire data_e;
    wire id_ac;
    wire wr;

    controller u_co(
    .phase(phase),
    .opcode(opcode),
    .zero(zero),
    .sel(sel),
    .rd(rd),
    .id_ir(id_ir),
    .inc_pc(inc_pc),
    .halt(halt),
    .id_pc(id_pc),
    .data_e(data_e),
    .id_ac(id_ac),
    .wr(wr)
    );
    initial begin
        phase=3'b000;zero=0;opcode=3'b000;
        #50;
        phase=3'b110; opcode=3'b001;
        #60;
        phase=3'b001;
        #60;
        phase=3'b010;
        #60;
        phase=3'b011;opcode=3'b110;
        #60;
    end
    initial begin
        $dumpfile("controller.vcd");
        $dumpvars(0,controller_tb);
    end
endmodule



