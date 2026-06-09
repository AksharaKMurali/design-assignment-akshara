module sr_flipflop(input S,R,clk,output reg Q,Qbar
);

always @(posedge clk)
begin
    if (S == 0 && R == 0)
    begin
        Q <= Q;
        Qbar <= Qbar;
    end
    else if (S == 0 && R == 1)
    begin
        Q <= 0;
        Qbar <= 1;
    end
    else if (S == 1 && R == 0)
    begin
        Q <= 1;
        Qbar <= 0;
    end
    else
    begin
        Q <= 1'bx;     
        Qbar <= 1'bx;
    end
end

endmodule
