# 🚦 Traffic Light Controller – VLSI Project

A Verilog HDL-based implementation of a **Traffic Light Controller** using Finite State Machine (FSM) design principles. Developed as part of a VLSI (Very Large Scale Integration) project to simulate a real-world intersection with programmable traffic signals.

---

## 📁 Project Structure


---

## ⚙️ Features

- **Synchronous FSM** implementation
- Separate handling for **North-South (NS)** and **East-West (EW)** signals
- States:
  - NS Green / EW Red
  - NS Yellow / EW Red
  - NS Red / EW Green
  - NS Red / EW Yellow
- Time-controlled transitions (based on clock cycles)
- Simulatable using **ModelSim**, **Vivado**, or **Icarus Verilog**

---

## 🧠 Design Overview

The controller operates on a clock and reset signal. Using a 2-bit state encoding, it transitions between states on each timer expiration. Lights are controlled using output registers mapped to Red, Yellow, Green for both directions.

---

## 🛠️ Tools Used

- Verilog HDL
- [ModelSim](https://www.intel.com/content/www/us/en/software/programmable/quartus-prime/model-sim.html) / [Icarus Verilog](http://iverilog.icarus.com/)
- GTKWave (for waveform viewing)
- Xilinx Vivado / ISE (for FPGA synthesis, optional)

---

## ▶️ How to Simulate

1. **Compile** the Verilog modules:
   ```bash
   iverilog -o tlc.out src/traffic_light_controller.v tb/traffic_light_tb.v
