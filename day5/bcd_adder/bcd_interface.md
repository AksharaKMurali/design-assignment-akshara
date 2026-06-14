# BCD Adder 


 Description:
 

A BCD Adder performs the addition of two BCD digits along with an optional carry input. If the binary sum exceeds 9, a correction value of 6 (0110) is added to produce a valid BCD output.

A SystemVerilog interface is used to group all DUT signals together, simplifying the connection between the testbench and the design.

> Interface Declaration

```systemverilog
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
```

## Signals

| Signal | Direction | Description      |
| ------ | --------- | ---------------- |
| a      | Input     | First BCD digit  |
| b      | Input     | Second BCD digit |
| cin    | Input     | Carry input      |
| s0     | Output    | Sum bit 0        |
| s1     | Output    | Sum bit 1        |
| s2     | Output    | Sum bit 2        |
| s3     | Output    | Sum bit 3        |
| cout   | Output    | Carry output     |

> DUT Instantiation

```systemverilog
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
```

The interface instance `aif` acts as a communication layer between the testbench and the BCD Adder.



### Test Case 1

```systemverilog
aif.a   = 4'd4;
aif.b   = 4'd3;
aif.cin = 1'b1;
```

Expected Result:

```text
4 + 3 + 1 = 8
BCD Output = 1000
Carry = 0
```

### Test Case 2

```systemverilog
aif.a   = 4'd3;
aif.b   = 4'd7;
aif.cin = 1'b0;
```

Expected Result:

```text
3 + 7 = 10
BCD Output = 0000
Carry = 1
```



# Expected Output

<img width="1048" height="460" alt="image" src="https://github.com/user-attachments/assets/bd52863e-0587-4e53-85c7-5c09e0bf9075" />

>Advantages of Using Interface

1. Reduces the number of port connections.
2. Improves code readability.
3. Groups related signals into a single construct.
4. Simplifies verification and debugging.
5. Enhances testbench reusability.



