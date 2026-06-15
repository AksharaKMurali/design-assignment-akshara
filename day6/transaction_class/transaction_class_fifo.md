FIFO Transaction Class :



>Description

A transaction class is used to store all input and output signals associated with a FIFO operation. It acts as a data container that can be randomized and passed between verification components during simulation.

>Transaction Class

<img width="602" height="445" alt="image" src="https://github.com/user-attachments/assets/5fd11290-9d5a-48ce-8944-f92e1772d4e9" />





| Variable    | Description           |
| ----------- | --------------------- |
| rst_tb      | Reset signal          |
| wrenb_tb    | Write enable signal   |
| rdenb_tb    | Read enable signal    |
| data_in_tb  | Input data to FIFO    |
| data_out_tb | Output data from FIFO |
| full        | FIFO full flag        |
| empty       | FIFO empty flag       |

>Constraint Details

* Reset is generated less frequently than normal operations.
* Write enable is generated more frequently to fill the FIFO.
* Read enable is generated less frequently.
* Input data is randomized with higher probability for `FF` and lower probability for `AA` and `55`.

  > Distribution Constraint (dist)

The `dist` keyword is used for weighted randomization. Values with higher weights are generated more frequently than values with lower weights.


```systemverilog
rst_tb dist {0:=8,1:=2};
```

* `rst_tb = 0` → 80%
* `rst_tb = 1` → 20%

```systemverilog
wrenb_tb dist {0:=2,1:=8};
```

* `wrenb_tb = 1` → 80%
* `wrenb_tb = 0` → 20%

```systemverilog
data_in_tb dist {
    8'hFF := 10,
    8'hAA := 5,
    8'h55 := 5
};
```

* `FF` → 50%
* `AA` → 25%
* `55` → 25%

Using `dist` helps generate specific values more often during randomization.










