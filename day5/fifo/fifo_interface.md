##FIFO Interface

Description

A FIFO stores data in the order it is received. The first data written into the FIFO is the first data read out.

A SystemVerilog interface is used to group all FIFO signals together, simplifying connections between the DUT and the testbench.

Interface Declaration
interface fifo_if;
    logic clk;
    logic rst;
    logic wr_enb;
    logic rd_enb;
    logic [7:0] data_in;
    logic full;
    logic empty;
    logic [7:0] data_out;
endinterface
Signals
Signal	Direction	Description
clk	Input	Clock signal
rst	Input	Reset signal
wr_enb	Input	Write enable
rd_enb	Input	Read enable
data_in	Input	Data to be written
data_out	Output	Data read from FIFO
full	Output	Indicates FIFO is full
empty	Output	Indicates FIFO is empty
DUT Instantiation
fifo_if aif();

fifo dut(
    aif.clk,
    aif.rst,
    aif.wr_enb,
    aif.rd_enb,
    aif.data_in,
    aif.full,
    aif.empty,
    aif.data_out
);

The interface instance aif acts as a connection layer between the testbench and the FIFO design.

Test Procedure
Reset Operation
aif.rst = 1;
#10;
aif.rst = 0;

The FIFO is reset to initialize memory locations and pointers.

Write Operation
aif.wr_enb = 1;

aif.data_in = 8'h4F;
aif.data_in = 8'h12;
aif.data_in = 8'hEF;
aif.data_in = 8'h48;
aif.data_in = 8'h78;
aif.data_in = 8'h19;
aif.data_in = 8'h63;
aif.data_in = 8'hAB;

Eight data values are written into the FIFO.

Read Operation
aif.wr_enb = 0;
aif.rd_enb = 1;

The FIFO begins reading data in the same order in which it was written.

Clock Generation
always #5 aif.clk = ~aif.clk;

This generates a clock with:

Time Period = 10 ns
Frequency = 100 MHz
Monitoring
$monitor("din=%h dout=%h full=%b empty=%b",
         aif.data_in,
         aif.data_out,
         aif.full,
         aif.empty);

The monitor continuously displays:

Input data
Output data
Full flag
Empty flag
