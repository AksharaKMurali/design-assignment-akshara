module ripple_carry_tb(

    );

reg [3:0] a_tb, b_tb;
reg cin_tb;
wire s0_tb, s1_tb, s2_tb, s3_tb;
wire cout_tb;
integer i;
ripple_carry dut( a_tb,b_tb, cin_tb,s0_tb, s1_tb,s2_tb,s3_tb, cout_tb
);
initial
begin
    cin_tb = 0;
    for(i = 0; i < 16; i = i + 1)
    begin
        a_tb = i;
        b_tb = i;
        #10;
    end
    $finish;
end

endmodule
