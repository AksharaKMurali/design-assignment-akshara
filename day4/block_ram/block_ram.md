
# Block Memory Generator

## Aim

To design and implement a Block Memory Generator in Verilog HDL for performing read and write operations.

## Description

The Block Memory Generator is a memory module that supports synchronous read and write operations. Data is written into memory when the write enable signal is asserted and read from memory when the write enable signal is deasserted. The design uses separate write and read addresses and includes an asynchronous active-low reset.

## Inputs

* `clk` : Clock signal
* `arstn` : Asynchronous active-low reset
* `wr_enb` : Write enable signal
* `wrt_address[7:0]` : Write address
* `read_address[7:0]` : Read address
* `data_in[7:0]` : Input data

## Output

* `data_out[7:0]` : Output data

## Operation

* When `wr_enb = 1`, data present at `data_in` is written to the memory location specified by `wrt_address`.
* When `wr_enb = 0`, data stored at `read_address` is transferred to `data_out`.
* When `arstn = 0`, the memory and output are reset.
* Read and write operations occur on the rising edge of the clock.

## Simulation Result

The simulation verified successful write and read operations. Data written to memory locations was correctly retrieved through the corresponding read addresses, confirming proper memory functionality.


<img width="1054" height="464" alt="image" src="https://github.com/user-attachments/assets/6c8daa31-2114-4c3d-8a8f-9ab5bc07a8dc" />

