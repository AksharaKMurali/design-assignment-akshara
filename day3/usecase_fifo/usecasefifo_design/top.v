
module top(
    input clk,
    input rst,
    input [7:0] cin,
    output [7:0] dout,
    output dout_valid
);

wire [7:0] face_to_fifo;
wire [7:0] fifo_to_mod;

wire fifo_full;
wire fifo_empty;
wire rd_en;

face_mod u1(
    .clk(clk),
    .cin(cin),
    .sout(face_to_fifo)
);

fifo_ u2(
    .clk(clk),
    .rst(rst),
    .wrenb(~fifo_full),
    .data_in(face_to_fifo),
    .rdenb(rd_en),
    .data_out(fifo_to_mod),
    .full(fifo_full),
    .empty(fifo_empty)
);

mod_out u3(
    .clk(clk),
    .rst(rst),
    .fifo_data(fifo_to_mod),
    .fifo_empty(fifo_empty),
    .rd_en(rd_en),
    .dout(dout),
    .dout_valid(dout_valid)
);

endmodule
