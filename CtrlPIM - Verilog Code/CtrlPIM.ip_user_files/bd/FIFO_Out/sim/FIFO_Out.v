//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
//Date        : Wed Mar 15 09:26:00 2023
//Host        : ASIC2-LT-002 running 64-bit major release  (build 9200)
//Command     : generate_target FIFO_Out.bd
//Design      : FIFO_Out
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "FIFO_Out,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=FIFO_Out,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "FIFO_Out.hwdef" *) 
module FIFO_Out
   (clk,
    dest_empty,
    dest_full,
    dest_in,
    dest_out,
    mem_op_empty,
    mem_op_full,
    mem_op_in,
    mem_op_out,
    read_enable,
    reset,
    src1_empty,
    src1_full,
    src1_in,
    src1_out,
    src2_empty,
    src2_full,
    src2_in,
    src2_out,
    write_enable);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN FIFO_Out_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk;
  output dest_empty;
  output dest_full;
  input [9:0]dest_in;
  output [9:0]dest_out;
  output mem_op_empty;
  output mem_op_full;
  input [1:0]mem_op_in;
  output [1:0]mem_op_out;
  input read_enable;
  input reset;
  output src1_empty;
  output src1_full;
  input [9:0]src1_in;
  output [9:0]src1_out;
  output src2_empty;
  output src2_full;
  input [9:0]src2_in;
  output [9:0]src2_out;
  input write_enable;

  wire clk_0_1;
  wire [9:0]din_0_1;
  wire [9:0]din_0_2;
  wire [9:0]din_0_3;
  wire [1:0]din_3_1;
  wire [9:0]fifo_generator_0_dout;
  wire [9:0]fifo_generator_0_dout1;
  wire [9:0]fifo_generator_0_dout2;
  wire fifo_generator_0_empty;
  wire fifo_generator_0_empty1;
  wire fifo_generator_0_empty2;
  wire fifo_generator_0_full;
  wire fifo_generator_0_full1;
  wire fifo_generator_0_full2;
  wire [1:0]fifo_generator_3_dout;
  wire fifo_generator_3_empty;
  wire fifo_generator_3_full;
  wire rd_en_0_1;
  wire srst_0_1;
  wire wr_en_0_1;

  assign clk_0_1 = clk;
  assign dest_empty = fifo_generator_0_empty;
  assign dest_full = fifo_generator_0_full;
  assign dest_out[9:0] = fifo_generator_0_dout;
  assign din_0_1 = dest_in[9:0];
  assign din_0_2 = src1_in[9:0];
  assign din_0_3 = src2_in[9:0];
  assign din_3_1 = mem_op_in[1:0];
  assign mem_op_empty = fifo_generator_3_empty;
  assign mem_op_full = fifo_generator_3_full;
  assign mem_op_out[1:0] = fifo_generator_3_dout;
  assign rd_en_0_1 = read_enable;
  assign src1_empty = fifo_generator_0_empty1;
  assign src1_full = fifo_generator_0_full1;
  assign src1_out[9:0] = fifo_generator_0_dout1;
  assign src2_empty = fifo_generator_0_empty2;
  assign src2_full = fifo_generator_0_full2;
  assign src2_out[9:0] = fifo_generator_0_dout2;
  assign srst_0_1 = reset;
  assign wr_en_0_1 = write_enable;
  FIFO_Out_fifo_generator_0_0 fifo_generator_0
       (.clk(clk_0_1),
        .din(din_0_1),
        .dout(fifo_generator_0_dout),
        .empty(fifo_generator_0_empty),
        .full(fifo_generator_0_full),
        .rd_en(rd_en_0_1),
        .srst(srst_0_1),
        .wr_en(wr_en_0_1));
  FIFO_Out_fifo_generator_0_3 fifo_generator_1
       (.clk(clk_0_1),
        .din(din_0_2),
        .dout(fifo_generator_0_dout1),
        .empty(fifo_generator_0_empty1),
        .full(fifo_generator_0_full1),
        .rd_en(rd_en_0_1),
        .srst(srst_0_1),
        .wr_en(wr_en_0_1));
  FIFO_Out_fifo_generator_0_4 fifo_generator_2
       (.clk(clk_0_1),
        .din(din_0_3),
        .dout(fifo_generator_0_dout2),
        .empty(fifo_generator_0_empty2),
        .full(fifo_generator_0_full2),
        .rd_en(rd_en_0_1),
        .srst(srst_0_1),
        .wr_en(wr_en_0_1));
  FIFO_Out_fifo_generator_0_5 fifo_generator_3
       (.clk(clk_0_1),
        .din(din_3_1),
        .dout(fifo_generator_3_dout),
        .empty(fifo_generator_3_empty),
        .full(fifo_generator_3_full),
        .rd_en(rd_en_0_1),
        .srst(srst_0_1),
        .wr_en(wr_en_0_1));
endmodule
