\# Single-Cycle MIPS Processor



A single-cycle \*\*MIPS processor implemented in VHDL\*\* using \*\*Xilinx ISE\*\*.



The project implements the main hardware components of a MIPS processor and integrates them into a complete datapath capable of executing a subset of MIPS instructions.



\## Overview



The processor follows a single-cycle architecture in which each instruction is fetched, decoded, executed, and completed within one clock cycle.



The implemented datapath supports instructions including:



\* `add`

\* `sub`

\* `slt`

\* `lw`

\* `sw`

\* `beq`



\## Architecture



The processor is built from several hardware modules that work together to form the complete datapath.



\### Main Components



\* ALU

\* Register File

\* Program Counter (PC)

\* Instruction Memory

\* Data Memory

\* Control Unit

\* ALU Control

\* 2-to-1 Multiplexers

\* Sign Extension Unit

\* Shift-Left Unit

\* Adder



\### Datapath



```text

&#x20;                ┌─────────────────┐

&#x20;                │ Program Counter │

&#x20;                └────────┬────────┘

&#x20;                         │

&#x20;                         ▼

&#x20;               ┌───────────────────┐

&#x20;               │ Instruction Memory│

&#x20;               └─────────┬─────────┘

&#x20;                         │

&#x20;             ┌───────────┴───────────┐

&#x20;             │                       │

&#x20;             ▼                       ▼

&#x20;      ┌─────────────┐         ┌──────────────┐

&#x20;      │ Register    │         │ Control Unit │

&#x20;      │ File        │         └──────┬───────┘

&#x20;      └──────┬──────┘                │

&#x20;             │                       │

&#x20;             ▼                       ▼

&#x20;         ┌─────────────────────────────┐

&#x20;         │             ALU             │

&#x20;         └──────────────┬──────────────┘

&#x20;                        │

&#x20;                        ▼

&#x20;                 ┌─────────────┐

&#x20;                 │ Data Memory │

&#x20;                 └──────┬──────┘

&#x20;                        │

&#x20;                        ▼

&#x20;                 ┌─────────────┐

&#x20;                 │ Write Back  │

&#x20;                 └─────────────┘

```



\## Supported Instructions



| Instruction | Type   | Operation             |

| ----------- | ------ | --------------------- |

| `add`       | R-type | Register addition     |

| `sub`       | R-type | Register subtraction  |

| `slt`       | R-type | Set on less than      |

| `lw`        | I-type | Load word from memory |

| `sw`        | I-type | Store word to memory  |

| `beq`       | I-type | Branch if equal       |



\## Project Structure



```text

.

├── MIPS/

├── ALU/

├── PC/

├── reg\_file/

├── control\_unit/

├── alu\_control/

├── instruction\_memory/

├── memory\_unit/

├── MUX\_2\_1/

├── Adder/

├── ShiftLeft/

├── sign\_ext/

└── ...

```



Each module was developed and tested individually before being integrated into the complete processor.



\## Testing



Testbenches were developed for the individual hardware modules and for the complete MIPS processor.



The testbenches were used to verify:



\* ALU operations

\* Register file reads and writes

\* Memory operations

\* Control signals

\* ALU control signals

\* Multiplexer behavior

\* Sign extension

\* Branch operations

\* Complete processor execution



Simulation waveforms were analyzed using Xilinx ISE's simulation tools to identify and debug datapath and control-signal issues.



\## Tools



\* \*\*VHDL\*\*

\* \*\*Xilinx ISE\*\*

\* \*\*ISim\*\*

\* Digital logic design

\* Computer architecture



\## Implementation



The processor was designed by first implementing and testing individual components, including the ALU, register file, memories, control logic, and supporting datapath components.



These modules were then integrated to form the complete single-cycle MIPS datapath.



Simulation was used throughout development to verify functionality and debug incorrect control signals and datapath behavior.

