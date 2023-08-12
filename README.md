# CtrlPIM: A Microcode-Based Controller for Memristive Memory Processing Unit
## Overview
This repository is used to share the technical report and Verilog-HDL code for the following paper,

`A. Tyagi, S. Pinge, A. Borda, R Ben-Hur, R. Ronen and S. Kvatinsky, "CtrlPIM: A Microcode-Based Controller for Memristive Memory Processing Unit," IEEE/ACM Asia and South Pacific Design Automation Conference, 2024` 

## User Information
# Dependencies
The CtrlPIM controller is implemented and packaged into an IP using Verilog-HDL in the Xilinx Vivado 2021.2 software. Alongside Xilinx Vivado, Xilinx Vitis 2021.2 is used to implement the system design used to evaluate the controller.

# Organisation
The repository is organized into the following directories:
- `CtrlPIM - Verilog Code`: Contains all the Verilog-HDL and IP generation files for CtrlPIM.
  - `CtrlPIM.IP`: Contains all the Verilog-HDL files different components in CtrlPIM.
  - `CtrlPIM.hw`: Contains files used by Vivado for debugging on the FPGA.
  - `CtrlPIM.ip_user_files`: Contains other IPs used in the CtrlPIM design.
  - `CtrlPIM.xpr`: Xilinx Vivado project.
  - `Microcode_Memory`: Microcode memory for CtrlPIM.
