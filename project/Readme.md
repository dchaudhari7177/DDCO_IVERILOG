
# Ring and Johnson Counter with Control Logic

## Project Overview
This project implements a **Ring Counter** and a **Johnson Counter** using Verilog HDL. The counters are controlled via a control logic module, allowing the user to switch between the two counter types dynamically. The design is verified through simulation, with waveform outputs generated for analysis.

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Testbench](#testbench)
- [Usage](#usage)
- [Simulation Results](#simulation-results)
- [Acknowledgments](#acknowledgments)

## Introduction
A Ring Counter is a type of counter where only one flip-flop is set at any given time, which shifts left or right upon each clock pulse. A Johnson Counter, or twisted ring counter, is a modification of the ring counter where the inverted output of the last flip-flop is fed back to the first flip-flop.

This project demonstrates the functionality of both counters, showcasing how they can be utilized in digital systems for counting and state management.

## Project Structure
```
project/
│
├── counter_control.v        // Control logic for switching between counters
├── ring_counter.v           // Implementation of the Ring Counter
├── johnson_counter.v        // Implementation of the Johnson Counter
├── tb_counter_control.v      // Testbench for testing the counters
└── dumpfile.vcd             // VCD file for waveform analysis
```



### Johnson Counter
The Johnson Counter operates similarly, but its feedback is from the inverted output of the last flip-flop.

### Control Logic
The control logic module manages which counter is active based on the mode input.

## Testbench
The testbench (`tb_counter_control.v`) simulates the behavior of the Ring and Johnson counters. It initializes the signals and switches modes while monitoring output states.


## Usage
To run the simulation, follow these steps:

1. Open a terminal and navigate to the project directory.
2. Compile the Verilog files:
   ```bash
   iverilog -o output_file counter_control.v ring_counter.v johnson_counter.v tb_counter_control.v
   ```
3. Run the simulation:
   ```bash
   vvp output_file
   ```
4. Open the waveform viewer:
   ```bash
   gtkwave dumpfile.vcd
   ```

## Simulation Results
Upon running the simulation, you will see output printed in the command line, and the waveform viewer will display the state changes of the counters.

### Example Output
```
Time = 0 | mode = 0 | q = 1000
Time = 10 | mode = 0 | q = 0100
Time = 20 | mode = 0 | q = 0010
...
Time = 60 | mode = 1 | q = 0111
...
```

## Acknowledgments
- [Verilog HDL](https://en.wikipedia.org/wiki/Verilog) - for hardware description language support.
- Open-source tools like Icarus Verilog and GTKWave for simulation and waveform visualization.

