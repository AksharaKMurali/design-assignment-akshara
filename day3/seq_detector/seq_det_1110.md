Sequence Detector (1110 Overlap)

Objective

Design a sequence detector that detects:
1110
with overlapping capability, meaning detection continues even after a successful match.

 Working Principle:

The FSM shifts through states as input arrives bit-by-bit:
| State | Meaning                  |
| ----- | ------------------------ |
| S0    | No match                 |
| S1    | detected `1`             |
| S2    | detected `11`            |
| S3    | detected `111`           |
| S4    | detected `1110` (OUTPUT) |

After detection, the machine does not reset fully — it allows overlapping sequences.

 Features:
 
>Overlapping sequence detection

>Synchronous FSM design

>Single-bit serial input (din)

>Output pulse on detection


Input / Output:

| Signal   | Description                 |
| -------- | --------------------------- |
| clk      | Clock                       |
| rst      | Reset                       |
| din      | Serial input bit            |
| detected | Output high when 1110 found |

<img width="313" height="530" alt="image" src="https://github.com/user-attachments/assets/a2b04972-368a-48aa-8d44-a62cf61d6d89" />

.

<img width="249" height="292" alt="image" src="https://github.com/user-attachments/assets/51819939-954d-4798-a430-32a6b28ed9fe" />

testbench:

.
<img width="427" height="420" alt="image" src="https://github.com/user-attachments/assets/7b3a798e-4de2-4bc5-9518-d17527447028" />



outut simulation:
<img width="1056" height="412" alt="image" src="https://github.com/user-attachments/assets/f27f9ff5-33ef-4aa9-88ac-3ad136511ec6" />

