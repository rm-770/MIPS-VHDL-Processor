# Single-Cycle MIPS Processor

A **single-cycle MIPS processor implemented in VHDL** using **Xilinx ISE**. The processor was built from individual RTL modules and integrated into a complete datapath capable of executing arithmetic, memory, and branch instructions.

## Features

* Single-cycle MIPS datapath
* Modular RTL design in VHDL
* Register file with register read/write operations
* Arithmetic and logical ALU operations
* Instruction and data memory
* Centralized instruction decoding and control logic
* Branch address calculation
* Immediate-value sign extension
* Module-level and processor-level testbenches
* Simulation and debugging using ISim waveforms

### Supported Instructions

| Instruction | Operation            |
| ----------- | -------------------- |
| `add`       | Register addition    |
| `sub`       | Register subtraction |
| `slt`       | Set on less than     |
| `lw`        | Load word            |
| `sw`        | Store word           |
| `beq`       | Branch if equal      |

## Architecture

The processor follows a conventional single-cycle MIPS datapath:

```text
                    ┌─────────────────┐
                    │ Program Counter │
                    └────────┬────────┘
                             │
                             ▼
                   ┌───────────────────┐
                   │ Instruction Memory│
                   └─────────┬─────────┘
                             │
                  ┌──────────┴──────────┐
                  │                     │
                  ▼                     ▼
           ┌─────────────┐      ┌──────────────┐
           │ Register    │      │ Control Unit │
           │ File        │      └──────┬───────┘
           └──────┬──────┘             │
                  │                    │
                  └─────────┬──────────┘
                            ▼
                    ┌─────────────┐
                    │     ALU     │
                    └──────┬──────┘
                           │
                           ▼
                    ┌─────────────┐
                    │ Data Memory │
                    └──────┬──────┘
                           │
                           ▼
                    ┌─────────────┐
                    │  Write Back │
                    └─────────────┘
```

## Design

The processor was developed as a collection of independent hardware modules before being integrated into the top-level MIPS design.

### Core Modules

* **Program Counter** — Maintains the address of the current instruction.
* **Instruction Memory** — Supplies instructions to the processor.
* **Register File** — Provides register read and write functionality.
* **ALU** — Performs arithmetic and comparison operations.
* **Control Unit** — Generates the main control signals based on the instruction opcode.
* **ALU Control** — Determines the specific ALU operation.
* **Data Memory** — Handles memory accesses for load and store instructions.
* **Sign Extension** — Extends immediate values to the required datapath width.
* **Adders** — Used for sequential PC updates and branch-address calculations.
* **Shift Left** — Used in branch target address generation.
* **Multiplexers** — Control the selection of datapath inputs.

## Verification

Each major component was tested independently before integration into the complete processor.

The full processor was then simulated using **ISim**, with waveform analysis used to verify datapath behavior and debug integration issues.

Verification included:

* ALU arithmetic and comparison operations
* Register file reads and writes
* Instruction decoding
* Control-signal generation
* Load/store operations
* Branch behavior
* Datapath signal propagation
* Processor-level instruction execution

## Project Structure

```text
MIPS/
├── ALU/
├── MIPS/
├── PC/
├── reg_file/
├── instruction_memory/
├── memory_unit/
├── control_unit/
├── alu_control/
├── MUX_2_1/
├── Adder/
├── ShiftLeft/
├── sign_ext/
└── testbenches/
```

The repository contains the VHDL source files and project configuration required to inspect the individual modules and processor design.

## Technologies

**Hardware Description Language**

* VHDL

**Development & Simulation**

* Xilinx ISE
* ISim

**Concepts**

* RTL design
* CPU datapath architecture
* MIPS instruction execution
* Digital logic
* Combinational and sequential logic
* Hardware modularization
* Testbench development
* Waveform-based debugging

## What I Learned

This project provided hands-on experience with the internal structure of a processor, from individual RTL components to a functioning instruction datapath.

Key areas included:

* Translating processor architecture into RTL
* Designing hardware modules with clear interfaces
* Connecting datapath components through control signals
* Understanding how instructions propagate through a CPU
* Debugging hardware behavior through simulation waveforms
* Integrating independently tested modules into a larger digital system

## Project Status

**Completed**

The processor and its major supporting modules have been implemented and tested through simulation.
