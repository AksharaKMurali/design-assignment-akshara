
interface bcd_adder_if;
    logic [3:0] a;
    logic [3:0] b;
    logic cin;
    logic s0;
    logic s1;
    logic s2;
    logic s3;
    logic cout;
endinterface

module bcd_interface;

    bcd_adder_if aif();

    bcd_adder dut(
        aif.a,
        aif.b,
        aif.cin,
        aif.s0,
        aif.s1,
        aif.s2,
        aif.s3,
        aif.cout
    );

    initial begin
        aif.a = 4;
        aif.b = 3;
        aif.cin = 1;
        #10;

        aif.a = 3;
        aif.b = 7;
        aif.cin = 0;
        #10;

        $finish;
    end

    initial begin
        $monitor("a=%d b=%d cin=%b sum=%b%b%b%b cout=%b",
                 aif.a,aif.b,aif.cin,
                 aif.s3,aif.s2,aif.s1,aif.s0,
                 aif.cout);
    end

endmodule
