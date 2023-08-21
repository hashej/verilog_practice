module mux(sel,en,out,x);
    output reg out;
    input [1:0]sel;
    input wire en;
    input wire [0:3]x;

    always @*
    begin
        if (sel == 2'b00 && en) begin
            out = x[0];
        end
        else if (sel == 2'b01 && en) begin
            out = x[1];
        end
        else if (sel == 2'b10 && en) begin
            out = x[2];
        end
        else begin
            out = x[3];
        end
    end

endmodule
