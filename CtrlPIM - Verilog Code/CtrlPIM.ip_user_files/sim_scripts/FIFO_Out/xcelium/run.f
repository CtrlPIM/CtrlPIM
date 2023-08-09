-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../../../../Downloads/mMPU/Microcoded_mMPU_controller_Final/01_Main Project/Updated Controller_06_07/mMPU_IP_Final/mMPU_uCode_Controller.gen/sources_1/bd/FIFO_Out/sim/FIFO_Out.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

