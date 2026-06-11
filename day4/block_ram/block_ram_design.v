
module block_ram (
    input clk,
    input arstn,
    input wr_enb,
    input [7:0] wrt_address,
    input [7:0] read_address,
    input [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] mem [0:255];
integer i;

always @(posedge clk or negedge arstn)
begin
    if (!arstn)
    begin
        data_out <= 8'd0;

        for (i = 0; i < 256; i = i + 1)
            mem[i] <= 8'd0;
    end
    else
    begin
        if (wr_enb)
            mem[wrt_address] <= data_in;
        else
            data_out <= mem[read_address];
    end
end

endmodule

