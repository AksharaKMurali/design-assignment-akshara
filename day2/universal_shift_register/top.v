
module usr(
    input clk, rst, sin,
    input [3:0] p_in,
    input shift, load,
    input [1:0] mode,
    output reg [3:0] p_out,
    output reg s_out
);

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        p_out <= 4'b0000;
        s_out <= 1'b0;
    end
    else
    begin
        case(mode)

        2'b00: 
        begin
            if(shift)
            begin
                s_out <= p_out[3];
                p_out <= {p_out[2:0], sin};
            end
        end

        2'b01: 
        begin
            if(shift)
                p_out <= {p_out[2:0], sin};
        end

        2'b10: 
        begin
            if(load)
                p_out <= p_in;
            else if(shift)
            begin
                s_out <= p_out[3];
                p_out <= {p_out[2:0], 1'b0};
            end
        end

        2'b11: 
        begin
            if(load)
                p_out <= p_in;
        end

        endcase
    end
end

endmodule
