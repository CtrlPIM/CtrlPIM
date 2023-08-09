`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2021 20:40:19
// Design Name: 
// Module Name: RegData_Load
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


module Register_File #(parameter iw_size = 6, 
                                 src_size = 10,
                                 dest_size = 10,
                                 imm_size = 25,
                                 col_size = 10,
                                 row_size = 10,
                                 crossbar_size = 10,
                                 regsize = 10)
    (
    input               clk,
    input   [63:0]      PIM_instr,
    input   [15:0]       instr_type,
    input   [3:0]       mov_dest_bin,
    input   [3:0]       mov_src_bin,
    input   [3:0]       CW_opcode,
    input               PIM_load,
    input               ubr_src1,
    input               ubr_src2,
    input               ubr_iw1,
    input               ubr_iw2,
    input               ubr_dest,
    input               sri_imm,
    
    output reg  [(regsize-1):0]    Reg_File [0:15],             
                                                               // output reg  [9:0]    dest_base,     //Reg_File[0].
                                                               // output reg  [9:0]    src1_base,     //Reg_File[1].
                                                               // output reg  [9:0]    src2_base,     //Reg_File[2].
                                                               // output reg  [9:0]    sr0,           //Reg_File[3].
                                                               // output reg  [9:0]    sr1,           //Reg_File[4].
                                                               // output reg  [9:0]    sr2,           //Reg_File[5].
                                                               // output reg  [9:0]    sr3,           //Reg_File[6].
                                                               // output reg  [9:0]    sr4,           //Reg_File[7].
                                                               // output reg  [9:0]    sr5,           //Reg_File[8].
                                                               // output reg  [9:0]    t_start,       //Reg_File[9].
                                                               // output reg  [5:0]    iw1,           //Reg_File[10].
                                                               // output reg  [5:0]    iw2,           //Reg_File[11].
                                                               // output reg  [9:0]    row_start,     //Reg_File[12].
                                                               // output reg  [9:0]    row_end,       //Reg_File[13].
                                                               // output reg  [9:0]    t_end,         //Reg_File[14].                                                             
   
    output reg  [38:0]   immu, 
    output reg  [21:0]   immediate,    
    output reg  [15:0]   C_start,      
    output reg  [15:0]   C_end,   
    output reg  [9:0]    i_start,      
    output reg  [9:0]    i_end,        
    output reg  [3:0]    opcode,       
    output reg  [9:0]    col_num,       
    output reg  [9:0]    row_num,       
    output reg  [9:0]    crossbar_number,
    output reg           col,
    output reg           Sign,
    output reg           Co
    
    );
    
    
    reg immediate_ld_sel;
    reg iw1_ld_sel;
    reg iw2_ld_sel;
    reg dest_ld_sel;
    reg src1_ld_sel;
    reg src2_ld_sel;
    reg tstart_sel;
    reg tend_sel;
    
    reg start_sel;
    reg end_sel;
    reg col_num_sel;
    reg row_num_sel;
    reg crossbar_number_sel;
    reg cend_sel;
    reg cstart_sel;
    
    reg istart_sel;
    reg iend_sel;
    reg immu_sel;
    
    reg [15:0] Mov_load;
    reg mov_opcode;
    
    reg [5:0] iw_mov;   //temp
    reg [9:0] src_mov;  //temp
    reg [9:0] dest_mov; //temp
    reg [9:0] mov_bus;
    
    reg temp1,temp2,temp3;

    
    assign opcode = PIM_instr[3:0];
    
    always@(PIM_instr)
    begin
    if (PIM_instr[3:0] == 4'b0011)
    begin
    col <= PIM_instr[63];
    temp1 <= PIM_instr[63];
    end
    else 
    begin
    col <= temp1;
    end
    end
    
    always@(PIM_instr)
    begin
    if (PIM_instr[3:0] == 4'b1000 || PIM_instr[3:0] == 4'b1001)
    begin
     Sign <= PIM_instr[63];
     temp2 <= PIM_instr[63];
    end
    else 
    begin
    Sign <= temp2;
    end
    end
    
    
    always@(PIM_instr)
    begin
    if (((PIM_instr[3:0] == 4'b1000) && ((PIM_instr[62:58] == 5'b00100) || (PIM_instr[62:58] == 5'b00110)|| (PIM_instr[62:58] == 5'b00111)|| (PIM_instr[62:58] == 5'b01000))) || ((PIM_instr[3:0] == 4'b1001) && ((PIM_instr[62:58] == 5'b00100) || (PIM_instr[62:58] == 5'b00110))))
    begin
     Co <= 1;
     temp3 <= 1;
    end
    else 
    begin
    Co <= temp3;
    end
    end
    
    always @(CW_opcode)
    begin
        if(CW_opcode == 4'b0001)
            mov_opcode <= 1;
        else
            mov_opcode <= 0;
    end
    
    
    
 
    PIMTranslate_MUX_sel INST1(
    .PIM_instr(PIM_instr),
    .instr_type(instr_type),
    .PIM_load(PIM_load), 
    .clk(clk),
    .immediate_ld_sel(immediate_ld_sel),
    .iw1_ld_sel(iw1_ld_sel),
    .iw2_ld_sel(iw2_ld_sel),
    .dest_ld_sel(dest_ld_sel),
    .src1_ld_sel(src1_ld_sel),
    .src2_ld_sel(src2_ld_sel),
    .tstart_sel(tstart_sel),
    .tend_sel(tend_sel),
    .start_sel(start_sel),
    .end_sel(end_sel),
    .col_num_sel(col_num_sel),
    .row_num_sel(row_num_sel),
    .crossbar_number_sel(crossbar_number_sel),
    .cend_sel(cend_sel),
    .cstart_sel(cstart_sel),
    .istart_sel(istart_sel),
    .iend_sel(iend_sel),
    .immu_sel(immu_sel)
    );
       

   mov_Decoder INST2(
    .mov_dest_bin(mov_dest_bin), 
    .mov_dest_decoder_out(Mov_load) , 
    .enable(mov_opcode)  
    );
    
    

  
 
dest_reg #(dest_size) INST3(  //dest_base
    .D(PIM_instr[13:4]),
    .clk(clk),
    .MOV_in(mov_bus),
    .PIM_load(dest_ld_sel),
    .Update_load(ubr_dest),
    .Mov_load(Mov_load[0]),
    .Q(Reg_File[0])
 );
 
   
 src_reg #(src_size) INST4(     //src1_base
    .D(PIM_instr[29:20]),
    .clk(clk),
    .MOV_in(mov_bus),
    .PIM_load(src1_ld_sel),  //take care of Load condtion with help from flags
    .Update_load(ubr_src1),
    .Mov_load(Mov_load[1]),
    .Q(Reg_File[1])
 );  
 
 src_reg #(src_size) INST5(     //src2_base
    .D(PIM_instr[45:36]),
    .clk(clk),
    .MOV_in(mov_bus),
    .PIM_load(src2_ld_sel),       
    .Update_load(ubr_src2),
    .Mov_load(Mov_load[2]),
    .Q(Reg_File[2])
 );     
    

    
 SR_reg #(dest_size) INST6( 
    .clk(clk),
    .MOV_in(mov_bus),
    .Mov_load(Mov_load[3]),
    .Q(Reg_File[3])
 );
    
  SR_reg #(dest_size) INST7( 
    .clk(clk),
    .MOV_in(mov_bus),
    .Mov_load(Mov_load[4]),
    .Q(Reg_File[4])
 );
 
  SR_reg #(dest_size) INST8( 
    .clk(clk),
    .MOV_in(mov_bus),
    .Mov_load(Mov_load[5]),
    .Q(Reg_File[5])
 );
 
  SR_reg #(dest_size) INST9( 
    .clk(clk),
    .MOV_in(mov_bus),
    .Mov_load(Mov_load[6]),
    .Q(Reg_File[6])
 );
 
  SR_reg #(dest_size) INST10( 
    .clk(clk),
    .MOV_in(mov_bus),
    .Mov_load(Mov_load[7]),
    .Q(Reg_File[7])
 );   
 
   SR_reg #(dest_size) INST11( 
    .clk(clk),
    .MOV_in(mov_bus),
    .Mov_load(Mov_load[8]),
    .Q(Reg_File[8])
 );

  temp_reg #(src_size) INST15(                  //tstart
    .D(PIM_instr[13:4]),
    .MOV_in(mov_bus),
    .clk(clk),
    .Mov_load(Mov_load[9]),
    .PIM_load(tstart_sel),
    .Q(Reg_File[9])
 ); 
 iw_reg #(iw_size) INST12( 
    .D(PIM_instr[19:14]),
    .MOV_in(mov_bus),
    .clk(clk),
    .PIM_load(iw1_ld_sel),
    .Mov_load(Mov_load[10]),
    .Update_load(ubr_iw1),
    .Q(Reg_File[10])
 );  
 
 iw_reg #(iw_size) INST13( 
    .D(PIM_instr[35:30]),
    .MOV_in(mov_bus),
    .clk(clk),
    .Mov_load(Mov_load[11]),
    .PIM_load(iw2_ld_sel),
    .Update_load(ubr_iw1),
    .Q(Reg_File[11])
 ); 

 mask_reg #(src_size) INST17(                  //row_start
    .D(PIM_instr[13:4]),
    .MOV_in(mov_bus),
    .clk(clk),
    .Mov_load(Mov_load[14]),
    .PIM_load(start_sel),
    .Q(Reg_File[12])
 ); 
 
 mask_reg #(src_size) INST18(                   //row_end
    .D(PIM_instr[29:20]),
    .MOV_in(mov_bus),
    .clk(clk),
    .Mov_load(Mov_load[15]),
    .PIM_load(end_sel),
    .Q(Reg_File[13])
 );
 immediate_reg #(imm_size) INST14( 
    .D(PIM_instr[57:36]),                   //22bits
    .clk(clk),
    .PIM_load(immediate_ld_sel),
    .Update_load(sri_imm),
    .Q(immediate)
 );
 
 
 temp_reg #(src_size) INST16(                   //tend
    .D(PIM_instr[29:20]),
    .MOV_in(mov_bus),
    .clk(clk),
    .Mov_load(Mov_load[14]),
    .PIM_load(tend_sel),
    .Q(Reg_File[14])
 );
 
  
 crossbar_reg #(src_size) INST19( 
    .D(PIM_instr[13:4]),                   //cstart
    .clk(clk),
    .PIM_load(cstart_sel),
    .Q(C_start)
 );
 
 crossbar_reg #(src_size) INST20( 
    .D(PIM_instr[29:20]),                   //cend
    .clk(clk),
    .PIM_load(cend_sel),
    .Q(C_end)
 );
 
  L_S_reg #(src_size) INST21( 
    .D(PIM_instr[13:4]),                   //row_num
    .clk(clk),
    .PIM_load(row_num_sel),
    .Q(row_num)
 );
 
 L_S_reg #(src_size) INST22( 
    .D(PIM_instr[29:20]),                   //col_num
    .clk(clk),
    .PIM_load(col_num_sel),
    .Q(col_num)
 );
 
  L_S_reg #(src_size) INST23( 
    .D(PIM_instr[45:36]),                   //crossbar_number
    .clk(clk),
    .PIM_load(crossbar_number_sel),
    .Q(crossbar_number)
 );
 
/*
 INIT_reg #(src_size) INST24( 
    .D(PIM_instr[13:4]),                   //ISET1
    .clk(clk),
    .PIM_load(istart_sel),
    .Q(col_num)
 );
 
 
  crossbar_reg #(src_size) INST25( 
    .D(PIM_instr[41:4]),                   //immu
    .clk(clk),
    .PIM_load(immu_sel),
    .Q(C_end)
 ); 
 
 
 
 
  INIT_reg #(src_size) INST26( 
    .D(PIM_instr[29:20]),                   //ISET2
    .clk(clk),
    .PIM_load(iend_sel),
    .Q(col_num)
 );
*/


 immu_reg #(src_size) INST27( 
    .D(PIM_instr[41:4]),                    //immu
    .clk(clk),
    .PIM_load(immu_sel),
    .Q(immu)
 );

mov_mux_bus #(src_size) INST28(
.in0(Reg_File[0]), 
.in1(Reg_File[1]),            
.in2(Reg_File[2]),            
.in3(Reg_File[3]),            
.in4(Reg_File[4]),
.in5(Reg_File[5]),            
.in6(Reg_File[6]),            
.in7(Reg_File[7]),            
.in8(Reg_File[8]),
.in9(Reg_File[9]),            
.in10(Reg_File[10]),            
.in11(Reg_File[11]),            
.in12(Reg_File[12]),
.in13(Reg_File[13]),            
.in14(Reg_File[14]),            
.in15(Reg_File[15]),            
.sel(mov_src_bin),         
.mux_out(mov_bus)        
    );

    
endmodule
