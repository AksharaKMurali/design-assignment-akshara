module mod_out(
    input wire clk,
    input wire rst,
    input wire [7:0] fifo_data,
    input wire fifo_empty,

    output reg rd_en,
    output reg [7:0] dout,
    output reg dout_valid
);

reg [1:0] count;

always @(posedge clk)
begin
    if(rst)
    begin
        count <= 0;
        rd_en <= 0;
        dout <= 0;
        dout_valid <= 0;
    end
    else
    begin
        rd_en <= 0;
        dout_valid <= 0;

        if(count == 2)
        begin
            count <= 0;

            if(!fifo_empty)
            begin
                rd_en <= 1;
                dout <= fifo_data;  
                dout_valid <= 1;
            end
        end
        else
            count <= count + 1;
    end
end

endmodule
