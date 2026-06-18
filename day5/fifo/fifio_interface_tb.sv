interface fifo_if;
    logic clk;
    logic rst;
    logic wr_enb;
    logic rd_enb;
    logic [7:0] data_in;
    logic full;
    logic empty;
    logic [7:0] data_out;
endinterface


module fifo_interface;

    fifo_if aif();

    fifo dut(
        aif.clk,
        aif.rst,
        aif.wr_enb,
        aif.rd_enb,
        aif.data_in,
        aif.full,
        aif.empty,
        aif.data_out
    );

    initial begin
        aif.clk     = 0;
        aif.rst     = 0;
        aif.wr_enb  = 0;
        aif.rd_enb  = 0;
        aif.data_in = 0;

        #10;
        aif.rst = 1;

        #10;
        aif.rst = 0;

        // Write data into FIFO
        aif.wr_enb = 1;

        aif.data_in = 8'h4F; #10;
        aif.data_in = 8'h12; #10;
        aif.data_in = 8'hEF; #10;
        aif.data_in = 8'h48; #10;
        aif.data_in = 8'h78; #10;
        aif.data_in = 8'h19; #10;
        aif.data_in = 8'h63; #10;
        aif.data_in = 8'hAB; #10;

        // Read data from FIFO
        aif.wr_enb = 0;
        aif.rd_enb = 1;

        #90;
        $finish;
    end

    always #5 aif.clk = ~aif.clk;

    initial begin
        $monitor("Time=%0t din=%h dout=%h full=%b empty=%b",
                  $time,
                  aif.data_in,
                  aif.data_out,
                  aif.full,
                  aif.empty);
    end

endmodule

