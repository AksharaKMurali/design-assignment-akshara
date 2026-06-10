
module seq_det_1110(
input clk,rst,din,output reg detected

    );
     parameter idle=2'b00;
     parameter s1=2'b01;
     parameter s2=2'b10;
     parameter s3=2'b11;
     
     reg[1:0] ps,ns;
     
     //present state logic
         always @(posedge clk)
     begin
     if(rst) begin
     ps<=idle;
     end
     else 
     ps<=ns; 
     end
  
     //next state logic
  
   always @(*)
begin
    ns = ps;
    detected = 0;

    case(ps)

    idle:
        if(din)
            ns = s1;
        else
            ns = idle;

    s1:
        if(din)
            ns = s2;
        else
            ns = idle;

    s2:
        if(din)
            ns = s3;
        else
            ns = idle;

    s3:
        if(din == 0)
        begin
            ns = idle;
            detected = 1;
        end
        else
            ns = s3;

    endcase
end
     
endmodule
