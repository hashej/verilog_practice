module controller(phase,opcode,sel,rd,id_ir,inc_pc,halt,id_pc,data_e,id_ac,wr,zero);
 input [2:0]phase;
 input [2:0]opcode;
 output reg sel;
 output reg rd;
 output reg id_ir;
 output reg inc_pc;
 output reg halt;
 output reg id_pc;
 output reg data_e;
 output reg id_ac;
 output reg wr;
 input wire zero;

 always@(*)begin
    if (phase==3'b000)begin
        sel=1;rd=0;id_ir=0;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    else if (phase==3'b001)begin
        sel=1;rd=1;id_ir=0;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    else if (phase==3'b010)begin
        sel=1;rd=1;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    else if (phase==3'b011)begin
        sel=1;rd=1;id_ir=1;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
    end
    else if (phase==3'b100)begin    
        sel=0;rd=0;id_ir=0;inc_pc=1;halt=opcode;id_pc=0;data_e=0;id_ac=0;wr=0;
        if(opcode==3'b000)begin
            halt=1;
        end
        else begin
            halt=0;
        end
    end
    else if (phase==3'b101)begin
        sel=0;rd=opcode;id_ir=0;inc_pc=0;halt=0;id_pc=0;data_e=0;id_ac=0;wr=0;
        if(opcode==3'b101)begin
        rd=1;    
        end
        else if(opcode==3'b011)begin
        rd=1;    
        end
        else if(opcode==3'b100)begin
        rd=1;    
        end
        else
        rd=0;
    end
    else if (phase==3'b110)begin
        sel=0;id_ir=0;halt=0;id_ac=0;wr=0;
        rd=opcode;
        if(opcode==3'b101)
        rd=1;
        else if(opcode==3'b011)
        rd=1;
        else if(opcode==3'b100)
        rd=1;
        else
        rd=0;
        inc_pc=opcode;
        if(opcode==3'b001 && zero==0)
        inc_pc=1;
        else
        inc_pc=0;
        id_pc=opcode;
        if(opcode==3'b111)
        id_pc=1;
        else
        id_pc=0;
        data_e=opcode;
        if(opcode==3'b110)
        data_e=1;
        else
        data_e=0;
    end
    else if (phase==3'b111)begin
        sel=0;id_ir=0;inc_pc=0;halt=0;
        rd=opcode;
        if(opcode==3'b101)
        rd=1;
        else if(opcode==3'b011)
        rd=1;
        else if(opcode==3'b100)
        rd=1;
        else
        rd=0;
        id_pc=opcode;
        if(opcode==3'b111)
        id_pc=1;
        else
        id_pc=0;
        id_ac=opcode;
        if(opcode==3'b101)
        id_ac=1;
        else if(opcode==3'b011)
        id_ac=1;
        else if(opcode==3'b100)
        id_ac=1;
        else
        id_ac=0;
        wr=opcode;
        if(opcode==3'b110)
        wr=1;
        else
        wr=0;
        data_e=opcode;
        if(opcode==3'b110)
        data_e=1;
        else
        data_e=0;
    end
 end
endmodule
