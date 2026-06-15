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









