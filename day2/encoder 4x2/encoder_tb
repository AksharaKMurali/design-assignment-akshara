module encoder4_2_tb(
);

reg [3:0] d_tb;
wire [1:0] b_tb;

encoder dut(d_tb,b_tb);

initial
begin
    d_tb = 4'b0001;
     #10;
    d_tb = 4'b0010; 
    #10;
    d_tb = 4'b0100;
     #10;
    d_tb = 4'b1000;
     #10;

    $finish;
end

endmodule
