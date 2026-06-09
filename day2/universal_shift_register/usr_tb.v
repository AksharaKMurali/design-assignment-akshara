

module usr_tb(
);

reg clk_tb, rst_tb, sin_tb, shift_tb, load_tb;
reg [3:0] p_in_tb;
reg [1:0] mode_tb;

wire [3:0] p_out_tb;
wire s_out_tb;

usr dut(clk_tb,rst_tb,sin_tb, p_in_tb,shift_tb,load_tb, mode_tb,p_out_tb,
    s_out_tb);

initial
    clk_tb = 0;

always #5 clk_tb = ~clk_tb;

initial
begin
    rst_tb   = 1;
    sin_tb   = 0;
    shift_tb = 0;
    load_tb  = 0;
    mode_tb  = 2'b00;
    p_in_tb  = 4'b0000;

    #10 rst_tb = 0;

    mode_tb  = 2'b00;
    shift_tb = 1;
    sin_tb = 1; #10;
    sin_tb = 0; #10;
    sin_tb = 1; #10;
    sin_tb = 1; #10;

    mode_tb = 2'b01;
    sin_tb = 1; #10;
    sin_tb = 0; #10;
    sin_tb = 1; #10;
    sin_tb = 0; #10;

    mode_tb = 2'b10;
    load_tb = 1;
    p_in_tb = 4'b1101;
    #10;

    load_tb = 0;
    shift_tb = 1;
    #40;

    mode_tb = 2'b11;
    load_tb = 1;
    p_in_tb = 4'b1010;
    #10;

    $finish;
end

initial
begin
    $monitor("t=%0t mode=%b p_in=%b sin=%b p_out=%b s_out=%b",
              $time, mode_tb, p_in_tb, sin_tb, p_out_tb, s_out_tb);
end

endmodule
