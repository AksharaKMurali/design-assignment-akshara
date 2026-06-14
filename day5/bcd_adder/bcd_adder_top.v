module bcd_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output s0, s1, s2, s3,
    output cout
);

wire w0, w1, w2, w3;
wire c1, k;
ripple_carry RCA1( .a(a),.b(b),.cin(cin),.s0(w0),.s1(w1),.s2(w2),.s3(w3), .cout(c1)
);

assign k = c1 | (w3 & w2) | (w3 & w1);

ripple_carry RCA2(.a({w3,w2,w1,w0}),.b({1'b0,k,k,1'b0}),.cin(1'b0),.s0(s0),.s1(s1), .s2(s2),.s3(s3),.cout(cout)
);

endmodule

