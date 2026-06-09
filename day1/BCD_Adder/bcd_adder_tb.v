module bcd_adder_tb;

reg [3:0] a_tb, b_tb;
reg cin_tb;

wire s0_tb, s1_tb, s2_tb, s3_tb;
wire cout_tb;

bcd_adder dut( a_tb,b_tb,cin_tb,s0_tb,s1_tb,s2_tb,s3_tb, cout_tb
);

initial
begin
    cin_tb = 0;

    a_tb = 4'd3;
    b_tb = 4'd4;
     #10;  
    a_tb = 4'd5;
    b_tb = 4'd4;
     #10;  
     
    a_tb = 4'd7;
    b_tb = 4'd5;
    #10;  
    a_tb = 4'd8;
    b_tb = 4'd8; 
    #10; 
    a_tb = 4'd9;
    b_tb = 4'd9;
     #10;   

    $finish;
end

endmodul
