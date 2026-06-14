

module fifo(
    input clk,
    input rst,
    input wr_enb,
    input rd_enb,
    input [7:0] data_in,
    output reg full,
    output reg empty,
    output reg [7:0] data_out
);

    reg [7:0] mem [0:7];
    reg [2:0] wr_ptr;
    reg [2:0] rd_ptr;
    reg [3:0] count;

    integer i;

    always @(posedge clk)
    begin
        if(rst)
        begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count <= 0;
            data_out <= 0;
            full <= 0;
            empty <= 1;

            for(i=0; i<8; i=i+1)
                mem[i] <= 0;
        end
        else
        begin
            if(wr_enb && !full)
            begin
                mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1;
                count <= count + 1;
            end

            if(rd_enb && !empty)
            begin
                data_out <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1;
                count <= count - 1;
            end

            full  <= (count == 7);
            empty <= (count == 0);
        end
    end

endmodule
