FIFO Transaction Class :



>Description

A transaction class is used to store all input and output signals associated with a FIFO operation. It acts as a data container that can be randomized and passed between verification components during simulation.

>Transaction Class

```systemverilog
class transaction;

rand bit rst_tb,wrenb_tb,rdenb_tb;
rand bit [7:0] data_in_tb;

bit [7:0] data_out_tb;
bit full,empty;

constraint c1 {
    rst_tb dist {0:=8,1:=2};
    wrenb_tb dist {0:=2,1:=8};
    rdenb_tb dist {0:=8,1:=2};

    data_in_tb dist {
        8'hFF := 10,
        8'hAA := 5,
        8'h55 := 5
    };
}

function void display();
    $display("rst_tb=%0d wrenb_tb=%0b rdenb_tb=%0b din=%0h dout=%0h full=%0b empty=%0b",
              rst_tb,wrenb_tb,rdenb_tb,data_in_tb,data_out_tb,full,empty);
endfunction

endclass
```

## Variables Used

| Variable    | Description           |
| ----------- | --------------------- |
| rst_tb      | Reset signal          |
| wrenb_tb    | Write enable signal   |
| rdenb_tb    | Read enable signal    |
| data_in_tb  | Input data to FIFO    |
| data_out_tb | Output data from FIFO |
| full        | FIFO full flag        |
| empty       | FIFO empty flag       |

## Constraint Details

* Reset is generated less frequently than normal operations.
* Write enable is generated more frequently to fill the FIFO.
* Read enable is generated less frequently.
* Input data is randomized with higher probability for `FF` and lower probability for `AA` and `55`.

## Display Function

The display function prints all transaction information during simulation, making it easier to debug and verify FIFO behavior.

## Advantages

* Supports constrained random verification.
* Improves testbench reusability.
* Simplifies debugging and monitoring.
* Organizes FIFO signals into a single object.

## Conclusion

The FIFO transaction class was created using SystemVerilog OOP concepts. Randomized inputs and constraints help generate different FIFO scenarios, while the display function assists in observing transaction activity during simulation.







