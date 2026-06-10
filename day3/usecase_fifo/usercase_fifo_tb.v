module top_tb;
reg clk;
reg rst;
reg [7:0] cin;
wire [7:0] dout;
wire dout_valid;
top DUT(
    .clk(clk),
    .rst(rst),
    .cin(cin),
    .dout(dout),
    .dout_valid(dout_valid)
);
always #5 clk = ~clk;
initial
begin
    clk = 0;
    rst = 1;
    cin = 0;
    #15;
    rst = 0;
    cin = 8'h11;
    #10;
    cin = 8'h22;
    #10;
    cin = 8'h33;
    #10;
    #300;
$finish;
end
initial
begin
    $monitor("T=%0t cin=%h dout=%h valid=%b",
              $time, cin, dout, dout_valid);
end endmodule
