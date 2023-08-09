//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
//Date        : Wed Mar 15 09:26:00 2023
//Host        : ASIC2-LT-002 running 64-bit major release  (build 9200)
//Command     : generate_target FIFO_Out_wrapper.bd
//Design      : FIFO_Out_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FIFO_Out_wrapper
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
  input clk;
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

  wire clk;
  wire dest_empty;
  wire dest_full;
  wire [9:0]dest_in;
  wire [9:0]dest_out;
  wire mem_op_empty;
  wire mem_op_full;
  wire [1:0]mem_op_in;
  wire [1:0]mem_op_out;
  wire read_enable;
  wire reset;
  wire src1_empty;
  wire src1_full;
  wire [9:0]src1_in;
  wire [9:0]src1_out;
  wire src2_empty;
  wire src2_full;
  wire [9:0]src2_in;
  wire [9:0]src2_out;
  wire write_enable;

  FIFO_Out FIFO_Out_i
       (.clk(clk),
        .dest_empty(dest_empty),
        .dest_full(dest_full),
        .dest_in(dest_in),
        .dest_out(dest_out),
        .mem_op_empty(mem_op_empty),
        .mem_op_full(mem_op_full),
        .mem_op_in(mem_op_in),
        .mem_op_out(mem_op_out),
        .read_enable(read_enable),
        .reset(reset),
        .src1_empty(src1_empty),
        .src1_full(src1_full),
        .src1_in(src1_in),
        .src1_out(src1_out),
        .src2_empty(src2_empty),
        .src2_full(src2_full),
        .src2_in(src2_in),
        .src2_out(src2_out),
        .write_enable(write_enable));
endmodule
