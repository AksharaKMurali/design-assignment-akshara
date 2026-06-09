
module fulladd(input a,b,c ,output sum, carry

    );
    wire w1,w2, w3;
    xor(sum,a,b,c);
    and(w1,a,b);
    and(w2,a,c);
    and(w3,b,c);
    or(carry,w1,w2,w3);
    
endmodule
