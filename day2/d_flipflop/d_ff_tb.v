module d_ff_tb(
);

reg d_tb, clk_tb;
wire q_tb, qbar_tb;

d_flipflop dut(d_tb, clk_tb, q_tb, qbar_tb);

initial
begin
    clk_tb = 0;
end

always #5 clk_tb = ~clk_tb;

initial
begin
    #0  d_tb = 0;
    #10 d_tb = 1;
    #10 d_tb = 0;
    #10 d_tb = 1;
    #10;
    end
endmodule
