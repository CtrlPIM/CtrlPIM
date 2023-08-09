`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.06.2022 21:24:18
// Design Name: 
// Module Name: axis_mMPU_v4
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


module CtrlPIM_AXIS #(parameter iw_size = 6, 
                                src_size = 10,
                                dest_size = 10,
                                imm_size = 25,
                                col_size = 10,
                                row_size = 10,
                                crossbar_width = 16,
                                regsize = 10,
                                num_crossbar = 64,
                                no_of_wordlines = 1024,
                                no_of_bitlines =  1024)

            (output                                     PIM,
             input                                      clk,
             input [63:0]                               s_PIM_instr,
             input                                      s_axis_valid_PIM_instr, 
             output                                     s_axis_ready_PIM_instr,  
             input                                      m_axis_ready_mMPU_command, 
             output reg                                 m_axis_valid_mMPU_command,
             output reg [33:0]                          m_axis_mMPU_command,
             output     [15:0]                          ctrl_m_addr,
             input      [31:0]                          ctrl_m_word,
             input                                      enable
             );
    wire         clk_crossbar;
    wire         fifo_empty; 
    wire         PIM_wire;
    reg [63:0]   PIM_instr;  
    
    wire [33:0] mMPU_commands;

    wire [31:0] ctrl_m_word_wire;
    wire [15:0] ctrl_m_addr_wire;
     
    reg [1:0] state;
     
    localparam IDLE = 2'b00,
               FIRST = 2'b01,
               SECOND = 2'b10,
               THIRD = 2'b11;
     
    assign PIM = enable ? PIM_wire : 0;
    assign s_axis_ready_PIM_instr = enable ? PIM_wire : 0; 
    
    assign ctrl_m_addr      = enable ? ctrl_m_addr_wire : 16'b0;
    assign ctrl_m_word_wire = enable ? ctrl_m_word : 32'b0;

    always @(posedge clk)
    begin
        if(!enable)
            PIM_instr <= 64'd0;
        else
        begin
            if(s_axis_valid_PIM_instr & s_axis_ready_PIM_instr)
            begin
                PIM_instr <= s_PIM_instr; 
            end
        end         
    end
         
    always@(posedge clk)
    begin
        if(!enable)
        begin
            m_axis_valid_mMPU_command <= 0;
            m_axis_mMPU_command <= 0;
        end
        else
        begin
            state <= IDLE;                      
            case(state)
                IDLE:
                begin                  
                    if(clk_crossbar ==1 && (fifo_empty == 0))
                    begin 
                        state <= FIRST;
                        m_axis_valid_mMPU_command <= 0;
                    end 
                    else
                    begin 
                        state <= IDLE;
                        m_axis_valid_mMPU_command <= 0;
                    end                           
                end 
                FIRST:
                begin
                    state <= SECOND;
                end
                SECOND:
                begin                  
                    state <= IDLE;
                    m_axis_valid_mMPU_command <= 1;
                    m_axis_mMPU_command <= mMPU_commands;
                end      
            endcase
        end
    end
      

CtrlPIM
#(iw_size, src_size, dest_size,  imm_size, col_size, row_size, crossbar_width, regsize, num_crossbar, no_of_wordlines, no_of_bitlines)      
INST1(      
              .clk(clk), 
              .PIM_instr(PIM_instr),
              .mMPU_commands(mMPU_commands),
              .PIM(PIM_wire),
              .clk_crossbar(clk_crossbar),
              .mux_addr(ctrl_m_addr_wire), 
              .CW(ctrl_m_word_wire),
              .fifo_empty(fifo_empty)
    );

endmodule