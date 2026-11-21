# Layered Testbench – Full Adder

A SystemVerilog class-based layered testbench for verifying a 1-bit full adder.

## Files

- `full_adder.sv` – Design under test (DUT)
- `interface.sv` – DUT/testbench signal interface
- `transaction.sv` – Randomized transaction class
- `generator.sv` – Generates 8 input transactions
- `driver.sv` – Drives transactions to the DUT
- `monitor.sv` – Samples DUT inputs and outputs
- `scoreboard.sv` – Checks sum and carry against the full-adder equations
- `environment.sv` – Connects generator, driver, monitor, and scoreboard
- `test.sv` – Starts the environment
- `testbench.sv` – Top-level testbench
- `outputs_screenshots.png` – Example output screenshot

## Simulation

This testbench uses SystemVerilog classes, mailboxes, virtual interfaces, and `randomize()`. Use a simulator with support for these features, such as Verilator 5 or newer. Icarus Verilog does not support all of the required class-randomization and verification features.

Install Verilator and a C++ build toolchain, then run:

```sh
verilator --binary --timing --trace --top-module tb -Wno-fatal testbench.sv
./obj_dir/Vtb
```

A successful run prints `PASS` for each transaction and a final `TEST SUMMARY: 8/8 transactions passed.` A mismatch terminates the simulation with a fatal error.
