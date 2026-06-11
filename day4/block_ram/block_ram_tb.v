module block_ram_tb();

reg clk_tb;
reg arstn_tb;
reg wr_enb_tb;
reg [7:0] wrt_address_tb;
reg [7:0] read_address_tb;
reg [7:0] data_in_tb;
wire [7:0] data_out_tb;

block_ram dut(
    .clk(clk_tb),
    .arstn(arstn_tb),
    .wr_enb(wr_enb_tb),
    .wrt_address(wrt_address_tb),
    .read_address(read_address_tb),
    .data_in(data_in_tb),
    .data_out(data_out_tb)
);

always #5 clk_tb = ~clk_tb;

initial
begin
    clk_tb = 0;
    arstn_tb = 0;
    wr_enb_tb = 0;
    wrt_address_tb = 0;
    read_address_tb = 0;
    data_in_tb = 0;

    #10 arstn_tb = 1;

    // Write 11 to address 5
    wr_enb_tb = 1;
    wrt_address_tb = 8'd5;
    data_in_tb = 8'd11;
    #10;

    // Read address 50 (never written)
    wr_enb_tb = 0;
    read_address_tb = 8'd50;
    #10;

    // Write 22 to address 8
    wr_enb_tb = 1;
    wrt_address_tb = 8'd8;
    data_in_tb = 8'd22;
    #10;

    // Read address 60 (never written)
    wr_enb_tb = 0;
    read_address_tb = 8'd60;
    #10;

    // Write 33 to address 12
    wr_enb_tb = 1;
    wrt_address_tb = 8'd12;
    data_in_tb = 8'd33;
    #10;

    // Read address 5
    wr_enb_tb = 0;
    read_address_tb = 8'd5;
    #10;

    // Read address 8
    read_address_tb = 8'd8;
    #10;

    // Read address 12
    read_address_tb = 8'd12;
    #10;

    $finish;
end

endmodule
