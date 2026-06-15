FIFO Transaction :

>> Description

A transaction class is used to store the input and output data associated with a FIFO operation. It acts as a data container that is exchanged between verification components such as the generator, driver, monitor, and scoreboard.

 >>Transaction Class

```systemverilog
class transaction;

    rand bit        wr_enb;
    rand bit        rd_enb;
    rand bit [7:0]  data_in;

    bit [7:0]       data_out;
    bit             full;
    bit             empty;

    constraint c1 {
        !(wr_enb && rd_enb);
    }

    function void display(string s);
        $display("[%s] wr_enb=%0b rd_enb=%0b data_in=%0h data_out=%0h full=%0b empty=%0b",
                 s, wr_enb, rd_enb, data_in, data_out, full, empty);
    endfunction

endclass
```

## Variables Used

| Variable | Description             |
| -------- | ----------------------- |
| wr_enb   | Write enable signal     |
| rd_enb   | Read enable signal      |
| data_in  | Input data to FIFO      |
| data_out | Output data from FIFO   |
| full     | Indicates FIFO is full  |
| empty    | Indicates FIFO is empty |

## Constraint

```systemverilog
constraint c1 {
    !(wr_enb && rd_enb);
}
```

This constraint prevents simultaneous read and write operations during randomization.

## Display Function

```systemverilog
function void display(string s);
```

The display function is used to print transaction details during simulation for debugging and verification purposes.

## Advantages

* Encapsulates FIFO signals into a single object.
* Supports constrained random verification.
* Improves code readability and reusability.
* Simplifies debugging using the display function.

## Conclusion

The FIFO transaction class provides an object-oriented representation of FIFO operations. It stores input and output data, supports random stimulus generation, and helps in efficient verification of FIFO functionality.

