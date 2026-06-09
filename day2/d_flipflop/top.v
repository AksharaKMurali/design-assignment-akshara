
module d_flipflop(
    input d, clk,
    output reg q, qbar
);

always @(posedge clk)
begin
    q    <= d;
    qbar <= ~d;
end

endmodule
