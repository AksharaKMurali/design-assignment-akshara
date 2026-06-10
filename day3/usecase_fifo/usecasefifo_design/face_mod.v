module face_mod (
    input  wire       clk,
    input  wire [7:0] cin,
    output reg  [7:0] sout
);
    always @(posedge clk)
        sout <= cin;
 
endmodule
