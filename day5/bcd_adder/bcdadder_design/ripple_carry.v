
module ripple_carry(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output s0, s1, s2, s3,
    output cout
);

wire c1, c2, c3;

fulladd fa1(a[0], b[0], cin, s0, c1);
fulladd fa2(a[1], b[1], c1,  s1, c2);
fulladd fa3(a[2], b[2], c2,  s2, c3);
fulladd fa4(a[3], b[3], c3,  s3, cout);

endmodule
