module memory (addr,wr,clk,mask,c_en,wr_data,rd_data);
   
    input wire [7:0] addr;
    input wire clk;
    input wire wr;
    input wire c_en;
    input wire [31:0] mask;
    input wire [31:0] wr_data;
    output reg [31:0] rd_data;


    reg [31:0] mem_array [255:0];

    always @(posedge clk) begin
      
    if (c_en) begin
        
        if (wr ) begin
           mem_array[addr] <= wr_data & mask;
          end
        
         if(!wr) begin
         rd_data = mem_array[addr] ;
        end
      end

      else begin

     rd_data = mem_array[addr];
      end

    end

endmodule