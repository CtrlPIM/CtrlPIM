`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2021 20:18:24
// Design Name: 
// Module Name: Top_Module
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


module CtrlPIM
#(parameter 
            iw_size = 6, 
            src_size = 10,
            dest_size = 10,
            imm_size = 25,
            col_size = 10,
            row_size = 10,
            crossbar_width = 16,
            regsize = 10,
            num_crossbar = 64,
            no_of_wordlines = 1024     
            no_of_bitlines = 1024)      


(PIM_instr,mMPU_commands,clk, 
clk_crossbar, mux_addr, CW,
PIM, fifo_empty);

    input         [63:0]                        PIM_instr;
    input                                       clk;
    output                                      clk_crossbar;
    output        [33:0]                        mMPU_commands; 
    output                                      PIM; 
    output fifo_empty;
    
    input [31:0] CW;
    output reg [15:0] mux_addr;
    
   // wire clk_crossbar;
    
            reg              start_Load;
       //     reg   [31:0]     CW;
            reg   [6:0]      flag;
            reg              eqz;
            reg              S0;
            reg              S1; 
            reg    [9:0]     dest_addr;
            reg    [1:0]     mem_op;
            reg    [9:0]     src1_addr;
            reg    [9:0]     src2_addr; 
   
            reg    [63:0]    PIM_instr;
            reg    [63:0]    instr_addr;
            reg                 PIM_addr;
            reg SE;
            
  
    
            reg                     ubr_src1;
            reg                     ubr_src2;
            reg                     ubr_iw1;
            reg                     ubr_iw2;
            reg                     ubr_dest;
            reg  [(regsize-1):0]    Reg_File [0:15];
            reg  [21:0]             immediate; 
            reg  [15:0]             decoder_out;    
            reg  [3:0]              opcode;       
            reg  [9:0]              col_num;       
            reg  [9:0]              row_num;       
            reg  [9:0]              crossbar_number;
            reg  [9:0]              C_start;      
            reg  [9:0]              C_end;   
            reg  [9:0]              i_start;      
            reg  [9:0]              i_end; 
            reg  [15:0]             instr_type;
            reg                     col;


            reg               Ziw1;
            reg               Ziw2;
            reg               Zimm;
            reg               Co;
            reg               Call;
            reg               Sign;
            reg Co_PIM;
            reg sign_PIM;
            reg col_PIM;
    



Register_File #(iw_size,
                src_size,
                dest_size,
                imm_size,
                col_size,
                row_size,
                crossbar_width,
                regsize) INST1 (
            .clk(clk),
            .PIM_instr(PIM_instr),
            .instr_type(instr_type),
            .PIM_load(PIM || decoder_out[13]),
            .mov_dest_bin(CW[13:10]),
            .mov_src_bin(CW[17:14]),
            .ubr_src1(ubr_src1),
            .ubr_src2(ubr_src2),
            .ubr_iw1(ubr_iw1),
            .ubr_iw2(ubr_iw2),
            .ubr_dest(ubr_dest),
            .sri_imm(decoder_out[2]),
            .Reg_File(Reg_File),  
            .immediate(immediate),     
            .opcode(opcode),       
            .col_num(col_num),       
            .row_num(row_num),       
            .crossbar_number(crossbar_number),
            .C_start(C_start),      
            .C_end(C_end),   
            .i_start(i_start),      
            .i_end(i_end),
            .col(col_PIM),
            .Sign(sign_PIM),
            .Co(Co_PIM)
    );
    
    
    
  Address_Sequencing #(16) INST2 (
            .opcode(opcode),
            .CW(CW),
            .mux_addr(mux_addr),
            .clk(~clk),  
            .stack_empty(SE),
            .uCode_Addr({S1,S0}),
            .stack_push(decoder_out[11]),
            .stack_pop((Call)&&(decoder_out[8])),
            .function4bit(PIM_instr[62:59]),
            .function5bit(PIM_instr[62:58]),
            .branch_type(decoder_out[11]|| decoder_out[13]),
            .load_ret_addr(0)
            ); 



Decoding_Logic INST3(
            .CW(CW),  
            .start_Load(start_Load),
            .PIM_Load(PIM),
            .Col(col),
            .Ziw1(Ziw1),
            .Ziw2(Ziw2),
            .Zimm(Zimm),
            .Co(Co),
            .Call(Call),
            .Sign(Sign),
            .decoder_out(decoder_out),       
            .ubr_src1(ubr_src1),
            .ubr_src2(ubr_src2),
            .ubr_iw1(ubr_iw1),
            .ubr_iw2(ubr_iw2),
            .ubr_dest(ubr_dest),
            .flag(flag),
            .eqz(eqz),
            .S0(S0),
            .S1(S1),
            .instr_type(instr_type)
    );
    
    
    
    flag_update INST4(
            .col_PIM(col_PIM),
            .iw1(Reg_File[10]), 
            .iw2(Reg_File[11]),
            .imm_in(immediate[0]),
            .Co_PIM(Co_PIM),
            .call_mux(~SE),
            .sign_PIM(sign_PIM),             
            .Col(col),
            .Ziw1(Ziw1),
            .Ziw2(Ziw2),
            .Zimm(Zimm),
            .Co(Co),
            .Call(Call),
            .Sign(Sign)        
    );
    
    
    
    memory_addressing #(10) INST5(
            .dest_base(Reg_File[0]),
            .src1_base(Reg_File[1]),
            .src2_base(Reg_File[2]),
            .temp_start(Reg_File[9]),
            .dest_sel(CW[3]),
            .src1_sel(CW[13:12]),
            .src2_sel(CW[23:22]),
            .clk(clk),
            .mem_op(mem_op),
            .reset(start_Load),
            .CW(CW),
            .dest_addr(dest_addr),
            .src1_addr(src1_addr),
            .src2_addr(src2_addr),
            .read(clk_crossbar),
            .fifo_empty(fifo_empty)
    );
    
    mMPU_command_buffer #(dest_size, src_size, crossbar_width)(
            .clk(clk),
            .mem_op(mem_op),
            .dest_addr(dest_addr),
            .src1_addr(src1_addr),
            .src2_addr(src2_addr),
            .start(Reg_File[12]),
            .end(Reg_File[13]),
            .cstart(C_start),
            .cend(C_end),
            .mMPU_command(mMPU_commands),
            .col(col)
    );  
  
    start_load INST10(
            .clk(clk),
            .start_Load(start_Load)
    );  
 
    clk_crossbar INST11(
            .clk(clk),
            .clk_crossbar(clk_crossbar)
    );    

endmodule



