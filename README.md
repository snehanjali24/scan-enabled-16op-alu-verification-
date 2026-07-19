# Scan-Enabled 16-Operation 4-Bit ALU | RTL Design & Functional Verification

## Overview

Designed and functionally verified a **Scan-Enabled 4-Bit ALU** supporting **16 arithmetic, logical, shift, comparison, and unary operations** using **Verilog HDL**. Implemented a **4-stage Scan Chain** using **Scan D Flip-Flops** to demonstrate **basic Design-for-Testability (DFT)** principles. Developed a **self-checking Verilog testbench** to verify all ALU operations and scan functionality. Successfully simulated using **Vivado 2025.2** and synthesized using **Yosys**.

---

## Features

- RTL Design using Verilog HDL
- 16 ALU Operations
- 4-Stage Scan Chain
- Scan D Flip-Flop Implementation
- Basic Design-for-Testability (DFT)
- Self-Checking Verilog Testbench
- Functional Verification
- Scan Shift Verification
- RTL Simulation
- RTL Synthesis

---

## ALU Operations

| Opcode | Operation |
|---------|-----------|
| 0000 | Addition |
| 0001 | Subtraction |
| 0010 | AND |
| 0011 | OR |
| 0100 | XOR |
| 0101 | XNOR |
| 0110 | NAND |
| 0111 | NOR |
| 1000 | Left Shift |
| 1001 | Right Shift |
| 1010 | Increment |
| 1011 | Decrement |
| 1100 | Addition with Carry |
| 1101 | A > B |
| 1110 | A == B |
| 1111 | Bitwise NOT A |

---

## Verification

- Verified all **16 ALU operations** using a self-checking Verilog testbench.
- Validated **functional mode**, **scan enable**, and **scan shift** operations.
- Confirmed **scan-chain connectivity** across all four Scan D Flip-Flops.
- Generated simulation waveforms to verify expected outputs.
- Successfully completed functional simulation in **Vivado 2025.2**.

---

## Project Structure

```text
scan-enabled-16op-alu-verification/
│
├── rtl/
│   ├── alu_scan.v
│   └── scan_dff.v
│
├── tb/
│   └── alu_scan_tb.v
│
├── synthesis/
│   └── synth.ys
│
├── docs/
│   ├── rtl_schematic.png
│   └── waveform.png
│
└── README.md
```

---

## Tools

- Verilog HDL
- Vivado 2025.2
- Yosys
- XSim Simulator

---

## Technologies & Skills

- Verilog HDL
- RTL Design
- Functional Verification
- Testbench Development
- Scan Chain
- Scan D Flip-Flops
- Basic DFT
- Digital Logic Design
- RTL Simulation
- RTL Synthesis
- Vivado
- Yosys

---

## Results

- Successfully designed and verified a **16-operation Scan-Enabled 4-Bit ALU**.
- Verified both **functional** and **scan-shift** behavior.
- Generated **RTL schematic** and **simulation waveforms**.
- Successfully synthesized the RTL design using **Yosys**.

---

## Author

**Snehanjali**
