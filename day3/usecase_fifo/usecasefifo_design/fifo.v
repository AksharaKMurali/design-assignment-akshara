module fifo_(
    input clk,
    input rst,
    input wrenb,
    input rdenb,
    input [7:0] data_in,

    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] mem[7:0];
reg [2:0] wr_ptr, rd_ptr;
reg [3:0] count;
integer i;

assign full  = (count == 8);
assign empty = (count == 0);

always @(posedge clk)
begin
    if(rst)
    begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count <= 0;
        data_out <= 0;

        for(i=0;i<8;i=i+1)
            mem[i] <= 0;
    end
    else
    begin
        if(wrenb && !full)
        begin
            mem[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
            count <= count + 1;
        end

        if(rdenb && !empty)
        begin
            data_out <= mem[rd_ptr]; 
            rd_ptr <= rd_ptr + 1;
            count <= count - 1;
        end
    end
end

endmodule
