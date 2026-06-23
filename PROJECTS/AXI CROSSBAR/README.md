AXI4 Crossbar Verification Suite
--------------------------------
Project Description:
This repository holds the verification framework for a highly performant AXI4 Crossbar Interconnect. The crossbar itself is an adaptable design that allows for concurrent transactions between multiple masters and slaves with the capability to adaptively arbitrate and monitor errors. The verification group worked diligently to validate that the crossbar was reliable, protocol-compliant, and stress tolerant, performing with no deadlocks or protocol errors.

Verification Technique:
The verification approach uses a modular agents-based approach for modeling the 4x4 AXI system. Modular Agents: Independent Master drivers and Slave responders for separate channel controls (AW, W, B, AR, and R). Stress Injection: Concentrates on “corner cases” of traffic like starvation floods, matrix congestion, and backpressure. Protocol Validation: Verification of AXI handshake and non-blocking fabric behavior under multi-master accesses.

<img width="717" height="418" alt="image" src="https://github.com/user-attachments/assets/03212cca-6faa-4cce-b456-66d3d038319c" />

Verification Modules Verification of key components:
- AXICB Master Driver (axicb_master_driver.sv)
    - This is a SystemVerilog module to create bursts of transactions.
    - drive_write_burst(addr, burst_len, master_id) task performs address, data, and response phases of the transaction for testing arbitration and ordering.
- Adaptive Arbiter Monitor
    - This module verifies dynamic change of priorities according to traffic.
- AXI Response Monitor (axicb_resp_monitor)
    - This monitors error responses (SLVERR/DECERR).
- Timeout Detector
    - It has separate counters for read/write transactions.

Verification Scenarios:
Starvation Flood: High-priority masters flood the switch to check that the low-priority masters complete their tasks without any deadlocks.
Matrix Congestion: Simulates cross-routing at the same time to check the non-blocking nature of the fabric and also that there is no data leakage.
Slave Backpressure: Simulates backpressure on the slaves by high latency weights (upto 6 cycles) to check the "Ready" signal deassertion on the switch.

Final Results of Verification

Stability: System has absolute stability in 100% saturation bandwidth.  
Performance: System has completed 100% of 16-beats bursts with very extreme asymmetric pipeline delays.  
Reliability: System is 100% deadlock free, and there

**1. Test Case 1: Starvation \& Priority Arbitration**
**What we see: The i\_awch (Master Write Address Channel) shows transactions starting early in the timeline (around the 5-10µs mark). You can see the e0a06020 pattern evolving into 1a152010.**
**The Result: The o\_awvalid and o\_awready signals on the slave side show that the crossbar successfully routed these requests to the appropriate slaves. The arbiter is clearly functioning because multiple i\_awvalid pulses are being "serialized" by the DUT before reaching the output ports, confirming priority-based arbitration is active.**

**2. Test Case 2: Matrix Congestion**
**What we see: Around the 15-20µs window, the data bus (i\_wch) shows high activity. The values change from 30201000 to 33231303 and 31211101.**
**The Result: This demonstrates high-density traffic. The fact that the o\_wready and o\_wvalid signals remain stable during this period proves that the crossbar is successfully managing a "Full Matrix Swap" (all masters talking to all slaves) without stalling the entire fabric. The data integrity is maintained as these distinct, unique patterns pass through the switch.**

**3. Test Case 3: Extreme Backpressure (Stalls)**
**What we see: Look at the o\_bvalid and o\_bready signals toward the end (20-25µs). You see the values toggling between 1, 8, 0, and e (1110 in binary).**
**The Result: This is the most important part of your waveform.**
**The toggling on o\_bvalid is the slave telling the master, "I am finishing my write, but I am slow (due to the backpressure weight you added)."**
**The crossbar is successfully passing this "Wait" signal back to the masters.**
**This confirms that the Pipeline Stall mechanism is working—the crossbar is correctly exerting backpressure to prevent the masters from flooding the system while the slaves are busy.**



<img width="1245" height="591" alt="WhatsApp Image 2026-06-22 at 9 13 29 PM" src="https://github.com/user-attachments/assets/b9753b5e-c94d-4c11-a3c6-27518fb1dd26" />
<img width="1249" height="584" alt="WhatsApp Image 2026-06-22 at 9 13 31 PM" src="https://github.com/user-attachments/assets/54149737-58e4-4486-bc44-87fa622b48ca" />

<img width="1157" height="505" alt="WhatsApp Image 2026-06-23 at 10 58 48 AM" src="https://github.com/user-attachments/assets/9abf3565-4b19-4c7d-994a-6b3b4e40f818" />
<img width="1150" height="500" alt="WhatsApp Image 2026-06-23 at 10 58 47 AM" src="https://github.com/user-attachments/assets/50a7b75a-3295-4e47-b9f4-f6a59f0cf74a" />
<img width="1158" height="505" alt="WhatsApp Image 2026-06-23 at 10 58 46 AM" src="https://github.com/user-attachments/assets/f1676502-375a-43dd-aa36-8472fece726a" />
<img width="1156" height="481" alt="WhatsApp Image 2026-06-23 at 10 58 41 AM" src="https://github.com/user-attachments/assets/36e398ce-9036-4494-a184-766616eeef7e" />
<img width="1152" height="515" alt="WhatsApp Image 2026-06-23 at 10 58 50 AM" src="https://github.com/user-attachments/assets/0645a568-2f5f-4e0b-819c-368fcc54476a" />
<img width="1149" height="445" alt="WhatsApp Image 2026-06-23 at 10 58 50 AM (1)" src="https://github.com/user-attachments/assets/0a671d90-5724-43bb-b3cd-4e769a2a84da" />
<img width="1148" height="522" alt="WhatsApp Image 2026-06-23 at 10 58 49 AM" src="https://github.com/user-attachments/assets/4b4c84c7-cc39-4ff8-a3cd-f1630e82718e" />


