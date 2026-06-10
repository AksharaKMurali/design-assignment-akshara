module seq_detect_1110_tb(
);

reg clk_tb;
reg rst_tb;
reg din_tb;
wire detected_tb;

seq_det_1110 dut(
    .clk(clk_tb),
    .rst(rst_tb),
    .din(din_tb),
    .detected(detected_tb)
);
initial
begin
    clk_tb = 0;
end

always #5 clk_tb = ~clk_tb;

initial
begin
    rst_tb = 1;
    din_tb = 0;

    #10;
    rst_tb = 0;

    // Sequence: 1110
    #10 din_tb = 1;
    #10 din_tb = 1;
    #10 din_tb = 1;
    #10 din_tb = 0;

    #20;
    $finish;
end

initial
begin
    $monitor("Time=%0t clk=%b rst=%b din=%b detected=%b",
              $time, clk_tb, rst_tb, din_tb, detected_tb);
end

endmodule
