FIFO Transaction :

> Description

A transaction class is used to store the input and output data associated with a FIFO operation. It acts as a data container that is exchanged between verification components such as the generator, driver, monitor, and scoreboard.

 >Transaction Class

<img width="645" height="285" alt="image" src="https://github.com/user-attachments/assets/9b958003-ff86-44c3-941f-d4252ed9d42c" />




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






