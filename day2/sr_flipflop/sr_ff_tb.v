
module sr_ff_tb(
);


reg S_tb, R_tb, clk_tb;
wire Q_tb, Qbar_tb;
sr_flipflop dut(S_tb, R_tb, clk_tb, Q_tb, Qbar_tb);
initial
    clk_tb = 0;

always #5 clk_tb = ~clk_tb;

initial
begin
    S_tb = 0;
    R_tb = 0;
      #10;
    S_tb = 1;
     R_tb = 0;
      #10;
    S_tb = 0;
     R_tb = 0;
      #10;
    S_tb = 0;
     R_tb = 1; 
     #10;
    S_tb = 0;
     R_tb = 0; 
     #10;
    S_tb = 1;
     R_tb = 1;
      #10;

    $finish;
end

endmodule
