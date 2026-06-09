
module encoder(input[3:0]d,output reg [1:0]b

    );
    always @(*)
    begin
    if(d[0])
    b=2'b00;
    else if(d[1])
    b=2'b01;
    else if(d[2])
    b=2'b10;
    else
    b=2'b11;
    end
endmodule
