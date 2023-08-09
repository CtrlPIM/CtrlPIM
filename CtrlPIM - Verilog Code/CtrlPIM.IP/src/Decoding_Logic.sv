`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2021 02:58:48
// Design Name: 
// Module Name: Decoding_Logic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decoding_Logic(
        input       [31:0]  CW,
        input               start_Load,  
 //       input               clk,
        output              PIM_Load,
        input               Col,
        input               Ziw1,
        input               Ziw2,
        input               Zimm,
        input               Co,
        input               Call,
        input               Sign,

        output reg  [15:0]  decoder_out, 
        output reg  [1:0]   ret_type,      
        output reg          ubr_src1,
        output reg          ubr_src2,
        output reg          ubr_iw1,
        output reg          ubr_iw2,
        output reg          ubr_dest,
        output reg  [6:0]   flag,
        output reg          eqz,
        output reg          S0,
        output reg          S1,
        output reg  [15:0] instr_type
    );

    assign PIM_Load = ret_type[0] | start_Load;
   // assign PIM_Load = ret_type[0] ; //Original
    
    uCode_Decoder INST1(
    .CW_opcode(CW[4:1]), 
    .decoder_out(decoder_out) , 
    .enable(~CW[0])  
    );
    

    ubr_update INST2(
    .ubr_set(decoder_out[0]),    
    .CW(CW[9:5]),
    .ubr_src1(ubr_src1),
    .ubr_src2(ubr_src2),
    .ubr_iw1(ubr_iw1),
    .ubr_iw2(ubr_iw2),
    .ubr_dest(ubr_dest)
    );
 
    flag_check INST3(
     .flag(flag),
     .flag_sel(CW[12:10]),
     .eqz(eqz)
    );
  
  
  AddressMUX_in INST4 (
    .S0(S0),
    .S1(S1),
    .eqz(eqz),
    .D(decoder_out),
    .start_load(start_Load),
    .next_instr(PIM_Load)
    );
    
    
  Flag_Registers INST5(
    .flag(flag),
    .Col(Col),
    .Ziw1(Ziw1),
    .Ziw2(Ziw2),
    .Zimm(Zimm),
    .Co(Co),
    .Call(Call),
    .Sign(Sign),
  //  .clk(clk),
    .flush(decoder_out[8] || PIM_Load || decoder_out[13])
    );

    
    Decoder_1x2 INST6(
.call(flag[5]),
.decoder(ret_type),
.enable(decoder_out[8])
);
    
         
    instruction_type_ld     INST7(
        .CW_type(CW[15:12]),       
        .test_jmp_ld(decoder_out[13]),
        .instr_type(instr_type)  
    );
    
    

    
    
endmodule
