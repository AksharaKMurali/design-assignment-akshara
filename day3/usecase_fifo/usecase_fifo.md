OBJECTIVE:

Design a pipelined system that:

>Accepts 8-bit input (cin)

>Buffers data using FIFO

>Outputs data every 3rd clock cycle

>Ensures no data loss


System Architecture: cin → face_mod → FIFO → mod_out → dout

MODULES:


1️.face_mod

>Simple input register

>Captures 8-bit input every clock

>sout <= cin;



2️.FIFO (8-bit, depth 8)

>Stores incoming data stream

>Handles buffering between fast input and slow output

>Features:Write pointer,Read pointer

>Count-based full/empty logic



3️.mod_out (3-cycle FSM)

>Controls read operation

>Outputs data every 3rd clock cycle

>Behavior:Wait 3 cycles → read FIFO → output 

>Repeats continuously


4️.top module:

>Integrates all modules: face_mod → fifo → mod_out


Timing Behavior:

Clock	Input	FIFO	Output
| Clock | Input | FIFO  | Output |
| ----- | ----- | ----- | ------ |
| 1     | 00    | store | -      |
| 2     | 11    | store | -      |
| 3     | 22    | store | 00     |
| 4     | 33    | store | -      |
| 5     | 44    | store | -      |
| 6     | -     | read  | 11     |
| 7     | -     | read  | 22     |
| 8     | -     | read  | 33     |
| 9     | -     | read  | 44     |

 
 Features:
 
>FIFO buffering (no data loss)

>Controlled output scheduling

>Clock-based FSM control

>Clean modular design

face_mod:

.
<img width="515" height="538" alt="image" src="https://github.com/user-attachments/assets/98642add-c0c8-46e7-8df4-fc12aa45ffc3" />

fifo:

.
<img width="292" height="551" alt="image" src="https://github.com/user-attachments/assets/42cc6758-a088-450c-9bc5-3b2d7737702c" />
.
<img width="288" height="325" alt="image" src="https://github.com/user-attachments/assets/76645d06-621c-4f8b-ae78-a48ca8670603" />


mod_out:

<img width="327" height="584" alt="image" src="https://github.com/user-attachments/assets/bc183daf-cc21-445f-a6eb-c3db8961cc49" />

top:
<img width="303" height="525" alt="image" src="https://github.com/user-attachments/assets/fa30951b-c090-4364-83d6-11823fd09783" />
.
<img width="274" height="206" alt="image" src="https://github.com/user-attachments/assets/3d7c5ebe-c9fd-4522-8aba-8825f140b887" />

testbench:

<img width="362" height="601" alt="image" src="https://github.com/user-attachments/assets/9ffea5cb-eec0-4887-aaa9-b4d638510c08" />










simulation output:
<img width="1056" height="416" alt="image" src="https://github.com/user-attachments/assets/69d34f86-9aca-41bd-be8d-d7568b403a80" />

